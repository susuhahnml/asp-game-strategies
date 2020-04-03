import os
import re
import anytree
from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter
from structures.state import State, StateExpanded
from structures.match import Match
from structures.step import Step
from py_utils.logger import log
from structures.tree import Tree, NodeBase
from structures.treeMinmax import TreeMinmax, NodeMinmax

def minmax_from_game_def(game_def, initial_state = None, main_player="a"):
    """
    Wrapper function to start with a game definition and expand
    root downwards to branch all possibilities. Next, the tree is
    reviewed upwards using the minimax algorithm.

    Args:
        game_def (GameDef*): game definition class
    """
    if initial_state is None:
        initial_state = StateExpanded.from_game_def(game_def,game_def.initial)
    tree = TreeMinmax(main_player=main_player)
    root_node = tree.create_node(Step(initial_state,None,0))
    
    # Tree.expand_rec(root_node,0)
    expand_root(tree = root_node, main_player=main_player)
    root_node = build_minimax(root_node,main_player=main_player)
    return TreeMinmax(root_node,main_player)

def expand_root(tree, main_player="a"):
    """
    Function to expand a tree downwards until terminal leaves in place

    Args:
        tree (anytree.Node): a tree to expand till its terminal leaves
    """
    disable_tqdm = log.is_disabled_for('debug')
    valid_moves = tree.step.state.legal_actions
    for legal_action in valid_moves:
        step = Step(tree.step.state,legal_action,1)
        TreeMinmax.node_class(step,main_player,parent=tree)
    expand_further = True
    time_step = 2
    while expand_further:
        # define current player
        expand_further = False
        # starting iteration to fill branches
        log.debug("Depth: %s" % (time_step))
        for leaf in tqdm(tree.leaves,disable=disable_tqdm):
            current_state = leaf.step.state
            if current_state.is_terminal:
                continue

            next_state = current_state.get_next(leaf.step.action)
            valid_moves = next_state.legal_actions
            for legal_action in valid_moves:
                step = Step(next_state,legal_action,time_step)
                TreeMinmax.node_class(step,main_player,parent=leaf)
                expand_further = True

            if next_state.is_terminal:
                goals = next_state.goals
                leaf.score = goals[main_player]

        time_step += 1

def build_minimax(tree,main_player="a"):
    """
    Function to review and annotate tree with minimax scores

    Args:
        tree (anytree.Node): a tree with scores on its leaves
        main_player (str): The player to maximize
    Returns:
        tree (anytree.Node): minimax-annotated version of tree
    """
    disable_tqdm = log.is_disabled_for('debug')
    log.debug("tracking minimax scores recursively")
    # work recursively backwards to fill up slots
    for node in tqdm(list(reversed
                        (list(LevelOrderIter(tree.root,
                                            maxlevel=tree.root.height)))),disable=disable_tqdm):
        scores = [child.score
                    for child in node.children if child != ()]
        if node.score == None:
            if node.children[0].step.state.control == main_player:
                node.score = max(scores)
            else:
                node.score = min(scores)
    return tree