#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import argparse
from py_utils import arg_metav_formatter
from game_definitions import *
from structures.tree import Tree
from py_utils.logger import log

tree = Tree()
game = GameTTTDef()
tree.from_game_def(game,main_player="a")

def main_tree(file_name,main_player,game_name):
    # remove trailing backslash as failsafe
    tree = Tree()
    game = GameDef.from_name(game_name)
    log.info("Computing normal minmax for tree")
    tree.from_game_def(game,main_player=main_player)
    tree.print_in_file(file_name=file_name,main_player=main_player)
    log.info("Tree image saved in {}".format(file_name))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--log", type=str, default="INFO",
                        help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--image-file-name", type=str, default="tree_vis.png",
                        help="output image file name")
    parser.add_argument("--main-player", default="a",
                        help="the player from wich to maximize")
    parser.add_argument("--game-name", type=str, default="Nim",
                        help="short name for the game. Available: Dom and Nim")
    # parser.add_argument("--random-seed", type=int, default=0,
                        # help="the random seed for the initial state, 0 indicates the use of default initial state")
    args = parser.parse_args()
    log.set_level(args.log)
    # run tree command
    main_tree(args.image_file_name,args.main_player,args.game_name)
