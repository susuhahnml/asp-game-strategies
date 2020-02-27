#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import re
import anytree
from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter
from anytree.search import findall
from .state import State, StateExpanded
from .match import Match
from .step import Step
from py_utils.logger import log

class Tree:
    """
    Tree class to handle search trees for games
    """
    def __init__(self,root=None,game=None):
        """ Initialize with empty root node and game class """
        self.root = root
        self.game = game

    def get_number_of_nodes(self):
        nodes = findall(self.root, filter_=lambda node: not node.name.action is None and not node.name.score is None)
        return len(nodes)

    def print_in_file(self,
                      file_name="tree_test.png",main_player="a"):
        """
        Function to plot generated tree as an image file

        Args:
            file_name (str): full name of image to be created
        """
        base_dir="./img/"
        image_file_name = base_dir + file_name
        # define local functions
        def to_label(node):
            os.makedirs(os.path.dirname(image_file_name), exist_ok=True)
            """ Minor function to create ascii graph label """
            a = Tree.step_ascii_score(node.name,main_player)
            a_r = a.replace('\n','\l')+'\l'
            style = ['rounded','filled']
            if not (node.name.action is None):
                if node.name.action.player == main_player:
                    style.append('solid')
                else:
                    style.append('dotted')
            format_str = 'label="%s" shape=box style="%s" fontName="Bookman Old Style" labeljust=l'  % ( a_r,",".join(style))
            if node.name.score is None:
                format_str += ' fillcolor="#e4e4e4"'
            else:
                if node.name.score<0:
                    format_str += ' fillcolor="#fbe7e6"'
                elif node.name.score>0:
                    format_str += ' fillcolor="#e6fbea"'
            return format_str
        UniqueDotExporter(self.root,
                          nodeattrfunc=to_label,
                          edgeattrfunc=lambda parent, child: 'arrowhead=vee').to_picture(image_file_name)
        log.info("Tree image saved in {}".format(image_file_name))

    def print_in_console(self):
        """
        Function to plot generated tree within the console
        """
        for pre, fill, node in RenderTree(self.root):
            print("%s%s" % (pre, node.name))

    @staticmethod
    def node_from_match_initial(match):
        """
        Function to construct a tree from a match class.
        It will create a tree with one branch representing the match
        Adds an extra root for the tree with the initial state.
        Args:
            match (Match): match to generate a tree

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
        Function to construct a tree from a match class.
        It will create a tree with one branch representing the match
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

    @staticmethod
    def step_ascii_score(step,main_player="a"):
        """
        Returns the ascii representation of the step including the score
        Used for printing
        """
        if step.score:
            if step.action != None:
                return "〔score {}〕\n{}".format(step.score,
                                                          step.ascii)
            else:
                if(step.state.is_terminal):
                    # return ("Terminal:({})\n{}".format(step.score,step.ascii))
                    return ("〔score {}〕".format(step.score))
                else:
                    other_player = "b" if main_player=="a" else "a"
                    s ="〔score {}〕\nmax:{}\nmin:{}\n{}".format(step.score,main_player,other_player,step.ascii)
                    return s
        else:
            return ""