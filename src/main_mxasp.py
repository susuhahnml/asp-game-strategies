#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import re
from py_utils import arg_metav_formatter, add_params
from game_definitions import GameDef
from min_max_asp.min_max_asp import get_minmax_init
from py_utils.clingo_utils import rules_file_to_gdl
import sys
import argparse
from py_utils.logger import log
from ml_agent.train_utils import training_data_to_csv, remove_duplicates_training
import random

def main_minmax_asp(image_file_name,ilasp_examples_file,rules_file,train_file,main_player,game_name,random_seed,n,constants):
    # remove trailing backslash as failsafe
    game = GameDef.from_name(game_name,constants=constants)
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
        ilasp_examples_file = './ilasp/{}/examples/{}'.format(game_name.lower(),ilasp_examples_file)
        os.makedirs(os.path.dirname(ilasp_examples_file), exist_ok=True)
        with open(ilasp_examples_file, "w") as text_file:
            text_file.write("\n".join(all_examples))
            log.info("ILASP Examples saved in " + ilasp_examples_file)
    if learn_rules:
        rules_file = './min_max_asp/learned_rules/{}/{}'.format(game_name.lower(),rules_file)
        os.makedirs(os.path.dirname(rules_file), exist_ok=True)
        with open(rules_file, "w") as text_file:
            text_file.write("\n".join(all_learned_rules))
        rules_file_to_gdl(rules_file)
        log.info("Rules saved in " + rules_file)

    if generate_train:
        train_file = './ml_agent/train/{}/{}'.format(game_name.lower(),train_file)
        os.makedirs(os.path.dirname(train_file), exist_ok=True)
        training_data_to_csv(train_file,all_training_list,game)
        log.info("Training data saved in " + train_file)
        remove_duplicates_training(train_file)
            
    if(not (image_file_name is None)):
        image_file_name = '{}/{}'.format(game_name.lower(),image_file_name)
        min_max_tree.print_in_file(file_name=image_file_name,main_player=main_player)


        

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    params = ["--log",
            "--image-file-name",
            "--main-player",
            "--ilasp-examples-file",
            "--rules-file",
            "--train-file",
            "--game-name",
            "--const",
            "--n-trees",
            "--random-seed"
            ]
    add_params(parser,params)
    args = parser.parse_args()
    log.set_level(args.log)
    if args.const is None:
        constants = {}
    else:
        constants = {c.split("=")[0]:c.split("=")[1] for c in args.const}

    main_minmax_asp(args.image_file_name,args.ilasp_examples_file,args.rules_file,args.train_file,args.main_player,args.game_name,args.random_seed,args.n_trees,constants)
