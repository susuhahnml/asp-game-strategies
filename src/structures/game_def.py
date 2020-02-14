#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import random
from collections import defaultdict
from py_utils.colors import *
from py_utils.clingo_utils import *
from py_utils.logger import log
import os
from structures.state import StateExpanded
from importlib.machinery import SourceFileLoader

def game_def_sub_classes():
    game_definitions = {}
    root = './game_definitions/'
    directories = [d for d in os.listdir(root) if os.path.isdir(os.path.join(root,d)) and not d[0]=='_']
    for def_name in directories:
        game_path = os.path.join(root,os.path.join(def_name,'game_def.py'))
        if os.path.isfile(game_path):
            module = SourceFileLoader(def_name, game_path).load_module()
            game_class =  getattr(module, module.__dir__()[-1])
            game_definitions[def_name] = game_class
        else:
            log.error("Missing game_def file for game definiton " +def_name)

    return game_definitions

class GameDef():
    """ Template class which can be reproduced for multiple games """
    def __init__(self,name,initial=None,constants={}):
        """
        Creates a game definition. It will automatically generate a 
        full_time.lp file with the encoding using timesteps.

        Args:
            name (str): The name of the directory inside ./game_definitions:
                        it must contain the following files
                - background.lp: Clingo file with all rules
                from the game in GDL format
                - default_initial.lp: Clingo file with all facts
                for the idefault initial state
                - all_initial.lp: Clingo file generating one stable model
                for each possible initial state
                - game_def.py: The game definition extending this class
            initial (str): Optional string or path to file to overwrite 
                the default initial state
            constants (dic str->str): The dictionary of constants that must 
                be passed to clingo on each execution.
        """
        self.name = name
        self.path = "./game_definitions/"+name
        self.background = self.path + "/background.lp"
        if not os.path.exists(self.path + "/full_time.lp"):
            log.info("Automatically generating full_time file")
            gdl_to_full_time(self.path,"/background.lp")
        self.full_time = self.path + "/full_time.lp"
        self.random_init = None
        self.constants = constants
        if initial is None:
            self.initial = self.path + "/default_initial.lp"
        else:
            self.initial = initial


    @classmethod
    def from_name(cls, name,initial=None,constants={}):
        games = game_def_sub_classes()
        if name in games:
            log.debug("Creating game definition from class {}".format(games[name].__name__))
            return games[name](name,initial,constants)
        
        raise RuntimeError("No folder inside game_definitions matched {}".format(name))

    def state_to_ascii(self, state):
        """
        Transforms a state into ascii representation for better visualization

        Args:
            state (State): A state of type State

        Returns:
            String with ascii representation
        """
        return NotImplementedError

    def step_to_ascii(self, step):
        """
        Transforms a step into ascii representation.
        This representation must include the effects of the step's action 
        one the step's state. The action of this step can not be assumed
        of being of type StateExpanded.

        Args:
            step (Step): A step of type Step

        Returns:
            String with ascii representation
        """
        return NotImplementedError

    def get_constant(self, constant_name, type_of_symbol="number"):
        """
        Obtains the constant of the game definition
        from the background file or using the one 
        provided on creation

        Args:
            constant_name: Name of the required constant
        Returns:
            A clingo Symbol representing the constant
        """
        if constant_name in self.constants:
            return self.constants[constant_name]
        const = get_constant(self.background,constant_name,True)
        return getattr(const, type_of_symbol)


    def get_initial_time(self):
        """
        Obtains the initial state in full time format
        """
        content = self.get_initial_str()
        content = "\n".join(transform_rules_gdl(content,fixed_time=0))
        return content

    @property
    def initial_is_file(self):
        return(self.initial[-3:] == ".lp")

    def get_initial_str(self):
        if(self.initial_is_file):
            with open(self.initial,"r") as File:
                lines = File.readlines()
                return "".join(lines)
        else:
            return self.initial + ""

    def get_random_initial(self):
        if self.random_init is None:
            self.random_init = get_all_models(self, self.path + "/all_initial.lp")
        return random.choice(self.random_init)

    def get_initial_state(self):
        content = self.get_initial_str()
        ctl = get_new_control(self)
        ctl.add("base",[],content)
        ctl.ground([("base", [])], context=Context())
        with ctl.solve(yield_=True) as handle:
            for model in handle:
                state = StateExpanded.from_model(model,self)
            
        return state
