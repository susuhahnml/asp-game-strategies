#!/usr/bin/env python
# -*- coding: utf-8 -*-
import math
from approaches.random.player import RandomPlayer
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

class NodeMCTS(NodeBase):
    def __init__(self, step, main_player, t=0, n=0):
        """
        Constructs a node
        Args:
            t: Value calculated with back prop
            n: Number of times it has been visited
        """
        super().__init__(step,main_player=main_player)
        self.t = t
        self.n = n

    @classmethod
    def from_dic(cls, dic, game_def):
        """
        Constructs a Node from a dictionary
        """
        t = dic['t']
        n = dic['n']
        time_step = dic['time_step']
        state = State.from_facts(dic['step']['state'],game_def)
        action = None if dic['step']['action'] is None else Action.from_facts(dic['step']['action'],game_def)
        s = cls(Step(state, action, time_step),t,n)
        return s

    def to_dic(self):
        """
        Returns a serializable dictionary to dump on a json
        """
        return {
            "t": self.t,
            "n": self.n,
            "step": self.step.to_dic()
        }

    def incremet_visits(self):
        self.n = self.n + 1

    def incremet_value(self,t):
        self.t = self.t + t

    @property
    def ascii(self):
        """
        Returns the ascii representation of the step including the visits and value
        Used for printing
        """
        if not self.step.action is None:
            return "〔t:{} n:{}〕\n{}".format(self.t,self.n, self.step.ascii)
        else:
            if(self.step.state.is_terminal):
                return ("〔t:{} n:{}〕".format(self.t,self.n))
            else:
                other_player = "b" if self.main_player=="a" else "a"
                s ="〔t:{} n:{}〕\nmax:{}\nmin:{}\n{}".format(self.t,self.n,self.main_player,other_player,self.step.ascii)
                return s

    def style(self,parent):
        format_str = NodeBase.style(self)
        a = self.n if parent is None else self.n/parent.name.n
        base = ' fillcolor="#00FF00{}"' if a>0.5 else ' fillcolor="#FF0000{}"'
        final = 0.8-a if a<0.5 else a -0.2
        alpha = "{0:0=2d}".format(int(final*100))
        format_str += base.format(alpha)
        return format_str

    def __str__(self):
        return self.ascii

class TreeMCTS(Tree):
    """
    Tree class to handle search trees for games
    """
    node_class = NodeMCTS
    def __init__(self,root,game_def,main_player="a"):
        """ Initialize with empty root node and game class """
        super().__init__(Node(root),main_player)
        self.game_def = game_def
        self.pa = RandomPlayer(game_def,"random",main_player)
        self.pb = RandomPlayer(game_def,"random",main_player)

    def get_best_action(self,node):
        next_n =  max(node.children, key=lambda n: n.name.n)
        return next_n.name.step.action
        
    def get_train_list(self):
        dic = {}
        for n in self.root.children:
            self.add_to_training_dic(self.root.name.n,dic,n)
        return dic.values()

    def add_to_training_dic(self,n_total,dic,node):
        if node.name.step in dic:
            log.info("Duplicated step")
            log.info(node.name.step)
            if dic[node.name.step]['n']>=node.name.n:
                return
        next_nodes = node.children
        if len(next_nodes) == 0:
            return
        dic[node.name.step] = {'s_init':node.name.step.state,
            'action':node.name.step.action,
            's_next':next_nodes[0].name.step.state,
            'p':node.name.n/n_total,
            'n':node.name.n}
        
        for n in next_nodes:
            self.add_to_training_dic(node.name.n,dic,n)
        

    def run_mcts(self, n_iter, initial_node = None):
        node = self.root if initial_node is None else initial_node
        current_state = node.name.step.state
        for a in current_state.legal_actions:
            step =Step(current_state,a,node.name.step.time_step)
            Node(NodeMCTS(step,self.main_player),node)
        
        for i in range(n_iter):
            self.tree_traverse(self.root)

    def tree_traverse(self, node, expl =2 ):
        if node.is_leaf:
            if node.name.n == 0:
                next_node = node
            else:
                self.expand(node)
                if node.is_leaf:
                    next_node = node
                else:
                    next_node = node.children[0]
            v = self.rollout(next_node)
            self.backprop(next_node,v)
        else:
            def ucb1(node):
                if node.name.n == 0:
                    return math.inf
                r = (node.name.t/node.name.n) 
                if node.name.step.state.control != self.main_player:
                    r = -1*r
                r += expl*(math.sqrt(math.log(node.parent.name.n)/node.name.n))
                return r

            next_node = max(node.children,key= ucb1) 
            self.tree_traverse(next_node)
    
    def expand(self, node):
        #Add one child per legal action
        current_action = node.name.step.action
        current_state = node.name.step.state.get_next(current_action)
        for a in current_state.legal_actions:
            step =Step(current_state,a,node.name.step.time_step)
            Node(NodeMCTS(step,self.main_player),node)
        

    def rollout(self, node):
        state = node.name.step.state
        if state.is_terminal:
            return state.goals[self.main_player]
        self.game_def.initial = state.to_facts()
        import signal
        match, benchmarks = Match.simulate(self.game_def,[self.pa,self.pb],signal_on =False)
        return match.goals[self.main_player]

    def backprop(self, node, v):
        while(not node is None):
            node.name.incremet_visits()
            node.name.incremet_value(v)
            node = node.parent
        pass

    
    def save_values_in_file(self,file_path):
        """
        Saves the tree states as a dictionary to define best scores
        """
        state_dic = {}
        for n in PreOrderIter(self.root):
            if n.name.step.action is None:
                continue
            state_facts = n.name.step.state.to_facts()
            if not state_facts in state_dic:
                state_dic[state_facts] = {}
            state_dic[state_facts][n.name.step.action.to_facts()] = {'t':n.name.t,'n':n.name.n}

        final_json = {'main_player':self.main_player,'tree_values':state_dic}
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        with open(file_path, 'w') as feedsjson:
            json.dump(final_json, feedsjson, indent=4)

    