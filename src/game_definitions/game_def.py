#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from collections import defaultdict

class GameDef():
    """ Template class which can be reproduced for multiple games """
    def __init__(self,path):
        """
        Creates a game definition from a path.

        Args:
            game_path (str): Path to directory with following files:
                - background.lp: Clingo file with all rules
                from the game in GDL format
                - initial.lp: Clingo file with all facts
                for the initial state
                - full_time.lp: Clingo file with all rules
                from the game in action description language with time steps
        """
        self.path = path
        self.background = path + "/background.lp"
        self.full_time = path + "/full_time.lp"
        self.initial = path + "/initial.lp"
        self.all = path + "/all.lp"
        # TODO think how to put this inside clingo..


    def state_to_ascii(self, state):
        """
        Transforms a state into ascii representation

        Args:
            state (State): A state of type State

        Returns:
            String with asciii representation
        """
        return NotImplementedError

    def step_to_ascii(self, step):
        """
        Transforms a state into ascii representation
        with the efects of the action

        Args:
            state (State): A step of type Step

        Returns:
            String with asciii representation
        """
        return NotImplementedError

class GameNimDef(GameDef):
    def __init__(self,path="./game_definitions/nim"):
        super().__init__(path)
        with open(path+"/initial.lp","r") as File:
            check = File.readlines()
        check = [[int(els) for els in re.sub(r".*has\((\d+\,\d+)\)\)\.","\g<1>",
                        el.replace("\n","")).split(",")]
                 for el in check if "has" in el]
        check = [ls for ls in check if ls[1] != 0]
        self.number_piles = len(check)
        self.max_number = max([ls[1] for ls in check])
        self.subst_var = {"remove":[True,False],
                          "has":[True,False],"control":[False]}

    def state_to_ascii(self,state):
        has = {f.arguments[0].number:f.arguments[1].number
               for f in state.fluents if f.name=="has"}
        a = ""
        for p in range(self.number_piles):
            n = has[p+1] if p+1 in has else 0
            a+="• "*n  + " "*((self.max_number-n)*2) + "\n"
        return a

    def step_to_ascii(self,step):
        state = step.state
        a = "\n"
        a += self.state_to_ascii(state)
        if(not step.action):
            return a
        p = step.action.action.arguments[0].number
        n = step.action.action.arguments[1].number
        lines = a.splitlines()
        new_line = (step.action.player+" ")*(n) + lines[p][(n)*2:]
        lines[p] = new_line
        for i,line in enumerate(lines):
            if i != 0 and re.match(r'^\s*$', line):
                del lines[i]
        return "\n".join(lines)
# 