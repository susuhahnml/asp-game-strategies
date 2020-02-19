#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Functions to print in console using colors
"""
class bcolors:
    REF = '\033[90m'
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def color_bool(b):
    if b:
        return "{}YES{}".format(bcolors.OKGREEN,bcolors.ENDC)
    else:
        return "{}NO{}".format(bcolors.FAIL,bcolors.ENDC)

def paint(s,color):
    return "{}{}{}".format(color,s,bcolors.ENDC)

def paint_bool(s,bool):
    color = bcolors.OKGREEN if bool else bcolors.FAIL
    return paint(s,color)
