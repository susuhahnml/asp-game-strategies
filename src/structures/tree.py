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
from .match import Match
from .step import Step
from py_utils.logger import log
import json
class Tree:
    """
    Tree class to handle search trees for games
    """
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
            n.name=Step.from_dic(n.name,game_def)
        t = cls(root)
        return t

    @staticmethod
    def get_scores_from_file(file_path):
        """
        Gets the dictionary wth all the scores from a file
        Args:
            file_path: Path to the json file
        """
        with open(file_path) as feedsjson:
            return json.load(feedsjson)


    def find_by_state(self, state):
        """
        Finds all nodes from tree matching a state
        """
        return findall(self.root, lambda n: n.name.state==state)


    def get_number_of_nodes(self):
        """
        Gets the number of nodes of the tree
        """
        nodes = findall(self.root, filter_=lambda node: not node.name.action is None and not node.name.score is None)
        return len(nodes)
    
    def best_action(self, state, main_player):
        """
        Finds the best action for the player in the given state 
        Args:
            state: The state of the game
            main_player: The player for which the action must be the best
        Returns:
            The best action, or none if there is no information in the tree
        """
        node_steps = self.find_by_state(state)
        if len(node_steps) == 0:
            return None
        else:
            best_node = None
            for node in node_steps:
                if(best_node is None):
                    best_node = node
                    continue
                score=node.name.score
                if(main_player == self.main_player):
                    if(score>best_node.name.score):
                        best_node = node
                        continue
                    continue
                if(main_player != self.main_player):
                    if(score<best_node.name.score):
                        best_node = node
                        continue
                    continue
            return best_node.name.action.action
            
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

    def save_scores_in_file(self,file_path):
        """
        Saves the tree states as a dictionary to dinf best scores
        """
        state_dic = {}
        for n in PreOrderIter(self.root):
            if n.name.action is None:
                continue
            if n.name.score is None:
                continue
            state_facts = n.name.state.to_facts()
            if not state_facts in state_dic:
                state_dic[state_facts] = {}
            state_dic[state_facts][n.name.action.to_facts()] = n.name.score

        final_json = {'main_player':self.main_player,'tree_scores':state_dic}
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'w') as feedsjson:
            json.dump(final_json, feedsjson, indent=4)

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
            if not step.action is None:
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