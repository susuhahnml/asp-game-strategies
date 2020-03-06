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
    def __init__(self, step, main_player, score=None):
        super().__init__(step,main_player=main_player)
        self.score = score

    @classmethod
    def from_dic(cls, dic, game_def):
        """
        Constructs a Step from a dictionary
        """
        # from structures.state import State
        score = dic['score']
        time_step = dic['time_step']
        state = State.from_facts(dic['step']['state'],game_def)
        action = None if dic['step']['action'] is None else Action.from_facts(dic['step']['action'],game_def)
        s = cls(Step(state, action, time_step),score)
        return s

    def to_dic(self):
        """
        Returns a serializable dictionary to dump on a json
        """
        return {
            "score": self.score,
            "step": self.step.to_dic()
        }

    def set_score(self,score):
        self.score = score

    @property
    def ascii(self):
        """
        Returns the ascii representation of the step including the score
        Used for printing
        """
        if self.score:
            if not self.step.action is None:
                return "〔score {}〕\n{}".format(self.score, self.step.state.ascii)
            else:
                if(self.step.state.is_terminal):
                    # return ("Terminal:({})\n{}".format(self.score,self.state.ascii))
                    return ("〔score {}〕".format(self.score))
                else:
                    other_player = "b" if self.main_player=="a" else "a"
                    s ="〔score {}〕\nmax:{}\nmin:{}\n{}".format(self.score,self.main_player,other_player,self.step.state.ascii)
                    return s
        else:
            return ""

    def style(self):
        format_str = NodeBase.style(self)

        if self.score is None:
            format_str += ' fillcolor="#e4e4e4"'
        else:
            if self.score<0:
                format_str += ' fillcolor="#fbe7e6"'
            elif self.score>0:
                format_str += ' fillcolor="#e6fbea"'
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
        nodes = findall(self.root, filter_=lambda node: not node.name.step.action is None and not node.name.score is None)
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
            return best_node.name.step.action.action
            
    def save_scores_in_file(self,file_path):
        """
        Saves the tree states as a dictionary to dinf best scores
        """
        state_dic = {}
        for n in PreOrderIter(self.root):
            if n.name.step.action is None:
                continue
            if n.name.score is None:
                continue
            state_facts = n.name.step.state.to_facts()
            if not state_facts in state_dic:
                state_dic[state_facts] = {}
            state_dic[state_facts][n.name.step.action.to_facts()] = n.name.score

        final_json = {'main_player':self.main_player,'tree_scores':state_dic}
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'w') as feedsjson:
            json.dump(final_json, feedsjson, indent=4)

    