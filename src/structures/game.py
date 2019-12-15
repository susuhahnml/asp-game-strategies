#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from .state import *
from py_utils.clingo_utils import  *
from py_utils.colors import *
from collections import defaultdict

class Game:
    """
    Creates a game from a game_def.
    Args:
        game_def: Game Definition
    """
    def __init__(self, game_def):
        self.game_def = game_def
        #Set all options for actions and observations
        all_actions, all_obs = get_all_possible(game_def.all)
        self.all_actions = all_actions
        self.actionstr_to_idx = {symbol_str(a):i for i,a in enumerate(all_actions)}
        self.all_obs = all_obs
        self.obsstr_to_idx = {symbol_str(o):i for i,o in enumerate(all_obs)}
        #Set current state
        #TODO define how and where to randomly initialize
        initial_state = StateExpanded.from_game_def(game_def,game_def.initial)
        self.current_state = initial_state

    @property
    def current_observation(self):
        """
        The list defining the current obstervation with the size of all possible fluents.
        Contains 1 in the position of fluents that are true in the current state
        """
        obs = np.zeros(len(self.all_obs))
        fluents = self.current_state.fluents_str
        for f in fluents:
            obs[self.obsstr_to_idx[f]] = 1
        return obs

    def sample_random_legal_action(self):
        """
        Randomly sample an action from leagal actions in current state.
        Returns the idx of the action.
        """
        n_legal = len(self.current_state.legal_actions)
        assert n_legal>0 , "Cant sample without legal actions"
        r_l_idx = np.random.randint(n_legal)
        legal_action_str = symbol_str(self.current_state.legal_actions[r_l_idx].action)
        real_idx = self.actionstr_to_idx[legal_action_str]
        return real_idx

    def step(self, player_str, action_idx):
        """Run one timestep of the games dynamics.
        Accepts an action index and returns a tuple (observation, reward, done, info).
        Args:
            action_idx (number): The index of the action performed my the player
            player_str: The player name from which we want the reward
        Returns
            observation (object): Agent's observation of the current environment. Hot-One List
            reward (float) : Amount of reward returned after selected action.
            done (boolean): Whether the episode has ended
            info (dict): Contains auxiliary diagnostic information (helpful for debugging, and sometimes learning).
        """
        print(paint("\n----------- Performing GAME step -----------",bcolors.REF))
        action_str =  symbol_str(self.all_actions[action_idx])
        print("\tPlayer {}{}{} \n\tSelected action {}{}{} ".format(
            bcolors.OKBLUE,
            self.current_state.control,
            bcolors.ENDC,
            bcolors.OKBLUE,
            action_str,
            bcolors.ENDC))
        legal_action = self.current_state.get_legal_action_from_str(action_str)
        if not legal_action:
            print(paint("\tSelected non legal action",bcolors.FAIL))
            player_reward = -100
            print(paint_bool("••••••• EPISODE FINISHED Reward:{} •••••••".format(player_reward),player_reward>0))
            return self.current_observation, player_reward, True, {}
        #Construct next state
        next_state = self.current_state.get_next(legal_action)
        self.current_state = next_state
        #Get information from next state
        done = self.current_state.is_terminal
        rewards_dic = defaultdict(int,self.current_state.goals)
        player_reward = rewards_dic[player_str] 
        if(done):
            print(paint_bool("••••••• EPISODE FINISHED Reward:{} •••••••".format(player_reward),player_reward>0))
        return self.current_observation, player_reward, done, {}

    def __str__(self):
        return self.current_state.__str__()
