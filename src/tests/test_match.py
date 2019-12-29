from py_utils import *
from structures import *
from players import *
from game_definitions.game_def import *

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
