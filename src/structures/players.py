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

import os

def player_approaches_sub_classes():
    """
    Obtains all the classes with different approaches 
    that extend Player. This classes must be inside ./approaches
    """
    player_approaches = {}
    root = './approaches/'
    directories = [d for d in os.listdir(root) if os.path.isdir(os.path.join(root,d)) and not d[0]=='_']
    for approach_name in directories:
        player_path = os.path.join(root,os.path.join(approach_name,'player.py'))
        if os.path.isfile(player_path):
            module = SourceFileLoader(approach_name, player_path).load_module()
            p_class =  getattr(module, module.__dir__()[-1])
            player_approaches[approach_name] = p_class
        else:
            log.error("Missing player file for approach " +approach_name)

    return player_approaches


class Player(abc.ABC):
    """
    A class used to represent an player with an special approach to analyze a game and
    make select actions. This class must be extended by the specific approach.

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = ""


    def __init__(self, game_def, name, main_player, strategy=None):
        """
        Constructs a player using saved information, the information must be saved 
        when the build method is called. This information should be able to be accessed
        using parts of the name_style to refer to saved files or other conditions

        Args:
            game_def (GameDef): The game definition used for the creation
            main_player (str): The name of the player either a or b
            name (str): The name representing the palyer
        """
        self.name = name
        self.game_def = game_def
        self.main_player = main_player
        self.strategy = strategy

    @classmethod
    def from_name_style(cls, game_def, name_style, main_player):
        """
        Creates a player by finding the Player's subclass matching the
        name_style.
        Args:
            game_def (GameDef): The game_definition used
            name_style (str): String to match with the function match_name_style
                              of the subclass
            main_player (str): String with the name of the main player 
        """
        approaches = player_approaches_sub_classes()
        for n,c in approaches.items():
            if c.match_name_style(name_style):
                log.debug("Creating player from class {}".format(c.__name__))
                return c(game_def, name_style, main_player)
        
        raise RuntimeError("No subclass of Player matched {}".format(name_style))


    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
        EXAMPLE: "approach_name<file-name> where file-name is the relative 
                 path to the file required information for player."
        Returns: 
            String for the description
        """
        raise NotImplementedError

    @staticmethod
    def match_name_style(name):
        """
        Verifies if a name_style matches the approach

        Args:
            name_style (str): The name style used to create the built player. This name will be passed
                        from the command line. Will then be used in the constructor. 
        Returns: 
            Boolean value indicating if the name_style is a match
        """
        raise NotImplementedError


    @staticmethod
    def add_parser_build_args(parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        Use approach_parser.add_argument(...) as explained in https://docs.python.org/2/library/argparse.html
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
        pass


    @staticmethod
    def build(game_def, args):
        """
        Runs the required computation to build a player. For instance, creating a tree or 
        training a model. 
        The computed information should be stored to be accessed latter on using the name_style
        Args:
            game_def (GameDef): The game definition used for the creation
            args (NameSpace): A name space with all the attributes defined in add_parser_build_args
        """
        raise NotImplementedError

    
    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        raise NotImplementedError