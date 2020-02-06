#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import argparse
from py_utils import arg_metav_formatter
from game_definitions import *
from structures.tree import Tree
from py_utils.logger import log

tree = Tree()
game = GameTTTDef()
tree.from_game_def(game,main_player="a")
