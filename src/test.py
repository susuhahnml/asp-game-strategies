#!/usr/bin/env python
# -*- coding: utf-8 -*-

# import dependencies
import time
from py_utils import *
from structures import *
from players import *
from game_definitions import *

nim = GameNimDef("./game_definitions/nim")

def test_match():
    match = simulate_match(nim,
    [
        {"name":"random"},
        {"name":"random"}
    ], depth=2)
    assert len(match.steps) == 3

def test_match_full():
    match = simulate_match(nim,
    [
        {"name":"random"},
        {"name":"random"}
    ])

def test_match_human():
    match = simulate_match(nim,
                           [{"name":"minmax_asp",
                             "game_def":nim,
                             "main_player":"a"},
                            {"name":"human"}],
                           debug=True)

def test_match_time():
    initial = 'holds(has(1,2),0). holds(has(2,2),0). holds(has(3,0),0). holds(control(a),0).'
    minmax_match, min_max_tree, examples = get_minmax_init(nim,'a',initial,debug=True)
    print(minmax_match)
    print("".join(examples))
    assert(minmax_match.goals["a"] == -1)
    assert(minmax_match.steps[0].score == -1)
    min_max_tree.print_in_console()

def test_match_time_good():
    initial = 'holds(has(1,2),0). holds(has(2,2),0). holds(has(3,1),0). holds(control(a),0).'
    minmax_match, min_max_tree, examples = get_minmax_init(nim,'a',initial,debug=True)
    assert(minmax_match.goals["a"] == 1)

def test_match_time_big():
    initial = 'holds(has(1,5),0). holds(has(2,5),0). holds(has(3,3),0). holds(control(a),0).'
    start_time = time.time()
    minmax_match, min_max_tree, examples = get_minmax_init(nim,'a',initial,debug=True,learning_rules=False)
    print("\n--- %s seconds whitout learning ---" % (time.time() - start_time))
    start_time = time.time()
    minmax_match, min_max_tree, examples = get_minmax_init(nim,'a',initial,debug=True,learning_rules=True)
    print("\n--- %s seconds learning ---" % (time.time() - start_time))
    assert(minmax_match.goals["a"] == 1)

def test_tree():
    tree = Tree.from_game_def(GameNimDef("./game_definitions/test_nim"))
