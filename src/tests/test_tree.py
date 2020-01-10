#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils import *
from structures import *
from players import *
from game_definitions import *

def test_tree():
    tree = Tree()
    nim = GameNimDef("./game_definitions/test_nim")
    piles = nim.number_piles
    maximum = nim.max_number
    tree.from_game_def(nim)
    tree.print_in_file(piles,maximum,html=True)
