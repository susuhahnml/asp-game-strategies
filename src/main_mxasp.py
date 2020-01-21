#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def main_minmax_asp(path,plaintext,image_file_name,ilasp_examples_file,rules_file):
    # remove trailing backslash as failsafe
    html = not plaintext
    path = re.sub(r"\/$","",path)
    nim = GameNimDef(path)    
    initial = nim.get_initial_time()
    learn_examples = not (ilasp_examples_file is None)
    learn_rules = not (rules_file is None)

    minmax_match, min_max_tree, examples, learned_rules = get_minmax_init(nim,
                                                           'a',
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
        min_max_tree.print_in_file(file_name=image_file_name,html=False)
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
    parser.add_argument("--ilasp-examples-file", type=str, default=None,
                        help="relative path to location where ilasp examples will be saved")
    parser.add_argument("--rules-file", type=str, default=None,
                    help="relative path to save rules learned when tree rules are learned while computing minmax")
    
    args = parser.parse_args()
    main_minmax_asp(args.path,args.plaintext,args.image_file_name,args.ilasp_examples_file,args.rules_file)
