#!/usr/bin/env python
# -*- coding: utf-8 -*-
from tqdm import tqdm
import time
import inspect
import random
import os
import re
from py_utils import arg_metav_formatter, add_params
from game_definitions import GameDef
import argparse
from py_utils.logger import log
from structures.players import player_approaches_sub_classes, Player
from structures.match import Match

def add_default_params(parser):
    parser.add_argument("--log", type=str, default="INFO",
        help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--game-name", type=str, default="nim",
        help="Short name for the game. Must be the name of the folder with the game description")
    parser.add_argument("--const", type=str, action='append',
        help="A constant for the game definition that will passed to clingo on every call. Must of the form <id>=<value>, can appear multiple times")
    initial_group = parser.add_mutually_exclusive_group()
    initial_group.add_argument("--random-initial-state-seed", type=int, default=None,
        help="The initial state for each repetition will be generated randomly using this seed. One will be generated for each repetition. This requires the game definition to have a file named rand_initial.lp as part of its definition to generate random states.")
    initial_group.add_argument("--initial-state-full-path", type=str, default=None,
        help="The full path starting from src to the file considered for the initial state. Must have .lp extension")
    parser.add_argument("--num-repetitions", type=int, default=1,
        help="Number of times the process will be repeated")
    parser.add_argument("--benchmark-output-file", type=str, default="console",
        help="Output file to save the benchmarks of the process that was runned")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    # ---------------------------- Default parser ----------------------------
    add_default_params(parser)
    subs = parser.add_subparsers(help="Approach to build. Use 'vs' to play previously built players against each other",dest="selected_approach")
    player_classes = player_approaches_sub_classes()
    
    # ---------------------------- VS parser ----------------------------
    parser_vs = subs.add_parser('vs', 
        help="Plays one player approach against other and generates benchmarks",conflict_handler='resolve')
    add_default_params(parser_vs)
    
    # ----- Get help for player styles
    player_name_style_options = []
    for n,pc in player_classes.items():
        player_name_style_options.append(getattr(pc,"get_name_style_description")())

    parser_vs.add_argument("--pA-style", type=str, default="random",
        help="Playing style name for player a;"+ ",\n".join(player_name_style_options))
    parser_vs.add_argument("--pB-style", type=str, default="random",
        help="Playing style name for player b;"+ ",\n".join(player_name_style_options))
    parser_vs.add_argument("--play-symmetry", default=False, action='store_true',
        help="When this flag is passed, all games will be played twice, one with player a starting and one with player b starting to increase fairness")

    # ---------------------------- Parser for each approach ----------------------------
    
    for n, pc in player_classes.items():
        approach_parser = subs.add_parser(n,help=pc.description)
        add_default_params(approach_parser)
        getattr(pc,"add_parser_build_args")(approach_parser)
    

    # ---------------------------- Setting default arguments ----------------------------
    args = parser.parse_args()
    n = args.num_repetitions
    log.set_level(args.log)
    if args.const is None:
        constants = {}
    else:
        constants = {c.split("=")[0]:c.split("=")[1] for c in args.const}

    game_def = GameDef.from_name(args.game_name,constants=constants)
    using_random = not args.random_initial_state_seed is None
    using_fixed_initial = not args.initial_state_full_path is None
    if(using_random):
        log.info("Using random seed for initial states {}".format(args.random_initial_state_seed))
        game_def.get_random_initial()
        initial_states = game_def.random_init
        random.Random(args.random_initial_state_seed).shuffle(initial_states)
    elif(using_fixed_initial):
        log.info("Using fixed initial state {}".format(args.initial_state_full_path))
        initial_states = [args.initial_state_full_path]
    else:
        log.info("Using default initial state {}".format(game_def.initial))
        initial_states = [game_def.initial]

    # ---------------------------- Computing VS ----------------------------

    if args.selected_approach == 'vs':
        style_a = args.pA_style
        style_b = args.pB_style
        log.info("Benchmarking: {} vs {} for {} games".format(style_a,style_b,n))

        player_encounters = [[
            Player.from_name_style(game_def,style_a,'a'),
            Player.from_name_style(game_def,style_b,'b')
        ]]
        if(args.play_symmetry):
            player_encounters.append([
            Player.from_name_style(game_def,style_b,'a'),
            Player.from_name_style(game_def,style_a,'b')
        ])
        scores = [{'wins':0,'losses':0,'draws':0,'points':0,'response_time':0},{'wins':0,'losses':0,'draws':0,'points':0,'response_time':0}]

        for turn, vs in enumerate(player_encounters):
            idx = {'a':0+turn,'b':1-turn}
            for i in tqdm(range(n)):
                game_def.initial = initial_states[i%len(initial_states)]
                match, metrics = Match.simulate_match(game_def,vs,ran_init=False)
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
            scores[idx['a']]['response_time']=int(scores[idx['a']]['response_time']/n)
            scores[idx['b']]['response_time']=int(scores[idx['b']]['response_time']/n)

        benckmarks_results = """
        {}:
            wins: {}   losses: {}   points: {} response_time(ms): {}
        {}:
            wins: {}   losses: {}   points: {} response_time(ms): {}
        """.format(style_a,scores[0]['wins'],scores[0]['losses'],scores[0]['points'],scores[0]['response_time'],
        style_b,scores[1]['wins'],scores[1]['losses'],scores[1]['points'],scores[1]['response_time'])


    # ---------------------------- Computing Approach ----------------------------

    else :
        response_times = []
        print(args.selected_approach)
        p_cls = player_classes[args.selected_approach]

        for i in tqdm(range(n)):
            game_def.initial = initial_states[i%len(initial_states)]
            t0 = time.time()
            p_cls.build(game_def,args)
            t1 = time.time()
            response_times.append((t1-t0)*1000)

        benckmarks_results = "\n".join([str(r) for r in response_times])
   
    #  If build:
        # Reapeat n times:
            # set initial state maybe the random one
            # save times
            # call the aproach build function with all params and game_def
            # Append benchmarks results
        # Sumup benchamrks


    # ---------------------------- Saving Benchamrks ----------------------------

    benckmark_file = args.benchmark_output_file
    if(benckmark_file == 'console'):
        log.info(benckmarks_results)
    else:
        benckmark_file = "benchmarks/"+benckmark_file
        with open(benckmark_file, "w") as text_file:
            text_file.write(benckmarks_results)
            log.info("Results saved in " + benckmark_file)


   


    