from structures.tree import Tree
import sys
from game_definitions.game_def import GameNimDef

def test_tree():
    tree = Tree.from_game_def(GameNimDef("src/tests/test_game_definitions/nim"))
    tree.print_in_file()

    

    