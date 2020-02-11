#!/usr/bin/env python
# -*- coding: utf-8 -*-
from importlib.machinery import SourceFileLoader
from py_utils.logger import log
import abc
from py_utils.colors import *
from random import seed
from random import randint
from collections import defaultdict
from structures.state import State, StateExpanded
# from min_max_asp.player import MinmaxASPPlayer
# from min_max.player import MinmaxPlayer
# from ml_agent.player import RLPlayer

import os
player_files = []
for r, d, f in os.walk('./'):
    for file in f:
        if 'player.py' in file:
            player_files.append(os.path.join(r, file))

class Player(abc.ABC):
    """
    A class used to represent an player that chooses an action in a state

    Attributes
    ----------
    """
    def __init__(self,strategy=None):
        self.strategy = strategy
    
    @staticmethod
    def match_name(name):
        raise NotImplementedError

    def get_name(self):
        return self.__class__.__name__

    def choose_action(self, state):
        raise NotImplementedError

    @classmethod
    def from_config(cls, config, game_def=None):
        for c in player_files:
            SourceFileLoader(c, c).load_module()
        # SourceFileLoader("namito", "min_max_asp/player.py").load_module()
        sub_clsses = set(cls.__subclasses__())
        config['game_def']=game_def
        for c in sub_clsses:
            if c.match_name(config['name']):
                log.debug("Creating player from class {}".format(c.__name__))
                return c(config)
        
        raise RuntimeError("No subclass of Player matched {}".format(config['name']))

class HumanPlayer(Player):
    """
    Human player shows the list of actions to the user to select one

    Attributes
    ----------
    """
    def __init__(self, config):
        super().__init__()

    @staticmethod
    def match_name(name):
        return name=="human"

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
    def __init__(self, config):
        strategy= config['name'][9:]
        super().__init__(strategy=strategy)
        
    @staticmethod
    def match_name(name):
        return name[:8]=="strategy"

    def get_name(self):
        return "Strategy using asp file: {}".format(self.strategy)

    def choose_action(self,state):
        return state.legal_actions[-1]

class RandomPlayer(Player):
    """
    Random Player chooses a random move

    Attributes
    ----------
    """
    def __init__(self, config):
        super().__init__()

    @staticmethod
    def match_name(name):
        return name=="random"

    def choose_action(self,state):
        index = randint(0,len(state.legal_actions)-1)
        return state.legal_actions[index]