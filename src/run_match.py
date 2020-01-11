#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def run_match(path,depth,pA_style,pB_style,debug):
    # remove trailing backslash as failsafe
    path=re.sub(r"\/$","",path)
    nim = GameNimDef(path)
    if "human" in [pA_style,pB_style]:
        debug = True
    if pA_style != "strategy":
        pA = {"name":pA_style}
    else:
        pA = {"name":pA_style,"strategy_path":path+"/strategy.lp"}
    if pB_style != "strategy":
        pB = {"name":pB_style}
    else:
        pB = {"name":pB_style,"strategy_path":path+"/strategy.lp"}
    match = simulate_match(nim,[pA,pB],debug=debug)
    return match

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--path", type=str, default="./game_definitions/nim",
                        help="relative path of game" +
                        " description language for game")
    parser.add_argument("--depth", type=int, default=None,
                        help="depth to which game should be played")
    parser.add_argument("--pA-style", type=str, default="random",
                        help="playing style for player a;"+
                        " either 'random', 'strategy' or 'human'")
    parser.add_argument("--pB-style", type=str, default="random",
                        help="playing style for player b;"+
                        " either 'random', 'strategy' or 'human'")
    parser.add_argument("--debug", default=False, action="store_true",
                        help="print debugging information from stack")
    args = parser.parse_args()
    # run match command
    run_match(args.path,args.depth,args.pA_style,args.pB_style,args.debug)