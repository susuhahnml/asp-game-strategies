#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import re
import anytree
from tqdm import tqdm
from anytree import Node, RenderTree, PreOrderIter
from anytree.exporter import UniqueDotExporter, DotExporter, DictExporter
from anytree.importer import DictImporter
from anytree.iterators.levelorderiter import LevelOrderIter
from anytree.search import findall
from .state import State, StateExpanded
from .action import Action
from .match import Match
from .step import Step
from py_utils.logger import log
import json
class NodeBase:
    def __init__(self, step, main_player):
        self.step = step
        self.main_player = main_player

    @classmethod
    def from_dic(cls, dic, game_def, main_player):
        time_step = dic['time_step']
        state = State.from_facts(dic['step']['state'],game_def)
        action = None if dic['step']['action'] is None else Action.from_facts(dic['step']['action'],game_def)
        s = cls(Step(state, action, time_step),main_player)
        return s

    def style(self):
        style = ['rounded','filled']
        if not (self.step.action is None):
            if self.step.action.player == self.main_player:
                style.append('solid')
            else:
                style.append('dotted')
        format_str = 'shape="box" style="%s" fontName="Bookman Old Style" labeljust=l'  % ( ",".join(style))
        return format_str

    @property
    def ascii(self):
        """
        Generate a label for the tree printing
        """
        raise NotImplementedError
        return self.step.ascii


class Tree:
    """
    Tree class to handle search trees for games
    """
    node_class = NodeBase

    def __init__(self,root=None,main_player="a"):
        """ Initialize with empty root node and game class """
        self.root = root
        self.main_player = main_player
    
    @classmethod
    def load_from_file(cls, file_path, game_def):
        """
        Creates a Tree from a file with the tree in json format
        Args:
            file_path: Path to the json file
        """
        with open(file_path) as feedsjson:
            tree_dic = json.load(feedsjson)
        importer = DictImporter()
        root = importer.import_(tree_dic['tree'])
        for n in PreOrderIter(root):
            n.name= cls.node_class.from_dic(n.name,game_def,tree_dic['main_player'])
        t = cls(root)
        return t

    def create_node(self, step, *argv):
        """
        Creates a new node from the current class
        """
        return self.__class__.node_class(step,self.main_player,*argv) 

    def find_by_state(self, state):
        """
        Finds all nodes from tree matching a state
        """
        return findall(self.root, lambda n: n.name.step.state==state)

    def get_number_of_nodes(self):
        """
        Gets the number of nodes of the tree
        """
        nodes = findall(self.root)
        return len(nodes)
    
            
    def save_in_file(self,file_path):
        """
        Saves the tree in a json file
        """
        for n in PreOrderIter(self.root):
            n.name=n.name.to_dic()
        exporter = DictExporter()
        tree_json = exporter.export(self.root)
        final_json = {'main_player':self.main_player,'tree':tree_json}
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'w') as feedsjson:
            json.dump(final_json, feedsjson, indent=4)

    def print_in_file(self,
                      file_name="tree_test.png"):
        """
        Function to plot generated tree as an image file

        Args:
            file_name (str): full name of image to be created
        """
        base_dir="./img/"
        image_file_name = base_dir + file_name
        # define local functions
        
        def aux(n):
            a = 'label="{}" {}'.format(n.name.ascii, n.name.style(parent=n.parent))
            return a
        os.makedirs(os.path.dirname(image_file_name), exist_ok=True)
        UniqueDotExporter(self.root,
                          nodeattrfunc=aux,
                          edgeattrfunc=lambda parent, child: 'arrowhead=vee').to_picture(image_file_name)
        log.info("Tree image saved in {}".format(image_file_name))

    @classmethod
    def node_from_match_initial(cls,match,main_player):
        """
        Function to construct a tree from a match class.
        It will create a tree with one branch representing the match
        Adds an extra root for the tree with the initial state.
        Args:
            match (Match): match to generate a tree

        Returns:
            root_node (anytree.Node): tree corresponding to match
        """
        initial = cls.node_class(Step(match.steps[0].state,None,-1),main_player)
        root_node = Node(initial)
        rest = cls.node_from_match(match,main_player)
        rest.parent = root_node
        return root_node

    @classmethod
    def node_from_match(cls,match,main_player):
        """
        Function to construct a tree from a match class.
        It will create a tree with one branch representing the match
        Args:
            match (Match): a constructed match

        Returns:
            root_node (anytree.Node): tree corresponding to match
        """
        root_node = Node(cls.node_class(match.steps[0],main_player=main_player),children=[])
        current_node = root_node
        for s in match.steps[1:]:
            new = Node(cls.node_class(s,main_player=main_player),parent=current_node)
            current_node = new
        return root_node
