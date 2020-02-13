#!/usr/bin/env python
# -*- coding: utf-8 -*-
import time
from py_utils.logger import log
from collections import defaultdict
from structures.state import State, StateExpanded
from structures.action import ActionExpanded, Action
from structures.step import Step
from py_utils.colors import *

class Match:
    """
    Class to represent a match 

    Attributes
    ----------
    steps : list(Step)
        list of steps performed in the match
    """
    def __init__(self,steps):
        self.steps = steps

    def add_step(self, step):
        """
        Adds a nex step
        """
        self.steps.append(step)

    @property
    def goals(self):
        """
        Returns: Obtains the goals of a match using the last step
        """
        if(len(self.steps) == 0):
            return {}
        return self.steps[-1].state.goals

    def __str__(self):
        """
        Returns: A console representation of the match
        """
        s = ""
        c = [bcolors.OKBLUE,bcolors.HEADER]
        for step in self.steps:
            s+=c[step.time_step%2]
            s+="\nSTEP {}:\n".format(step.time_step)
            s+= step.ascii
            if(step.state.is_terminal):
                s+="\n{}GOALS: \n{}{}".format(bcolors.OKGREEN, step.state.goals,
                                            bcolors.ENDC)
            s+=bcolors.ENDC
        return s

    def generate_train(self, training_list, i):
        if training_list is None:
            return
        step = self.steps[i]
        p = step.state.control
        control_goal = self.goals[p]
        training_list.append(
            {'s_init':step.state,
            'action':step.action,
            's_next':self.steps[i+1].state,
            'reward':control_goal,
            'win':-1 if control_goal<0 else 1})

    @staticmethod
    def simulate_match(game_def, players, depth=None, ran_init=False):
        """
        Call it with the path to the game definition

        Options:
        player_config: A tuple of the player configurations
            - random: Play against random player
            - human: Play against human player
            - strategy: Play against a strategy defined in a file as weak constraints
            - minmax-asp: Play against a player using minmax strategy in asp

        paths:
            - optimal*: Generate only one path with optimal actions
            - all: Generate full tree of matches TODO?

        depth:
            - n: Generate until depth n or terminal state reached
        """

        if(ran_init):
            initial = game_def.get_random_initial()
        else:
            initial = game_def.initial
        state = StateExpanded.from_game_def(game_def,
                        initial,
                        strategy = players[0].strategy)
        match = Match([])
        time_step = 0
        continue_depth = True if depth==None else time_step<depth
        log.debug("\n--------------- Simulating match ----------------")
        log.debug("\na: {}\nb: {}\n".format(players[0].name,
                                                players[1].name))

        letters = ['a','b']
        response_times = {'a':[],'b':[]}
        while(not state.is_terminal and continue_depth):
            t0 = time.time()
            selected_action = players[time_step%2].choose_action(state)
            t1 = time.time()
            response_times[letters[time_step%2]].append((t1-t0)*1000)
            step = Step(state,selected_action,time_step)
            match.add_step(step)
            time_step+=1
            continue_depth = True if depth==None else time_step<depth
            state = state.get_next(selected_action,
                                strategy_path = players[time_step%2].strategy)
        match.add_step(Step(state,None,time_step))
        log.debug(match)
        return match, {k:sum(lst) / (len(lst) if len(lst)>0 else 1) for k,lst in response_times.items()}


