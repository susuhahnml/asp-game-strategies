#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from structures.tree import Tree
from game_definitions.game_def import GameNimDef

def test_tree():
    tree = Tree.from_game_def(GameNimDef("src/tests/test_game_definitions/nim"))
    tree.print_in_file()
