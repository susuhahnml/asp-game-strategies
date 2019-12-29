#!/usr/bin/env python
# -*- coding: utf-8 -*-

# import dependencies
import time
import argparse
from py_utils import *
from structures import *
from players import *
from game_definitions import *

def run(path,depth,pA_style,pB_style,debug):
    nim = GameNimDef(path)
    if pA_style != "strategy":
        pA = {"name":pA_style}
    else:
        pA = {"name":pA_style,"strategy_path":path+"/strategy.lp"}
    if pB_style != "strategy":
        pB = {"name":pB_style}
    else:
        pB = {"name":pB_style,"strategy_path":path+"/strategy.lp"}
    match = simulate_match(nim,
    [
        pA,
        pB
    ],debug=debug)
    return match

class arg_metav_formatter(argparse.ArgumentDefaultsHelpFormatter,
                      argparse.MetavarTypeHelpFormatter):
    """
    Class to combine argument parsers in order to display meta-variables
    and defaults for arguments
    """
    pass

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
    # run command
    run(args.path,args.depth,args.pA_style,args.pB_style,args.debug)
