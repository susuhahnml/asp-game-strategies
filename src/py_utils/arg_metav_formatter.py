#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
from py_utils.logger import log
class arg_metav_formatter(argparse.ArgumentDefaultsHelpFormatter,
                      argparse.MetavarTypeHelpFormatter):
    """
    Class to combine argument parsers in order to display meta-variables
    and defaults for arguments
    """
    pass

def add_params(parser, params_list):
    for p in params_list:
        if "--log" == p:
            parser.add_argument("--log", type=str, default="INFO",
                                help="Log level: 'info' 'debug' 'error'" )
        elif "--game-name" == p:
            parser.add_argument("--game-name", type=str, default="Nim",
                                help="short name for the game. Available: Dom and Nim")
        elif "--const" == p:
            parser.add_argument("--const", type=str, action='append',
                                help="a constant for the game definition passed to clingo of the form <id>=<value>, can appear multiple times")
        elif "--image-file-name" == p:
            parser.add_argument("--image-file-name", type=str, default=None,
                                help="output image file name")
        elif "--main-player" == p:
            parser.add_argument("--main-player", type= str, default="a",
                                help="the player from wich to maximize")
        elif "--pA-style" == p:
            parser.add_argument("--pA-style", type=str, default="random",
                                help="playing style for player a;"+
                                " either 'minmax_asp', 'minmax', 'random', 'strategy-[name]', 'ml-[name]' or 'human'")
        elif "--pB-style" == p:
            parser.add_argument("--pB-style", type=str, default="random",
                                help="playing style for player b;"+
                                " either 'minmax_asp', 'minmax', 'random', 'strategy-[name]', 'ml-[name]' or 'human'")
        elif "--ilasp-examples-file" == p:
            parser.add_argument("--ilasp-examples-file", type=str, default=None,
                            help="relative path to location where ilasp examples will be saved")
        elif "--rules-file" == p:
            parser.add_argument("--rules-file", type=str, default=None,
                        help="relative path to save rules learned when tree rules are learned while computing minmax")
        elif "--train-file" == p:
            parser.add_argument("--train-file", type=str, default=None,
                        help="relative path to save training data")
        elif "--n-trees" == p:
            parser.add_argument("--n-trees", type=int, default=1,
                            help="Number of games to generate trees")
        elif "--random-seed" == p:
            parser.add_argument("--random-seed", type=int, default=0,
                            help="the random seed for the initial state, 0 indicates the use of default initial state")
        elif "--depth" == p:
            parser.add_argument("--depth", type=int, default=None,
                            help="depth to which game should be played")
        elif "--n-match" == p:
            parser.add_argument("--n-match", type=int, default=1,
                            help="Number of matches to simulate")
        elif "--file-name" == p:
            parser.add_argument("--file-name", type=str, default="benchmark_res.txt",
                            help="output image file name")
        elif "--grid-search" == p:
            parser.add_argument("--grid-search", type=bool, default=False,
                            help="true for performing a grid search")
        else:
            log.error("Parameter {} is not in list".format(p))

