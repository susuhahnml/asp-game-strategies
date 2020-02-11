#!/usr/bin/env python
# -*- coding: utf-8 -*-

from structures.players import HumanPlayer, StrategyPlayer, RandomPlayer, MinmaxASPPlayer, MinmaxPlayer, RLPlayer
from .clingo_utils import *
from .colors import *
from structures.game import Game
from structures.match import Match
from structures.state import State, StateExpanded
from structures.step import Step
import time
from py_utils.logger import log
from collections import defaultdict
from rl_agent.rl_instance import RLInstance

def simulate_match(game_def, players, depth=None, ran_init=False):
    """
    Call it with the path to the game definition

    Options:
    player_config: A tuple of the player configurations
        - random: Play against random player
        - human: Play against human player
        - strategy: Play against a strategy defined in a file as weak constraints
        - minmax-asp: Play against a player using minmax strategy in asp
        - config: Play against other system. (System maybe must extend a class) TODO

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
    log.debug("\na: {}\nb: {}\n".format(players[0].__class__.__name__,
                                            players[1].__class__.__name__))

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


