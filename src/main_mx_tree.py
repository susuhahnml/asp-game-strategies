#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import argparse
from py_utils import arg_metav_formatter, add_params
from game_definitions import *
from structures.tree import Tree
from py_utils.logger import log
from min_max.min_max import minmax_from_game_def
def main_tree(file_name,main_player,game_name,constants):
    # remove trailing backslash as failsafe
    game = GameDef.from_name(game_name,constants=constants)
    log.info("Computing normal minmax for tree")
    tree = minmax_from_game_def(game,main_player=main_player)
    file_name = '{}/{}'.format(game_name.lower(),file_name)
    
    tree.print_in_file(file_name=file_name,main_player=main_player)
    log.info("Tree image saved in {}".format(file_name))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    params = ["--log",
            "--image-file-name",
            "--main-player",
            "--ilasp-examples-file",
            "--game-name",
            "--const",
            "--random-seed"
            ]
    add_params(parser,params)
    args = parser.parse_args()
    log.set_level(args.log)
    if args.const is None:
        constants = {}
    else:
        constants = {c.split("=")[0]:c.split("=")[1] for c in args.const}
    main_tree(args.image_file_name,args.main_player,args.game_name,constants)
