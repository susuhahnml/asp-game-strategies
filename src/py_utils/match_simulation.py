#!/usr/bin/env python
# -*- coding: utf-8 -*-

from players.players import *
from .clingo_utils import *
from .colors import *
from structures.game import *
from structures.match import *
import time
def simulate_match(game_def, player_config, depth=None, debug=False):
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

    def conf_to_player(config):
        config = defaultdict(lambda: None,config)
        if(config['name']=="human"):
            return HumanPlayer()
        if(config['name']=="strategy"):
            return StrategyPlayer(config['strategy_path'])
        if(config['name']=="random"):
            return RandomPlayer(config['seed'])
        if(config['name']=="minmax_asp"):
            return MinmaxASPPlayer(game_def, config['main_player'])
        if(config['name']=="minmax"):
            return MinmaxPlayer(game_def, config['main_player'])
        # if(config['name']=="ML"):
        #     return MLPlayer(config['model'])


    # TODO check options other than default
    players = [conf_to_player(player_config[0]),
               conf_to_player(player_config[1])]
    state = StateExpanded.from_game_def(game_def,
                      game_def.initial,
                      strategy = players[0].strategy)
    match = Match([])
    time_step = 0
    continue_depth = True if depth==None else time_step<depth
    if debug: print("\n--------------- Simulating match ----------------")
    if debug: print("a: {}\nb: {}\n".format(players[0].__class__.__name__,
                                            players[1].__class__.__name__))

    letters = ['a','b']
    response_times = {'a':[],'b':[]}
    while(not state.is_terminal and continue_depth):
        #TODO what if players change order
        t0 = time.time()
        selected_action = players[time_step%2].choose_action(state)
        t1 = time.time()
        response_times[letters[time_step%2]].append((t1-t0)*1000)
        step = Step(state,selected_action,time_step)
        #TODO Check if must add next step when removing last step
        match.add_step(Step(state,selected_action,time_step))
        time_step+=1
        continue_depth = True if depth==None else time_step<depth
        state = state.get_next(selected_action,
                               strategy_path = players[time_step%2].strategy)
    match.add_step(Step(state,None,time_step))
    if debug: print(match)
    return match, {k:sum(lst) / len(lst) for k,lst in response_times.items()}


