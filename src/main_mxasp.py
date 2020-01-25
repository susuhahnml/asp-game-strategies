#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from py_utils import *
from structures import *
from players import *
from game_definitions import *

import sys
# getattr(sys.modules[__name__],"GameNimDef")
def main_minmax_asp(path,plaintext,image_file_name,ilasp_examples_file,rules_file,main_player,game_name):
    # remove trailing backslash as failsafe
    html = not plaintext
    path = re.sub(r"\/$","",path)
    game = globals()['Game{}Def'.format(game_name)](path)    
    initial = game.get_initial_time()
    learn_examples = not (ilasp_examples_file is None)
    learn_rules = not (rules_file is None)

    minmax_match, min_max_tree, examples, learned_rules = get_minmax_init(game,
                                                           main_player,
                                                           initial,
                                                           debug=True,learning_rules=learn_rules, learning_examples=learn_examples)
    if learn_examples:
        with open(ilasp_examples_file, "w") as text_file:
            text_file.write("\n".join(examples))
    if learn_rules:
        with open(rules_file, "w") as text_file:
            text_file.write("\n".join(learned_rules))

    if(image_file_name is None):
        print(minmax_match)
    else:
        min_max_tree.print_in_file(file_name=image_file_name,html=False,main_player=main_player)
        print("Tree image saved in {}".format(image_file_name))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--path", type=str, default="./game_definitions/nim",
                        help="relative path of game" +
                        " description language for game")
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
    parser.add_argument("--game-name", type=str, default="Nim",
                    help="short name for the game. Available: Dom and Nim")
    
    args = parser.parse_args()
    main_minmax_asp(args.path,args.plaintext,args.image_file_name,args.ilasp_examples_file,args.rules_file,args.main_player,args.game_name)
