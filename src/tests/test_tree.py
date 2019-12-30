#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils import *
from structures import *
from players import *
from game_definitions import *

def test_tree():
    tree = Tree()
    tree.from_game_def(GameNimDef("./game_definitions/test_nim"))
    tree.print_in_file()
