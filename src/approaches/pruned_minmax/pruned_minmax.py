#!/usr/bin/env python
# -*- coding: utf-8 -*-
from collections import defaultdict
import clingo
import operator
from structures.match import Match
from structures.treeMinmax import TreeMinmax
from anytree import RenderTree
from py_utils.clingo_utils import Context, generate_example, generate_rule, get_new_control
from py_utils.logger import log
from structures.state import State
from structures.action import Action
from structures.match import Match
from structures.step import Step


case = {
    'a':{
        'a': {
            'optimization': "#maximize{N,T:goal(a,N,T)}.",
            'current_is_better': operator.gt
        },
        'b': {
            'optimization': "#minimize{N,T:goal(a,N,T)}.",
            'current_is_better': operator.lt
        }
    },
    'b':{
        'a': {
            'optimization': "#minimize{N,T:goal(b,N,T)}.",
            'current_is_better': operator.lt
        },
        'b': {
            'optimization': "#maximize{N,T:goal(b,N,T)}.",
            'current_is_better': operator.gt
        }
    },
}

gdl_rule = "{does(P,A):best_do(P,A),legal(P,A)}=1:-not terminal,{best_do(P,A)}>0,true(control(P)).\n"
holds_rule = "{does(P,A,T):best_do(P,A,T),legal(P,A,T)}=1:-not terminal(T),#count{1:best_do(P,A,T),legal(P,A,T)}>0,holds(control(P),T).\n"
def match_from_time_model(model, game_def, main_player = None):
    """
    Given a stabel model for the full time representation of the game,
    the functions creates a match with each action taken.

    Args:
        model: Stable model from the full time representation
        game_def: The game definition
        main_player: The player for which we aim to minmax
    """
    atoms = model.symbols(atoms=True)
    fluent_steps = defaultdict(lambda: {'fluents':[],'goals':[],
                                        'action':None})
    for a in atoms:
        if(a.name == "goal"):
            time = a.arguments[2].number
            fluent_steps[time]['goals'].append(a)
        elif(a.name=="holds"):
            time = a.arguments[1].number
            fluent_steps[time]['fluents'].append(a.arguments[0])
        elif(a.name=="does"):
            time = a.arguments[2].number
            fluent_steps[time]['action'] = a
    fluent_steps = dict(fluent_steps)
    steps = []
    for i in range(len(fluent_steps)):
        state = State(fluent_steps[i]['fluents'],fluent_steps[i]['goals'],
                        game_def)
        action = None
        if(not fluent_steps[i]['action']):
            pass
        else:
            action = Action(fluent_steps[i]['action'].arguments[0].name,
                            fluent_steps[i]['action'].arguments[1])
        step = Step(state,action,i)
        steps.append(step)
    steps[-1].state.is_terminal = True
    # steps[-1].set_score_player(main_player)
    # steps[-2].set_score_player(main_player)
    # steps[-2].state.goals = steps[-1].state.goals
    # steps =steps[:-1]
    
    return Match(steps)
    
def get_match(game_def, optimization, fixed_atoms, learned_rules, main_player):
    """
    Makes a clingo call to compute the match for the fixed atoms 
    and the player optimization.
    """
    ctl = get_new_control(game_def)
    # Check if it can load from grounded atoms gotten from AS
    ctl.load(game_def.full_time)
    ctl.add("base",[],fixed_atoms)
    if not (learned_rules is None):
        apply_rules_rule=holds_rule
        ctl.add("base",[],"".join([apply_rules_rule]+learned_rules))
    ctl.add("base",[],optimization)
    ctl.ground([("base", [])], context=Context())
    with ctl.solve(yield_=True) as handle:
        matches = []
        models = []
        for model in handle:
            matches.append(match_from_time_model(model,game_def,main_player))
            models.append(model)
        if len(matches) == 0:
            return None
        return matches[-1]

def get_minmax_init(game_def, main_player, initial, learning_rules = True, learning_examples = False,
                    generating_training = False, extra_fixed = ""):
    """
    Computes the minmax using multiple calls to clingo.
    Args:
        - game_def: Game definition
        - main_player: The name of the main player,
          must have control in the initial state
        - initial: The initial state
    Returns:
        - Tuple (minmax_match, minmax_tree, examples_list)
        - minmax_match: A match representing the minmax match
          correspunding to the best scenario when the other player tries to win.
        - minmax_tree: The search tree with the parts that where
          required to compute
        - examples_list: The list of examples for ILASP
        - learned_rules: The list of rules learned
    """
    match  = get_match(game_def,case[main_player][main_player]['optimization'],
                       initial+extra_fixed,[],'a')
    examples_list = [] if learning_examples else None
    learned_rules = [] if learning_rules else None
    training_list = [] if generating_training else None
    node = TreeMinmax.node_from_match_initial(match,main_player)
    try:
        minmax_match, minmax_tree = get_minmax_rec(game_def,match,node,0,
                                                main_player,
                                                learned_rules=learned_rules,
                                                list_examples=examples_list,
                                                training_list=training_list, old_fixed=extra_fixed)
    except TimeoutError as ex:
        return None, None, examples_list, learned_rules, training_list
     
    minmax_tree=TreeMinmax(minmax_tree.parent,main_player=main_player)
    final_score = minmax_match.goals[main_player]
    # minmax_match.steps[0].set_score(final_score)
    minmax_tree.root.set_score(final_score)
    return minmax_match, minmax_tree, examples_list, learned_rules, training_list

def get_minmax_rec(game_def, match, node_top, top_step, main_player,
                   old_fixed='', learned_rules=None, level = 0,
                   list_examples=None, training_list = None):
    """
    Computes the recursive call to compute the minmax with asp
    Args:
        - game_def: Game definition
        - match: The calculated match that we wish to prune into a real minmax
        - node_top: The node that corresponds to the top of the tree
        - top_step: Number indicating the maximum level to reach going up
          for which the actions are fixed
        - main_player: The player we aim to maximize
        - old_fixed: The fixed facts to represent the position on the
          tree search
        - learned_rules: The rules learned for the tree
        - level: The recursion level
    """
    steps_to_analyze = match.steps[top_step:-1]
    minmax_match = match
    node_top = node_top.leaves[0]

    for step in steps_to_analyze[::-1]:
        node_top = node_top.parent
        i = step.time_step
        control = step.state.control
        ##Fix all current and explore other actions
        fixed = old_fixed
        fixed += ''.join(s.to_asp_syntax() for s in match.steps[0:i])
        fixed += match.steps[i].fluents_to_asp_syntax()
        fixed += 'not ' + match.steps[i].action_to_asp_syntax()
        current_goal = minmax_match.goals[main_player]
        #Get optimal match (Without minimizing for second player)
        opt_match  = get_match(game_def,case[main_player][control]
                               ['optimization'],fixed,learned_rules,main_player)
        # Score is current goal unless proved other
        node_top.set_score(current_goal)
        if(not opt_match):
            # No more actions possible
            minmax_match.generate_train(training_list,i) #Orange
            continue
        #Compute tree for optimal match
        opt_node = TreeMinmax.node_from_match(Match(opt_match.steps[i:]),main_player)
        opt_node.parent = node_top.parent
        if not (main_player in opt_match.goals):
            log.error("No goals reached for match")
            log.error(opt_match)
            raise RuntimeError("No terminal state reach, try increasing number of time steps")
        new_goal = opt_match.goals[main_player]
        if case[main_player][control]['current_is_better'](current_goal,
                                                           new_goal):
            # Choosing other action gets a worst result in the best case
            generate_example(list_examples, match.steps[i].state,match.steps[i].action,
                                    opt_match.steps[i].action)
            generate_rule(learned_rules, game_def,match.steps[i].state,
                                     match.steps[i].action)
            
            minmax_match.generate_train(training_list,i) #Green 
            # Minmax was fixed, set score without minimizing
            # opt_node.set_score(new_goal)
            continue
        if new_goal == current_goal:
            # Other action is as best as good as this one,
            # this section will remain unexplored
            minmax_match.generate_train(training_list,i) #Purple
            continue
        ##### New match is potentially better
        #Get real minmax for optimal match (minimize for other player)
        opt_minmax, opt_minmax_tree = get_minmax_rec(game_def,opt_match,
                                                     opt_node, i,main_player,
                                                     fixed,learned_rules,
                                                     level+1,list_examples,
                                                     training_list)
        # print("Real minmax tree from {} {}".format(i))
        # print(opt_minmax.goals)
        # opt_minmax.generate_train(training_list,i) #Red Redundant
        opt_minmax_tree.parent = node_top.parent
        new_goal = opt_minmax.goals[main_player]
        if case[main_player][control]['current_is_better'](current_goal,
                                                           new_goal):
            # Choosing other action gets a worst result in the best case
            generate_example(list_examples, match.steps[i].state,match.steps[i].action,
                                    opt_minmax.steps[i].action)
            generate_rule(learned_rules, game_def,match.steps[i].state,
                                     match.steps[i].action)
            minmax_match.generate_train(training_list,i) #???? 
            
            continue
        if new_goal == current_goal:
            # Other action is as best as good as this one,
            # this section will remain unexplored
            minmax_match.generate_train(training_list,i) #Yellow
            continue
        #### New match is better for current player maximized
        generate_example(list_examples, match.steps[i].state,opt_minmax.steps[i].action,
                                match.steps[i].action)
        generate_rule(learned_rules, game_def,match.steps[i].state,
                                 opt_minmax.steps[i].action)
        minmax_match.generate_train(training_list,i) #Low blue
        node_top.parent.set_score(new_goal)
        
        #Update minmax match
        minmax_match = opt_minmax
    return minmax_match, node_top
