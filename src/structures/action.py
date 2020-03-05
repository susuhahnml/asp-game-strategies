#!/usr/bin/env python
# -*- coding: utf-8 -*-
import clingo 
from py_utils.clingo_utils import get_new_control, Context
class Action:
    """
    A class used to represent an action in the game

    Attributes
    ----------
    player : str
        Name of the player that performs the action
    action: clingo.Symbol
        Symbol defining the action
    """
    def __init__(self, player, action):
        self.player = player
        self.action = action

    def __eq__(self, other):
        if other is None:
            return False
        return self.to_facts() == other.to_facts()

        
    @property
    def str_expanded(self):
        return """
        --------------- ACTION ----------------
        DOES: {}   PLAYER: {}
        ---------------------------------------
        """.format(str(self.action), self.player)
    
    @classmethod
    def from_facts(cls,facts,game_def):
        ctl = get_new_control(game_def)
        ctl.add("base",[],facts)
        ctl.ground([("base", [])], context=Context())
        with ctl.solve(yield_=True) as handle:
            for model in handle:
                atoms = model.symbols(atoms=True)
                return cls(atoms[0].arguments[0].name,atoms[0].arguments[1])

    def to_facts(self):
        return "does({},{}).".format(self.player,self.action)

    def __str__(self):
        return "({}):{}".format(self.player,str(self.action))

class ActionExpanded(Action):
    """
    A class used to represent an action that includes the next fluents
    that will become true when the action is taken.

    Attributes
    ----------
    next_fluents : list(str)
        List of fluents that will hold in the next time step
        once the action is performed.
    cost : int
        The optimality cost provided by clingo when using optimization
    """
    def __init__(self, player, action, next_fluents, cost):
        super().__init__(player,action)
        self.next_fluents = next_fluents
        self.cost = cost

    @property
    def str_expanded(self):
        """
        A string to represent the action with its possible next fluents
        """
        l = "\n\t".join([str(n) for n in self.next_fluents])
        return """
        -------- ACTION -------
        PLAYER: {}   DOES: {}   COST: {}
        -> NEXT FLUENTS:
        {}
        -----------------------
        """.format(self.player, str(self.action),  self.cost, l)
