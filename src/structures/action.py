#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Action:
    """
    A class used to represent a possible action

    Attributes
    ----------
    player : str
        Name of the player that performs the action
    action: Symbol
        Symbol defining the action
    """
    def __init__(self, player, action):
        self.player = player
        self.action = action

    @property
    def str_expanded(self):
        return """
        --------------- ACTION ----------------
        DOES: {}   PLAYER: {}
        ---------------------------------------
        """.format(str(self.action), self.player)

    def __str__(self):
        return "({}):{}".format(self.player,str(self.action))

class ActionExpanded(Action):
    """
    A class used to represent a possible action

    Attributes
    ----------
    player : str
        Name of the player that performs the action
    action: Symbol
        Symbol defining the action
    next_fluents : list(str)
        List of fluents that will hold in the next time step
        once the action is performed.
    cost : int
        The optimality cost
    """
    def __init__(self, player, action, next_fluents, cost):
        super().__init__(player,action)
        self.next_fluents = next_fluents
        self.cost = cost

    @property
    def str_expanded(self):
        l = "\n\t".join([str(n) for n in self.next_fluents])
        return """
        -------- ACTION -------
        PLAYER: {}   DOES: {}   COST: {}
        -> NEXT FLUENTS:
        {}
        -----------------------
        """.format(self.player, str(self.action),  self.cost, l)
