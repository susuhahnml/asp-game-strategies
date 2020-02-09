#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
from py_utils import arg_metav_formatter
from game_definitions import GameNimDef
import time
import json
from structures.tree import Tree
from py_utils.min_max_asp import get_minmax_init

def benchmark_tree():
    games = [
        GameNimDef(initial="true(has(1,0)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        GameNimDef(initial="true(has(1,3)).true(has(2,2)).true(has(3,2)).true(control(a))."),
        GameNimDef(initial="true(has(1,5)).true(has(2,3)).true(has(3,2)).true(control(a))."),
        # GameNimDef(initial="true(has(1,7)).true(has(2,5)).true(has(3,3)).true(control(a))."),
    ]
    results = ""
    for game in games:
        results += ("\n\n------------------\nGame:{}\nInitial state:\n{}".format(game.__class__.__name__,game.initial.replace('.','.\n')))
        t0 = time.time()
        tree = Tree()
        tree.from_game_def(game)
        t1 = time.time()
        results += ("\n\tMinmax tree: {} sec".format(t1-t0))
        t0 = time.time()
        initial = game.get_initial_time()
        minmax_match, min_max_tree, examples, learned_rules, training_list = get_minmax_init(game,
                                                           'a',
                                                           initial,
                                                           generating_training=False,learning_rules=False, learning_examples=False)
        t1 = time.time()
        results += ("\n\tMinmax ASP: {} sec".format(t1-t0))
    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--file-name", type=str, default="benchmark_tree_res.txt",
                        help="output image file name")
    args = parser.parse_args()
    res = benchmark_tree()
    with open(args.file_name, "w") as text_file:
        text_file.write(res)

    

   
