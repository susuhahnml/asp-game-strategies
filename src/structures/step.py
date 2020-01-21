#!/usr/bin/env python
# -*- coding: utf-8 -*-

from .action import *
from py_utils.clingo_utils import *

class Step:
    """
    A class used to represent a Step on a match

    Attributes
    ----------
    state : State
        the state in which the action is taken
    action : Action
        the action taken in the step. For terminal states, action is None.
    time_step : int
        the time number in which the step was taken
    score : int
        the score for taking the action. It is set to the goals in the last
        timestep and calculated for the internal steps
    """
    def __init__(self,state,action,time_step):
        self.state = state
        self.action = action
        self.time_step = time_step
        self.score = None

    def fluents_to_asp_syntax(self):
        """
        Returns all the fluents of the current state in asp syntax
        """
        return fluents_to_asp_syntax(self.state.fluents,self.time_step)

    def action_to_asp_syntax(self):
        """
        Returns the perfomed action in asp syntax
        """
        return action_to_asp_syntax(self.action,self.time_step)

    def to_asp_syntax(self):
        """
        Returns the state and action in asp syntax
        """
        fluents_str = self.fluents_to_asp_syntax()
        if(self.action):
            action_str = self.action_to_asp_syntax()
            fluents_str += action_str
        return fluents_str

    def set_score(self, score):
        """
        Sets the score of the step

        Args:
            score: The new score
        """
        self.score = score

    def set_score_player(self, player_name):
        """
        Sets the score for an specific player

        Args:
            player_name: Name of the player
        """
        if(player_name in self.state.goals):
            self.set_score(self.state.goals[player_name])

    def __str__(self):
        """
        Returns a condensed string representation of the step
        """
        s=""
        if self.action:
            s= "*{}* score:{}, {}".format(self.time_step,self.score,self.action)
        else:
            return "NO ACTION"
        return s

    @property
    def str_expanded(self):
        """
        Returns an expanded string representation of the setp
        """
        if self.action:
            a_str = self.action.str_expanded
        else:
            a_str = "NO ACTION"
        s = "\n........... STEP {} ...........\n{}\n{}\n".format(
            self.time_step,self.state.srt_expanded,a_str)
        return s

    @property
    def ascii(self):
        """
        Returns the ascii representation of the step using the game definition
        """
        s = self.state.game_def.step_to_ascii(self)
        return s

    @property
    def ascii_score(self):
        """
        Returns the ascii representation of the step including the score
        """
        if self.score:
            if self.action != None:
                return "score:({})\n{}".format(self.score,
                                                          self.ascii)
            else:
                if(self.state.is_terminal):
                    return ("Terminal\n{}".format(self.ascii))
                else:
                    return (("minimax:({},{})\n"+"(a,b):(max,min)\n"+
                         "{}").format("a",
                                      self.score,
                                      self.ascii))
        else:
            return ""
