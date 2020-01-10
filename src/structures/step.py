#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .action import *
from py_utils.clingo_utils import *

class Step:
    def __init__(self,state,action,time_step):
        self.state = state
        self.action = action
        self.time_step = time_step
        self.score = None

    def fluents_to_asp_syntax(self):
        return fluents_to_asp_syntax(self.state.fluents,self.time_step)

    def action_to_asp_syntax(self):
        return action_to_asp_syntax(self.action,self.time_step)

    def to_asp_syntax(self):
        fluents_str = self.fluents_to_asp_syntax()
        if(self.action):
            action_str = self.action_to_asp_syntax()
            fluents_str += action_str
        return fluents_str

    def set_score(self, score):
        self.score = score

    def set_score_player(self, player_name):
        if(player_name in self.state.goals):
            self.set_score(self.state.goals[player_name])

    def __str__(self):
        s=""
        if self.action:
            s= "*{}* score:{}, {}".format(self.time_step,self.score,self.action)
        else:
            return "NO ACTION"
        return s

    @property
    def str_expanded(self):
        if self.action:
            a_str = self.action.str_expanded
        else:
            a_str = "NO ACTION"
        s = "\n........... STEP {} ...........\n{}\n{}\n".format(
            self.time_step,self.state.srt_expanded,a_str)
        return s

    @property
    def ascii(self):
        s = self.state.game_def.step_to_ascii(self)
        return s

    @property
    def ascii_score(self):
        if self.score:
            if self.action != None:
                return "score:({})\n{}".format(self.score,
                                                          self.ascii)
            else:
                return (("minimax:({},{})\n"+"(a,b):(max,min)\n"+
                         "{}").format("a",
                                      self.score,
                                      self.ascii))
        else:
            return ""
