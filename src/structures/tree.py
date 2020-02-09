#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import anytree
from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter
from .state import State, StateExpanded
from .match import Match
from .step import Step

class Tree:
    """
    Tree class to handle minimax tree construction
    """
    def __init__(self,root=None,game=None):
        """ Initialize with empty root node and game class """
        self.root = root
        self.game = game

    def from_game_def(self, game_def, initial_state = None, main_player="a"):
        """
        Wrapper function to start with a game definition and expand
        root downwards to branch all possibilities. Next, the tree is
        reviewed upwards using the minimax algorithm.

        Args:
            game_def (GameDef*): game definition class
        """
        self.game = game_def
        if initial_state is None:
            initial = game_def.initial
            initial_state = StateExpanded.from_game_def(game_def,game_def.initial)
        root_node = Node(Step(initial_state,None,0))
        # Tree.expand_rec(root_node,0)
        self.root = root_node
        self.expand_root(main_player=main_player)
        root_node = self.build_minimax(root_node,main_player=main_player)
        self.root = root_node

    def expand_root(self, main_player="a"):
        """
        Function to expand a tree downwards until terminal leaves

        Args:
            tree (anytree.Node): a tree to expand till its terminal leaves

        Returns:
            tree (anytree.Node): expanded version of tree
        """
        tree =  self.root
        valid_moves = tree.name.state.legal_actions
        for legal_action in valid_moves:
            step = Step(tree.name.state,legal_action,1)
            Node(step,parent=tree)
        expand_further = True
        time_step = 2
        while expand_further:
            # define current player
            expand_further = False
            # starting iteration to fill branches
            print("Depth: %s" % (time_step))
            for leaf in tqdm(tree.leaves):
                current_state = leaf.name.state
                if current_state.is_terminal:
                    continue

                next_state = current_state.get_next(leaf.name.action)
                valid_moves = next_state.legal_actions
                for legal_action in valid_moves:
                    step = Step(next_state,legal_action,time_step)
                    Node(step,parent=leaf)
                    expand_further = True

                if next_state.is_terminal:
                    # Node(next_state,parent=leaf)
                    goals = next_state.goals
                    leaf.name.score = goals[main_player]

            time_step += 1

    def build_minimax(self,tree,main_player="a"):
        """
        Function to review and annotate tree with minimax scores

        Args:
            tree (anytree.Node): a tree with scores on its leaves
            main_player (str): The player to maximize
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
                if node.children[0].name.state.control == main_player:
                    node.name.score = max(scores)
                else:
                    node.name.score = min(scores)
        return tree

    def print_in_file(self,base_dir="./img/",
                      file_name="tree_test.png",main_player="a"):
        """
        Function to plot generated tree as an image file

        Args:
            base_dir (str): path of image containing directory
            file_name (str): full name of image to be created
        """
        # define local functions
        def to_label(node):
            """ Minor function to create ascii graph label """
            a = node.name.ascii_score(main_player)
            a_r = a.replace('\n','\l')+'\l\n'
            return 'label="%s" shape=box style=rounded fontname=Calibri labeljust=l'  % ( a_r)
        UniqueDotExporter(self.root,
                          nodeattrfunc=to_label,
                          edgeattrfunc=lambda parent,
                          child: "style=bold").to_picture(base_dir+file_name)


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
