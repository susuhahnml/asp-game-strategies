#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils.logger import log
import re
import time
import argparse
from py_utils import arg_metav_formatter
from game_definitions import GameDef
from py_utils.match_simulation import simulate_match
from structures.players import Player

def main_match(depth,pA_style,pB_style,game_name):
    # remove trailing backslash as failsafe
    game = GameDef.from_name(game_name)

    pl = []
    for n,p in [("a",pA_style),("b",pB_style)]:
        conf = {"name":p}
        if p == "strategy":
            conf["strategy_path"]="strategy.lp"
        if p in ["minmax_asp","minmax"]:
            conf["main_player"]=n
        pl.append(Player.from_config(conf,game_def=game))
    

    match, response_times = simulate_match(game,pl)
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--log", type=str, default="INFO",
                        help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--depth", type=int, default=None,
                        help="depth to which game should be played")
    parser.add_argument("--pA-style", type=str, default="random",
                        help="playing style for player a;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy-[name]', 'ml-[name]' or 'human'")
    parser.add_argument("--pB-style", type=str, default="random",
                        help="playing style for player b;"+
                        " either 'minmax_asp', 'minmax', 'random', 'strategy-[name]', 'ml-[name]' or 'human'")
    parser.add_argument("--game-name", type=str, default="Dom",
                help="short name for the game. Available: Dom and Nim")

    args = parser.parse_args()
    log.set_level(args.log)

    # run match command
    main_match(args.depth,args.pA_style,args.pB_style,args.game_name)
