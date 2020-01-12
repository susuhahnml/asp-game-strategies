#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def main_tree(path,plaintext,file_name):
    # remove trailing backslash as failsafe
    html = not plaintext
    path = re.sub(r"\/$","",path)
    tree = Tree()
    nim = GameNimDef(path)
    tree.from_game_def(nim)
    tree.print_in_file(html=html,file_name=file_name)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--path", type=str, default="./game_definitions/nim",
                        help="relative path of game" +
                        " description language for game")
    parser.add_argument("--file-name", type=str, default="tree_vis.png",
                        help="output image file name")
    parser.add_argument("--plaintext", default=False, action="store_true",
                        help="whether plaintext should be used for visualization")
    args = parser.parse_args()
    # run tree command
    main_tree(args.path,args.plaintext,args.file_name)
