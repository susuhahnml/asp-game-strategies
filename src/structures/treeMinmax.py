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
from structures.action import Action
from .match import Match
from .step import Step
from py_utils.logger import log
import json
from structures.tree import Tree, NodeBase
class NodeMinmax(NodeBase):
    def __init__(self, step, main_player, dic={}, parent = None, children = []):
        super().__init__(step,main_player=main_player,parent=parent, children=children)
        self.score = 0 if not "score" in dic else dic["score"]

    def add_info_to_dic(self,dic):
        """
        Returns a serializable dictionary to dump on a json
        """
        dic["score"] = self.score

    def set_score(self,score):
        self.score = score

    @property
    def ascii(self):
        """
        Returns the ascii representation of the step including the score
        Used for printing
        """
        if not self.score is None:
            if not self.step.action is None:
                return "〔score {}〕\n{}".format(self.score, self.step.ascii)
            else:
                if(self.step.state.is_terminal):
                    # return ("Terminal:({})\n{}".format(self.score,self.state.ascii))
                    return ("〔score {}〕".format(self.score))
                else:
                    other_player = "b" if self.main_player=="a" else "a"
                    s ="〔score {}〕\nmax:{}\nmin:{}\n{}".format(self.score,self.main_player,other_player,self.step.ascii)
                    return s
        else:
            return ""

    def style(self,parent=None):
        format_str = NodeBase.style(self)
        if self.score is None:
            format_str += ' fillcolor="#FEFEFE"'
        else:
            if self.score<0:
                format_str += ' fillcolor="#FF000020"'
            elif self.score>0:
                format_str += ' fillcolor="#00ff0010"'
            elif self.score==0:
                format_str += ' fillcolor="#FFFFFF05"'
        return format_str

class TreeMinmax(Tree):
    """
    Tree class to handle search trees for games
    """
    node_class = NodeMinmax
    def __init__(self,root=None,main_player="a"):
        """ Initialize with empty root node and game class """
        super().__init__(root,main_player)

    @staticmethod
    def get_scores_from_file(file_path):
        """
        Gets the dictionary wth all the scores from a file
        Args:
            file_path: Path to the json file
        """
        with open(file_path) as feedsjson:
            return json.load(feedsjson)

    def get_number_of_nodes(self):
        """
        Gets the number of nodes of the tree
        """
        nodes = findall(self.root, filter_=lambda node: not node.step.action is None and not node.score is None)
        return len(nodes)
    
    
    def save_scores_in_file(self,file_path):
        """
        Saves the tree states as a dictionary to define best scores
        """
        state_dic = {}
        for n in PreOrderIter(self.root):
            if n.step.action is None:
                continue
            if n.score is None:
                continue
            state_facts = n.step.state.to_facts()
            if not state_facts in state_dic:
                state_dic[state_facts] = {}
            state_dic[state_facts][n.step.action.to_facts()] = n.score

        final_json = {'main_player':self.main_player,'tree_scores':state_dic}
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'w') as feedsjson:
            json.dump(final_json, feedsjson, indent=4)

    