#!/usr/bin/env python
# -*- coding: utf-8 -*-
import random
import re
from collections import defaultdict
from py_utils.colors import *
from py_utils.clingo_utils import *
from py_utils.logger import log

class GameDef():
    """ Template class which can be reproduced for multiple games """
    def __init__(self,path,initial):
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
            initial (str): String or path to file to overwrite the initial state 
        """
        self.path = path
        self.background = path + "/background.lp"
        self.full_time = path + "/full_time.lp"
        self.initial = path + "/initial.lp"
        self.all = path + "/all.lp"
        self.random_init = None
        if not initial is None:
            self.initial = initial


    @classmethod
    def from_name(cls,name,initial=None):
        if name == "Dom":
            return GameDomDef(initial=initial)
        elif name == "Nim":
            return GameNimDef(initial=initial)
        else:
            log.error("Invalid game name {}".format(name))
            raise NotImplementedError

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
    
    def get_initial_time(self,random=False):
        """
        Obtains the initial state in full time format
        """
        if(random):
            content =  self.get_random_initial()
        elif(self.initial_is_file):
            with open(self.initial,"r") as File:
                lines = File.readlines()
                content = "".join(lines)
        else:
            content = self.initial + ""
        content = content.replace(").",",0).")
        content = content.replace("true","holds")
        return content

    @property
    def initial_is_file(self):
        return(self.initial[-3:] == ".lp")

    def get_random_initial(self):
        if self.random_init is None:
            self.random_init = get_all_models(self.path + "/ran_initial.lp")
        return random.choice(self.random_init)

class GameNimDef(GameDef):
    def __init__(self,path="./game_definitions/nim",initial=None):
        super().__init__(path,initial)
        if self.initial_is_file:
            with open(self.initial,"r") as File:
                check = File.readlines()
        else:
            check =  [s+'.' for s in self.initial.split('.')]
        check = [[int(els) for els in re.sub(r".*has\((\d+\,\d+)\)\)\.","\g<1>",
                        el.replace("\n","")).split(",")]
                 for el in check if "has" in el]
        # check = [ls for ls in check if ls[1] != 0]
        #TODO pass this as parameters
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


class GameDomDef(GameDef):
    def __init__(self,path="./game_definitions/dominoes",initial=None):
        super().__init__(path,initial)
        self.max_number=4
        self.subst_var = {"in_hand":[True,False],
                          "stack":[True,True],
                          "plays":[False,True],
                          "pass":[],
                          "control":[False],
                          "domino":[True,True]}

    def state_to_ascii(self, state):
        div = "-"*(self.max_number*2 +1) +"\n"
        a = div
        in_hand = [f for f in state.fluents if f.name == "in_hand"]
        hands = {'a':[],'b':[]}
        for h in in_hand:
            t = (h.arguments[1].arguments[0].number,h.arguments[1].arguments[1].number)
            hands[h.arguments[0].name].append(t)
        stack = {f.arguments[0].name:f.arguments[1].number for f in state.fluents if f.name == "stack"}
        cont_a = "➤ " if state.control == "a" else " "
        cont_b = "➤ " if state.control == "b" else " "
        hand_a = "  ".join(["{}-{}".format(t[0],t[1]) for t in hands['a']])
        hand_b = "  ".join(["{}-{}".format(t[0],t[1]) for t in hands['b']])
        return """
{}a: {}

    ⎡{}⎤
    ⎣{}⎦

{}b: {}
        """.format(cont_a, hand_a, stack['l'],stack['r'],cont_b,hand_b)
    
    def step_to_ascii(self, step):
        p=step.state.control
        state = step.state
        a_split = self.state_to_ascii(state).splitlines(True)
        if(not step.action):
            return "".join(a_split)
        if(step.action.action.name=="pass"):
            a_split = a_split[:3] + ["\tpass\n"] + a_split[3:]
            a_split = a_split[:6] + ["\tpass\n"] + a_split[6:]
            return "".join(a_split)
        d = (step.action.action.arguments[0].arguments[0].number,step.action.action.arguments[0].arguments[1].number)
        s = step.action.action.arguments[1].name
        d_string = "\t[{}-{}]\n".format(d[0],d[1])
        if s == "l":
            a_split = a_split[:3] + [d_string] + a_split[3:]
        else:
            a_split = a_split[:5] + [d_string] + a_split[5:]
        return "".join(a_split)
# 