#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils.logger import log
import re
import time
import argparse
from py_utils import arg_metav_formatter, add_params
from game_definitions import GameDef
from py_utils.match_simulation import simulate_match
from structures.players import Player

def main_match(depth,pA_style,pB_style,game_name,constants):
    # remove trailing backslash as failsafe
    game = GameDef.from_name(game_name,constants=constants)

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
    params = ["--log",
            "--depth",
            "--pA-style",
            "--pB-style",
            "--game-name",
            "--const"
            ]
    add_params(parser,params)
    args = parser.parse_args()
    log.set_level(args.log)
    if args.const is None:
        constants = {}
    else:
        constants = {c.split("=")[0]:c.split("=")[1] for c in args.const}

    main_match(args.depth,args.pA_style,args.pB_style,args.game_name,constants)
