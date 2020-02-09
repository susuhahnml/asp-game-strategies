#!/usr/bin/env python
# -*- coding: utf-8 -*-

from py_utils.clingo_utils import gdl_to_full_time

def test_tree():
    import sys
    gdl_to_full_time("./game_definitions/nim","background.lp")
