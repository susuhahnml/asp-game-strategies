#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from .step import Step
from .action import Action, ActionExpanded
from py_utils.clingo_utils import  *
from py_utils.colors import *
from collections import defaultdict

class State:
    """
    A class used to represent a State on the game

    Attributes
    ----------
    fluents : list(string)
        the name of the animal
    terminal : boolean
        true if the state is terminal
    goals : dic
        A dictionary with the reward per player name
    control : name of the player in turn
    """
    def __init__(self, fluents, goals, game_def, is_terminal = False):
        self.fluents = fluents
        self.fluents_str = [symbol_str(n) for n in fluents]
        self.is_terminal = is_terminal
        self.goals = {g.arguments[0].name: g.arguments[1].number for g in goals}
        self.control = [f.arguments[0].name
                        for f in fluents if f.name=='control'][0]
        self.game_def = game_def

    def get_fluents_string(self):
        """
        Gets a string with all fluents for printing
        """
        f = self.fluents_str
        f.sort()
        f_s = "\n\t".join(f)
        return f_s

    @property
    def ascii(self):
        return self.game_def.state_to_ascii(self)

    @property
    def str_expanded(self):
        s = """
        {}============== STATE ==============
        FLUENTS:
        {}\n
        """.format(bcolors.REF, self.get_fluents_string())
        s+= "GOALS: {}".format(self.goals)
        if(self.is_terminal):
            s+= "  *TERMINAL STATE*\n"
        s+="""
        ==================================={}
        """.format(bcolors.ENDC)
        return s

    def __str__(self):
        return self.str_expanded

class StateExpanded(State):
    """
    A class used to represent a State on the game

    Attributes
    ----------
    legal_actions : list(Action)
        List of possible actions from the current state
    fluents : list(string)
        the name of the animal
    terminal : boolean
        true if the state is terminal
    goals : tuple
        A list of goals Symbol
        goal(player, reward)
    control : name of the player in turn
    """
    def __init__(self, legal_actions, fluents, goals, game_def, is_terminal):
        super().__init__(fluents,goals,is_terminal,game_def)
        self.legal_actions = legal_actions

    @classmethod
    def from_model(cls, model,game_def):
        """
        Creates a State from a model without considering the actions
        """
        atoms = model.symbols(atoms=True)
        is_terminal = model.contains(clingo.Function("terminal", []))
        fluents = [a.arguments[0] for a in atoms if a.name=='true']
        goals = [a for a in atoms if a.name=='goal']
        return cls([],fluents,goals,is_terminal,game_def)

    @classmethod
    def from_game_def(cls, game_def, current_fluents, strategy=None):
        """
        Obtains the answer sets from clingo and transforms them into a state
        Args:
            game_def: The definition of the game
            strategy: Optional Path to file with an strategy
            current_fluents: A string with all fluents true in the state
            in clingo syntax
        """
        ctl = get_new_control(game_def)
        ctl.load(game_def.background)
        if(current_fluents[-3:] == ".lp"):
            ctl.load(current_fluents)
        else:
            ctl.add("base",[],current_fluents)
        if(strategy):
            ctl.load(strategy)
        ctl.ground([("base", [])], context=Context())
        with ctl.solve(yield_=True) as handle:
            state = None
            has_initialized = False
            for model in handle:
                if not has_initialized:
                    state = StateExpanded.from_model(model,game_def)
                    has_initialized = True
                state.add_action_from_clingo_model(model)
            state.legal_actions_to_idx = {symbol_str(a.action):i for
                                          i,a in enumerate(state.legal_actions)}
            return state

    def get_next(self, action, strategy_path = None):
        """
        Gets the next state when performing the action
        Args:
            action: The action to perform type Action
            game_path: Path to the game folder
            strategy: Optional strategy path
        """
        return StateExpanded.from_game_def(self.game_def,
                      current_fluents=fluents_to_asp_syntax(action.next_fluents)
                                           ,strategy=strategy_path)

    def get_symbol_legal_actions(self):
        """
        Obtains a list with all legal actions as strings
        """
        return [symbol_str(a.action) for a in self.legal_actions]

    def add_action_from_clingo_model(self, model): 
        """
        Adds an action to the state from a model
        Params:
            model: The clingo answer set
        """
        atoms = model.symbols(atoms=True)
        does = [a for a in atoms if a.name=='does']
        if(len(does)==0):
            #Ignoring model without action
            return
        else:
            assert len(does) == 1, ("Multiple actions {} not supported {}"
                                    .format(len(does),model))
            action = does[0]
            player = symbol_str(action.arguments[0])
            next_fluents = [a.arguments[0] for a in atoms if a.name=='next']
            cost = model.cost
            action_class = ActionExpanded(player,action.arguments[1],
                                          next_fluents,cost)
            self.legal_actions.append(action_class)
            return

    def get_legal_action_from_str(self, action_str):
        """
        Obtains the clingo action from a given string name.
        If the action is not legal the method returns None.
        Args:
            action_str: The string representing the action
        """
        if action_str in self.legal_actions_to_idx:
            return self.legal_actions[self.legal_actions_to_idx[action_str]]
        else:
            return None

    def __str_detail__(self):
        f = self.get_fluents_string()
        a = "\n".join(["{}:{}".format(i,str(a)[2:])
                       for i,a in enumerate(self.legal_actions)])
        s = """
        ============== STATE ==============
        FLUENTS:
        {}\n
        """.format(f)
        s+= "GOALS: {}".format(self.goals)
        if(self.is_terminal):
            s+= "  *TERMINAL STATE*\n"
        s+="""
        ****** LEGAL ACTIONS ******
        {}
        """.format(a)
        s+="===================================\n"
        return s

    @property
    def str_step_options(self):
        f = self.get_fluents_string()
        s = "\n======== CURRENT STATE ========\n{}".format(self.ascii)
        s += "****** Available actions *******"
        for i,a in enumerate(self.legal_actions):
            step = Step(self,a,None)
            s+="\n{}:{}\n".format(i,step.ascii)
        return s
