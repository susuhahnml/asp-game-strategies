#!/usr/bin/env python
# -*- coding: utf-8 -*-

from structures.tree import Tree
from game_definitions.game_def import GameNimDef

def test_tree():
    tree = Tree()
    nim = GameNimDef("./game_definitions/test_nim")
    tree.from_game_def(nim)
    tree.print_in_file(file_name="test_tree.png")
