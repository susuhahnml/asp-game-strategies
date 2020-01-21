#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils import *
from structures import *
from players import *
from game_definitions import *

def test_tree():
    tree = Tree()
    nim = GameNimDef()
    tree.from_game_def(nim)
    tree.print_in_file(html=True,file_name="test_tree_html.png")
    tree.print_in_file(html=False,file_name="test_tree_plain.png")
