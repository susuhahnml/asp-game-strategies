#!/usr/bin/env python
# -*- coding: utf-8 -*-

from structures.action import Action, ActionExpanded
from py_utils.clingo_utils import *

class Step:
    """
    A class used to represent a Step on a match.

    Attributes
    ----------
    state : State
        the state in which the action is taken
    action : Action
        the action taken in the step. For terminal states, action is None.
    time_step : int
        the time number in which the step was taken
    """
    def __init__(self,state,action,time_step):
        self.state = state
        self.action = action
        self.time_step = time_step

    def __hash__(self):
        a_f = 0 if self.action is None else self.action.to_facts()
        return hash((self.state.to_facts(),a_f))

    def __eq__(self, other):
        eq = self.state == other.state
        eq = eq and self.action == other.action
        return eq

    @classmethod
    def from_dic(cls,dic,game_def):
        """
        Constructs a Step from a dictionary
        """
        from structures.state import State
        score = dic['score']
        time_step = dic['time_step']
        state = State.from_facts(dic['state'],game_def)
        action = None if dic['action'] is None else Action.from_facts(dic['action'],game_def)
        s = cls(state,action,time_step,score)
        return s

    def to_dic(self):
        """
        Returns a serializable dictionary to dump on a json
        """
        return {
            "time_step": self.time_step,
            "state": self.state.to_facts(),
            "action": None if self.action is None else self.action.to_facts()
        }

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
        return self.ascii

    @property
    def str_expanded(self):
        """
        Returns an expanded string representation of the step
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