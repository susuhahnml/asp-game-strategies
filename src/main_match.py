#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def main_match(path,depth,pA_style,pB_style,debug):
    # remove trailing backslash as failsafe
    path=re.sub(r"\/$","",path)
    nim = GameNimDef(path)
    if "human" in [pA_style,pB_style]:
        debug = True
    
    pl = []
    for n,p in [("a",pA_style),("b",pB_style)]:
        conf = {"name":p}
        if p == "strategy":
            conf["strategy_path"]=path+"/strategy.lp"
        if p == "minmax_asp":
            conf["main_player"]=n
        pl.append(conf)

    match, response_times = simulate_match(nim,pl,debug=debug)
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--path", type=str, default="./game_definitions/nim",
                        help="relative path of game" +
                        " description language for game")
    parser.add_argument("--depth", type=int, default=None,
                        help="depth to which game should be played")
    parser.add_argument("--pA-style", type=str, default="random",
                        help="playing style for player a;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy' or 'human'")
    parser.add_argument("--pB-style", type=str, default="random",
                        help="playing style for player b;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy' or 'human'")
    parser.add_argument("--debug", default=False, action="store_true",
                        help="print debugging information from stack")
    args = parser.parse_args()
    # run match command
    main_match(args.path,args.depth,args.pA_style,args.pB_style,args.debug)
