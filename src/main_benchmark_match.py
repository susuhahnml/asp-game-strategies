#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
import time
import json
import random
from py_utils import arg_metav_formatter
from game_definitions import GameDomDef, GameNimDef
from py_utils.match_simulation import simulate_match
from tqdm import tqdm
from py_utils.logger import log
from structures.players import Player
def benchmark_match(n,name_a,name_b,random_seed):
    games = [
        # GameNimDef(initial="true(has(1,0)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,3)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,5)).true(has(2,3)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,7)).true(has(2,5)).true(has(3,3)).true(control(a))."),
        GameDomDef()
    ]
    log.info("Benchmarking: {} vs {} for {} games".format(name_a,name_b,n))
    results = ""
    for game in games:
        player_encounters = [[
            Player.from_config({'name':name_a,'main_player':'a'}, game_def=game),
            Player.from_config({'name':name_b,'main_player':'b'}, game_def=game)
        ],[
            Player.from_config({'name':name_b,'main_player':'a'}, game_def=game),
            Player.from_config({'name':name_a,'main_player':'b'}, game_def=game)
        ]]
        game.get_random_initial()
        initial_states = game.random_init
        random.Random(random_seed).shuffle(initial_states)
        scores = [{'wins':0,'losses':0,'draws':0,'points':0,'response_time':0},{'wins':0,'losses':0,'draws':0,'points':0,'response_time':0}]
        for turn, vs in enumerate(player_encounters):
            idx = {'a':0+turn,'b':1-turn}
            for i in tqdm(range(n)):
                game.initial = initial_states[i]
                match, metrics = simulate_match(game,vs,ran_init=False)
                goals = match.goals
                for l,g in goals.items():
                    scores[idx[l]]['points']+=g
                    if g>0:
                        scores[idx[l]]['wins']+=1
                    elif g<0:
                        scores[idx[l]]['losses']+=1
                    else:
                        scores[idx[l]]['draws']+=1
                scores[idx['a']]['response_time']+=metrics['a']  
                scores[idx['b']]['response_time']+=metrics['b']  
            scores[idx['a']]['response_time']=scores[idx['a']]['response_time']/n
            scores[idx['b']]['response_time']=scores[idx['b']]['response_time']/n
    
        results += ("------------------\nGame:{}\nInitial state:\n{}".format(game.__class__.__name__,
        game.initial.replace('.','.\n') if not random else "RANDOM"))

        results += """
        {}:
            wins: {}   losses: {}   points: {} response_time: {}
        {}:
            wins: {}   losses: {}   points: {} response_time: {}
        """.format(name_a,scores[0]['wins'],scores[0]['losses'],scores[0]['points'],scores[0]['response_time'],
        name_b,scores[1]['wins'],scores[1]['losses'],scores[1]['points'],scores[1]['response_time'])
    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--log", type=str, default="INFO",
                    help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--n-match", type=int, default=1,
                        help="Number of matches to simulate")
    parser.add_argument("--pA-style", type=str, default="random",
                        help="playing style for player a;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy', 'rl-[name]' or 'human'")
    parser.add_argument("--pB-style", type=str, default="random",
                        help="playing style for player b;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy', 'rl-[name]' or 'human'")
    parser.add_argument("--file-name", type=str, default="benchmark_res.txt",
                        help="output image file name")
    parser.add_argument("--random-seed", type=int, default=0,
                        help="the random seed for the initial state, 0 indicates the use of default initial state")
    parser.add_argument("--grid-search", type=bool, default=False,
                        help="true for performing a grid search")

    args = parser.parse_args()

    if(args.grid_search):
        args.file_name = "grid-search.txt"
        players = ['rl-dense-0.1', 'rl-dense-0.3', 'strategy', 'random'] 
        res = ""
        for i in range(len(players)):
            for j in range(i+1,len(players)):
                result = benchmark_match(args.n_match,players[i],players[j],args.random_seed)
                res += result
    else:
        res = benchmark_match(args.n_match,args.pA_style,args.pB_style,args.random_seed)
    
    args.file_name = "benchmarks/"+args.file_name
    with open(args.file_name, "w") as text_file:
        text_file.write(res)
        log.info("Results saved in " + args.file_name)

    

   
