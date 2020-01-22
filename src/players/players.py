#!/usr/bin/env python
# -*- coding: utf-8 -*-

import abc
from py_utils.colors import *
from random import seed
from random import randint
from collections import defaultdict
from structures.game import *
from structures.state import *
from py_utils.clingo_utils import *
from .min_max_asp import *

class Player(abc.ABC):
    """
    A class used to represent an player that chooses an action in a state

    Attributes
    ----------
    """
    @abc.abstractclassmethod
    def choose_action(self, state):
        pass

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
    strategy_path: The path to the file with the strategy
    """
    def __init__(self, strategy_path):
        self.strategy=strategy_path

    def choose_action(self,state):
        return state.legal_actions[0]

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
        self.learned = ""

    def choose_action(self,state):
        #TODO Give a time limit and save learned rules
        initial = fluents_to_asp_syntax(state.fluents,0)
        match, tree, ex, ls = get_minmax_init(self.game_def,self.main_player,initial)
        self.learned+= "\n".join(ls)
        action_name = symbol_str(match.steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if symbol_str(l_a.action) == action_name][0]
        return action

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


class MLPlayer(Player):
    """
    ML Player chooses an action given a model

    Attributes
    ----------
    model: The trained model
    """
    def __init__(self, model):
        # self.game = Game(path)
        self.model = model

    def choose_action(self,state):
        pass
       #  self.game.current_state = state
       #  obs = self.game.current_observation
       # TODO Check if ok
       #  action_idx = self.model.forward(obs)
       #  action_str =  symbol_str(self.game.all_actions[action_idx])
       #  legal_action = self.game.current_state.get_legal_action_from_str(action_str)
       #  if not legal_action:
           #  action_idx = self.game.sample_random_legal_action
           #  action_str =  symbol_str(self.game.all_actions[action_idx])
           #  print(paint("\t Selected random instead action: {}".format(action_str),bcolors.FAIL))
           #  return self.game.current_state.get_legal_action_from_str(action_str)
       #  return legal_action
