#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from py_utils import arg_metav_formatter
from game_definitions import GameDef
from py_utils.min_max_asp import get_minmax_init
from py_utils.clingo_utils import rules_file_to_gdl
import sys
import argparse
from py_utils.logger import log
from ml_agent.train_utils import training_data_to_csv, remove_duplicates_training
import random
# getattr(sys.modules[__name__],"GameNimDef")

def main_minmax_asp(plaintext,image_file_name,ilasp_examples_file,rules_file,train_file,main_player,game_name,random_seed,n):
    # remove trailing backslash as failsafe
    html = not plaintext
    game = GameDef.from_name(game_name)
    learn_examples = not (ilasp_examples_file is None)
    learn_rules = not (rules_file is None)
    generate_train = not (train_file is None)
    game.get_random_initial()
    initial_states = game.random_init
    if random_seed==0:
        initial_states[0] = game.initial
    else:
        random.Random(random_seed).shuffle(initial_states)
    
    all_examples = []
    all_learned_rules = []
    all_training_list = []
    for i in range(n):
        log.info("Computing asp minmax for tree")
        game.initial = initial_states[i]
        initial = game.get_initial_time(random = False)
        minmax_match, min_max_tree, examples, learned_rules, training_list = get_minmax_init(game,
                                                            main_player,
                                                            initial,
                                                            generating_training=generate_train,learning_rules=learn_rules, learning_examples=learn_examples)
        log.info("Initial state: \n{}".format(minmax_match.steps[0].state.ascii))
        log.debug(minmax_match)
        if not examples is None: all_examples.extend(examples) 
        if not learned_rules is None: all_learned_rules.extend(learned_rules) 
        if not training_list is None: all_training_list.extend(training_list) 

                                                        
    if learn_examples:
        with open(ilasp_examples_file, "w") as text_file:
            text_file.write("\n".join(all_examples))
            log.info("ILASP Examples saved in " + ilasp_examples_file)
    if learn_rules:
        with open(rules_file, "w") as text_file:
            text_file.write("\n".join(all_learned_rules))
        rules_file_to_gdl(rules_file)
        log.info("Rules saved in " + rules_file)

    if generate_train:
        training_data_to_csv(train_file,all_training_list,game)
        log.info("Training data saved in " + train_file)
        remove_duplicates_training(train_file)
            
    if(not (image_file_name is None)):
        min_max_tree.print_in_file(file_name=image_file_name,html=False,main_player=main_player)
        log.info("Tree image saved in {}".format(image_file_name))


        

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--log", type=str, default="INFO",
                        help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--image-file-name", type=str, default=None,
                        help="output image file name")
    parser.add_argument("--plaintext", default=False, action="store_true",
                        help="whether plaintext should be used for visualization")
    parser.add_argument("--main-player", default="a",
                help="the player from wich to maximize")
    parser.add_argument("--ilasp-examples-file", type=str, default=None,
                        help="relative path to location where ilasp examples will be saved")
    parser.add_argument("--rules-file", type=str, default=None,
                    help="relative path to save rules learned when tree rules are learned while computing minmax")
    parser.add_argument("--train-file", type=str, default=None,
                    help="relative path to save training data")
    parser.add_argument("--game-name", type=str, default="Nim",
                    help="short name for the game. Available: Dom and Nim")
    parser.add_argument("--n-trees", type=int, default=1,
                        help="Number of games to generate trees")
    parser.add_argument("--random-seed", type=int, default=0,
                        help="the random seed for the initial state, 0 indicates the use of default initial state")
    
    args = parser.parse_args()
    log.set_level(args.log)

    main_minmax_asp(args.plaintext,args.image_file_name,args.ilasp_examples_file,args.rules_file,args.train_file,args.main_player,args.game_name,args.random_seed,args.n_trees)
