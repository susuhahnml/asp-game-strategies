#!/usr/bin/env python
# -*- coding: utf-8 -*-

import anytree
from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter
from .state import *
from .match import *

class Tree:
    def __init__(self,root=None):
        self.root = root

    def from_game_def(self, game_def):
        initial_state = StateExpanded.from_game_def(game_def,game_def.initial)
        root_node = Node(Step(initial_state,None,0))
        root_node = self.expand_root(root_node)
        self.root = root_node

    def expand_root(self,tree):
        expand_further = True
        time_step = 1
        while expand_further:
            # define current player
            expand_further = False
            # starting iteration to fill branches
            print("Depth: %s" % (time_step))
            for leaf in tqdm(tree.leaves):
                if not leaf.name.state.is_terminal:
                    valid_moves = leaf.name.state.legal_actions
                    for legal_action in valid_moves:
                        next_state = leaf.name.state.get_next(legal_action)
                        step = Step(next_state,legal_action,time_step)
                        Node(step,parent=leaf)
                        if(not next_state.is_terminal):
                            expand_further = True
                else:
                    pass
                    # leaf.name.score = leaf.name.
            time_step += 1
        return tree

    @staticmethod
    def node_from_match_initial(match):
        initial = Step(match.steps[0].state,None,-1)
        root_node = Node(initial)
        rest = Tree.node_from_match(match)
        rest.parent = root_node
        return root_node

    @staticmethod
    def node_from_match(match):
        root_node = Node(match.steps[0],children=[])
        current_node = root_node
        for s in match.steps[1:]:
            new = Node(s,parent=current_node)
            current_node = new
        return root_node

    def print_in_file(self,file_name="tree_test.png"):
        def to_label(n):
            return 'label="%s"' % (n.name.ascii_score)
        UniqueDotExporter(self.root,nodeattrfunc=to_label).to_picture(file_name)

    def print_in_console(self):
        for pre, fill, node in RenderTree(self.root):
            print("%s%s" % (pre, node.name))

# TODO add pydocstrings to all bits
# TODO add minimax scores via reverse strategy

def build_minimax(tree):
    # work recursively backwards to fill up slots
    for node in tqdm(list(reversed
                        (list(LevelOrderIter(tree,maxlevel=tree.height))))):
        scores = [child.name[3] for child in node.children if child != ()]
        if node.name[3] == None:
            if node.name[1] == 1:
                node.name[3] = min(scores)
            elif node.name[1] == -1:
                node.name[3] = max(scores)
    return tree

