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
    """
    Tree class to handle minimax tree construction
    """
    def __init__(self,root=None):
        """ Initiate with root node """
        self.root = root

    def from_game_def(self, game_def):
        """
        Wrapper function to start with a game definition and expand
        root downwards to branch all possibilities. Next, the tree is
        reviewed upwards using the minimax algorithm.

        Args:
            game_def (GameDef*): game definition class
        """
        initial_state = StateExpanded.from_game_def(game_def,game_def.initial)
        root_node = Node(Step(initial_state,None,0))
        root_node = self.expand_root(root_node)
        root_node = self.build_minimax(root_node)
        self.root = root_node

    def expand_root(self,tree):
        """
        Function to expand a tree downwards until terminal leaves

        Args:
            tree (anytree.Node): a tree to expand till its terminal leaves

        Returns:
            tree (anytree.Node): expanded version of tree
        """
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
                        if next_state.is_terminal:
                            goals = next_state.goals
                            for player,g_score in goals.items():
                                if g_score == 1 and player == "a":
                                    score = 1
                                elif g_score == 1 and player == "b":
                                    score = -1
                            step.score = score
                        else:
                            expand_further = True
                        Node(step,parent=leaf)
            time_step += 1
        return tree

    def build_minimax(self,tree):
        """
        Function to review and annotate tree with minimax scores

        Args:
            tree (anytree.Node): a tree with scores on its leaves

        Returns:
            tree (anytree.Node): minimax-annotated version of tree
        """
        print("tracking minimax scores recursively")
        # work recursively backwards to fill up slots
        for node in tqdm(list(reversed
                            (list(LevelOrderIter(tree.root,
                                                maxlevel=tree.root.height))))):
            scores = [child.name.score
                      for child in node.children if child != ()]
            if node.name.score == None:
                if node.name.state.control == "a":
                    node.name.score = max(scores)
                elif node.name.state.control == "b":
                    node.name.score = min(scores)
        return tree

    def print_in_file(self,base_dir="./img/",file_name="tree_test.png"):
        """
        Function to plot generated tree as an image file

        Args:
            base_dir (str): path of image containing directory
            file_name (str): full name of image to be created
        """
        def to_label(n):
            return 'label=<%s>' % (n.name.ascii_score.
                                          replace("\n","<br/>\n"))
        UniqueDotExporter(self.root,nodeattrfunc=to_label).to_picture(base_dir+
                                                                      file_name)

    def print_in_console(self):
        """
        Function to plot generated tree within the console
        """
        for pre, fill, node in RenderTree(self.root):
            print("%s%s" % (pre, node.name))

    @staticmethod
    def node_from_match_initial(match):
        """
        Function to construct a tree from match class given initial state

        Args:
            match (Match): a constructed match

        Returns:
            root_node (anytree.Node): tree corresponding to match
        """
        initial = Step(match.steps[0].state,None,-1)
        root_node = Node(initial)
        rest = Tree.node_from_match(match)
        rest.parent = root_node
        return root_node

    @staticmethod
    def node_from_match(match):
        """
        Function to construct a tree from match class

        Args:
            match (Match): a constructed match

        Returns:
            root_node (anytree.Node): tree corresponding to match
        """
        root_node = Node(match.steps[0],children=[])
        current_node = root_node
        for s in match.steps[1:]:
            new = Node(s,parent=current_node)
            current_node = new
        return root_node
