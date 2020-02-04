#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils.logger import log
import abc
from py_utils.colors import *
from random import seed
from random import randint
from collections import defaultdict
from structures.game import Game
from structures.state import State, StateExpanded
from py_utils.clingo_utils import *
from py_utils.min_max_asp import get_match, get_minmax_init
from .tree import Tree

class Player(abc.ABC):
    """
    A class used to represent an player that chooses an action in a state

    Attributes
    ----------
    """
    @abc.abstractclassmethod
    def choose_action(self, state):
        pass

    @classmethod
    def from_config(cls, config, game_def=None):
        config = defaultdict(lambda: None,config)
        if(config['name']=="human"):
            return HumanPlayer()
        if(config['name'][:8]=="strategy"):
            return StrategyPlayer(game_def,config['name'][8:])
        if(config['name']=="random"):
            return RandomPlayer(config['seed'])
        if(config['name']=="minmax_asp"):
            return MinmaxASPPlayer(game_def, config['main_player'])
        if(config['name']=="minmax"):
            return MinmaxPlayer(game_def, config['main_player'])
        if(config['name'][:2]=="rl"):
            from rl_agent.rl_instance import RLInstance
            model = RLInstance.from_file(config['name'][3:])
            return RLPlayer(model,config['main_player'])


class HumanPlayer(Player):
    """
    Human player shows the list of actions to the user to select one

    Attributes
    ----------
    """
    def __init__(self):
        self.strategy=None

    def choose_action(self,state):
        print(bcolors.REF)

        print('\t'.join(state.str_step_options.splitlines(True)))
        #TODO make more resistent to errors
        action_index = int(input("\t - - - > Select action" +
                                 " by entering the index number: "))
        print(bcolors.ENDC)
        return state.legal_actions[action_index]

class StrategyPlayer(Player):
    """
    Strategy Player follows the strategy defined on a file via weak constraints

    Attributes
    ----------
    strategy_name: The name of the strategy file inside the game def.
    """
    def __init__(self, game_def, strategy_name):
        
        if strategy_name == "":
            self.strategy=game_def.path + "/strategy.lp"
        else:
            self.strategy=game_def.path + "/strategy" + strategy_name + ".lp"
        

    def choose_action(self,state):
        return state.legal_actions[-1]

class RandomPlayer(Player):
    """
    Random Player chooses a random move

    Attributes
    ----------
    seed: An optional seed for the random reneration
    """
    def __init__(self, seed_n=None):
        if seed_n: seed(int(seed_n))
        self.strategy=None

    def choose_action(self,state):
        index = randint(0,len(state.legal_actions)-1)
        return state.legal_actions[index]

class MinmaxASPPlayer(Player):
    """
    Player that choses an action using the minmax of asp

    Attributes
    ----------
    seed: An optional seed for the random reneration
    """
    def __init__(self, game_def, main_player):
        self.game_def = game_def
        self.main_player =  main_player
        self.strategy= None
        self.learned = "{does(P,A,T):best_do(P,A,T)}=1:-time(T),not holds(goal(_,_),T),{best_do(P,A,T)}>0,true(control(P)).\n"

    def choose_action(self,state):
        initial = fluents_to_asp_syntax(state.fluents,0)
        match, tree, ex, ls, tl = get_minmax_init(self.game_def,self.main_player,initial,extra_fixed=self.learned)
        self.learned+= "\n".join(ls)
        action_name = symbol_str(match.steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if symbol_str(l_a.action) == action_name][0]
        return action
color_p = {"a":bcolors.HEADER,"b":bcolors.OKBLUE}

class MinmaxPlayer(Player):
    """
    Player that choses an action using the classic minmax computation

    Attributes
    ----------
    """
    def __init__(self, game_def,main_player):
        self.game_def = game_def
        self.main_player = main_player
        self.strategy= None

    def choose_action(self,state):
        #TODO Give a time limit and save learned rules
        tree = Tree()
        tree.from_game_def(self.game_def,initial_state=state,main_player=self.main_player)
        next_steps = [c.name for c in tree.root.children if c.name.score==tree.root.name.score]
        action_name = symbol_str(next_steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if symbol_str(l_a.action) == action_name][0]
        return action


class RLPlayer(Player):
    """
    RL Player chooses an action given a model trained with rl

    Attributes
    ----------
    model: The trained model of instance RLInstance
    """
    def __init__(self, model, main_player):
        # self.game = Game(path)
        self.model = model
        self.main_player = main_player
        self.strategy = None

    @property 
    def game(self):
        return self.model.env.game

    def choose_action(self,state):
        self.game.current_state = state
        obs = self.game.current_observation
        # TODO Check if ok
        action_idx = self.model.agent.forward(obs)
        action_str =  symbol_str(self.game.all_actions[action_idx])
        legal_action = self.game.current_state.get_legal_action_from_str(action_str)
        if not legal_action:
            log.debug("RL Player select a non leagal action")
            action_idx = self.game.sample_random_legal_action
            action_str =  symbol_str(self.game.all_actions[action_idx])
            log.debug(paint("\t Selected random instead action: {}".format(action_str),bcolors.FAIL))
            
            return self.game.current_state.get_legal_action_from_str(action_str)
        return legal_action


class MLPlayer(Player):
    """
    ML Player chooses an action given a model trained with supervised learning

    Attributes
    ----------
    model: The trained model
    """
    def __init__(self, model, main_player):
        # self.game = Game(path)
        self.model = model
        self.main_player = main_player
        self.strategy = None

    def choose_action(self,state):
        #Use a Game to transform state into observation (Allways based on player a in control)
        #Pass all legal actions tru model
        #Get action with better result
        #Return index of such action
        return 0