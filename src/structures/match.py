#!/usr/bin/env python
# -*- coding: utf-8 -*-

from collections import defaultdict
from .state import *
from .action import *
from structures.step import *

class Match:
    def __init__(self,steps):
        self.steps = steps

    def add_step(self, step):
        self.steps.append(step)

    @classmethod
    def from_time_model(cls, model, game_def, main_player = None):
        atoms = model.symbols(atoms=True)
        fluent_steps = defaultdict(lambda: {'fluents':[],'goals':[],
                                            'action':None})
        for a in atoms:
            if(a.name=="holds"):
                time = a.arguments[1].number
                if(a.arguments[0].name == "goal"):
                    fluent_steps[time]['goals'].append(a.arguments[0])
                    continue
                else:
                    fluent_steps[time]['fluents'].append(a.arguments[0])
            elif(a.name=="does"):
                time = a.arguments[2].number
                fluent_steps[time]['action'] = a
        fluent_steps = dict(fluent_steps)
        steps = []
        for i in range(len(fluent_steps)):
            state = State(fluent_steps[i]['fluents'],fluent_steps[i]['goals'],
                          game_def)
            action = None
            if(not fluent_steps[i]['action']):
                pass
            else:
                action = Action(fluent_steps[i]['action'].arguments[0].name,
                                fluent_steps[i]['action'].arguments[1])
            step = Step(state,action,i)
            steps.append(step)
        steps[-1].state.is_terminal = True
        steps[-1].set_score_player(main_player)
        return cls(steps)

    @property
    def goals(self):
        if(len(self.steps) == 0):
            return {}
        return self.steps[-1].state.goals

    def __str__(self):
        s = ""
        c = [bcolors.OKBLUE,bcolors.HEADER]
        for step in self.steps:
            # print(step.time_step.state)
            s+=c[step.time_step%2]
            s+="\nSTEP {}:".format(step.time_step)
            s+= step.ascii
            if(step.state.is_terminal):
                s+="{}GOALS: \n{}{}".format(bcolors.OKGREEN, step.state.goals,
                                            bcolors.ENDC)
            s+=bcolors.ENDC
        return s
