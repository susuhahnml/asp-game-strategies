#!/usr/bin/env python
# -*- coding: utf-8 -*-

# import dependencies
import time
import argparse
from py_utils import *
from structures import *
from players import *
from game_definitions import *

###########################
# define key functions
###########################

nim = GameNimDef("./game_definitions/nim")

# TODO add debug, depth and path
# TODO player 1 and 2; simulate match with human, random, strategy, or minmax

match = simulate_match(nim,
[
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"},
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"}
    # {"name":"human"}
    {"name":"random"},
    {"name":"random"}
],debug=True)

###########################
# main command call
###########################

if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--path", type=str, default="./game_definitions_nim",
                        help="relative path of game description language for game")
    parser.add_argument("--depth", type=int, default="mnist",
                        help="which training data to use; either mnist, fashion or faces")
    parser.add_argument("--latent-dim", type=int, default=100,
                        help="latent dimensionality of GAN generator")
    parser.add_argument("--debug", default=False, action="store_true",
                        help="option to continue training model within log directory")
