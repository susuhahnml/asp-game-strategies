#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
from py_utils import *
from structures import *
from players import *
from game_definitions import *
import time
import json

def benchmark_match(n,name_a,name_b):
    games = [
        # GameNimDef(initial="true(has(1,0)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        GameNimDef(initial="true(has(1,3)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,5)).true(has(2,3)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,7)).true(has(2,5)).true(has(3,3)).true(control(a))."),
    ]
    player_encounters = []
    player_encounters.append([{'name':name_a,'main_player':'a'},{'name':name_b,'main_player':'b'}])
    player_encounters.append([{'name':name_b,'main_player':'a'},{'name':name_a,'main_player':'b'}])
    results = ""
    for game in games:
        scores = [{'wins':0,'losses':0,'draws':0,'response_time':0},{'wins':0,'losses':0,'draws':0,'response_time':0}]
        for turn, vs in enumerate(player_encounters):
            idx = {'a':0+turn,'b':1-turn}
            for i in range(n):
                match, metrics = simulate_match(game,vs)
                goals = match.goals
                for l,g in goals.items():
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
    
        results += ("------------------\nGame:{}\nInitial state:\n{}".format(game.__class__.__name__,game.initial.replace('.','.\n')))

        results += """
        {}:
            wins: {}   losses: {}   response_time: {}
        {}:
            wins: {}   losses: {}   response_time: {}
        """.format(name_a,scores[0]['wins'],scores[0]['losses'],scores[0]['response_time'],
        name_b,scores[1]['wins'],scores[1]['losses'],scores[1]['response_time'])
    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--n-match", type=int, default=1,
                        help="Number of matches to simulate")
    parser.add_argument("--pA-style", type=str, default="random",
                        help="playing style for player a;"+
                        " either 'minmax_asp', 'random', 'strategy' or 'human'")
    parser.add_argument("--pB-style", type=str, default="random",
                        help="playing style for player b;"+
                        " either 'minmax_asp', 'random', 'strategy' or 'human'")
    parser.add_argument("--file-name", type=str, default="benchmark_res.txt",
                        help="output image file name")
    args = parser.parse_args()
    # run match command
    res = benchmark_match(args.n_match,args.pA_style,args.pB_style)
    with open(args.file_name, "w") as text_file:
        text_file.write(res)



    

   