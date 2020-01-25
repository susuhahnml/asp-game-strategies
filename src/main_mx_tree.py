#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def main_tree(path,plaintext,file_name,main_player,game_name):
    # remove trailing backslash as failsafe
    html = not plaintext
    path = re.sub(r"\/$","",path)
    tree = Tree()
    game = globals()['Game{}Def'.format(game_name)](path)    
    tree.from_game_def(game,main_player=main_player)
    tree.print_in_file(html=html,file_name=file_name,main_player=main_player)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--path", type=str, default="./game_definitions/nim",
                        help="relative path of game" +
                        " description language for game")
    parser.add_argument("--file-name", type=str, default="tree_vis.png",
                        help="output image file name")
    parser.add_argument("--plaintext", default=False, action="store_true",
                        help="whether plaintext should be used for visualization")
    parser.add_argument("--main-player", default="a",
                    help="the player from wich to maximize")
    parser.add_argument("--game-name", type=str, default="Nim",
                help="short name for the game. Available: Dom and Nim")

    args = parser.parse_args()
    # run tree command
    main_tree(args.path,args.plaintext,args.file_name,args.main_player,args.game_name)
