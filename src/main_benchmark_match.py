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

def benchmark_match(n=10):
    games = [
        GameNimDef(initial="true(has(1,0)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        GameNimDef(initial="true(has(1,3)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        GameNimDef(initial="true(has(1,5)).true(has(2,3)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,7)).true(has(2,5)).true(has(3,3)).true(control(a))."),
    ]
    player_encounters = []
    player_encounters.append([{'name':'random'},{'name':'minmax_asp','main_player':'b'}])
    player_encounters.append([{'name':'minmax_asp','main_player':'a'},{'name':'random'}])
    player_encounters.append([{'name':'strategy'},{'name':'minmax_asp','main_player':'b'}])
    player_encounters.append([{'name':'minmax_asp','main_player':'a'},{'name':'strategy'}])
    player_encounters.append([{'name':'strategy'},{'name':'random'}])
    player_encounters.append([{'name':'random'},{'name':'strategy'}])
    results = ""
    for game in games:
        results += ("------------------\nGame:{}\nInitial state:\n{}".format(game.__class__.__name__,game.initial.replace('.','.\n')))
        for vs in player_encounters:
            m={
                'a':{'name':vs[0]['name'],'wins':0,'losses':0,'draws':0,'response':0},
                'b': {'name':vs[1]['name'],'wins':0,'losses':0,'draws':0,'response':0}
            }
            for i in range(n):
                match, metrics = simulate_match(game,vs)
                goals = match.goals
                for l,g in goals.items():
                    if g>0:
                        m[l]['wins']+=1
                    elif g<0:
                        m[l]['losses']+=1
                    else:
                        m[l]['draws']+=1
                m['a']['response']+=metrics['a']  
                m['b']['response']+=metrics['b']  
            m['a']['response']=m['a']['response']/n
            m['b']['response']=m['b']['response']/n
            
            results += "\n{} VS {}".format(vs[0]['name'],vs[1]['name'])
            results += json.dumps(m, indent=2)
    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--n-match", type=int, default=10,
                        help="Number of matches to simulate for each vs")
    args = parser.parse_args()
    # run match command
    res = benchmark_match(args.n_match)
    with open("benchmark-matches.txt", "w") as text_file:
        text_file.write(res)


    

   