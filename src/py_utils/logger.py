#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Functions to allow logging levels across the project. 
"""
import logging
from py_utils.colors import bcolors

formatter = logging.Formatter('%(message)s')
logger = logging.getLogger('general')
logger.setLevel(logging.DEBUG)
logger.handlers.clear()
logger.propagate = False
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)
fmt = '%(message)s'
formatter = logging.Formatter(fmt)
console_handler.setFormatter(formatter)
logger.addHandler(console_handler) 

class Log:

    def __init__(self):
        self.info = lambda m: logger.info("\n{}INFO:  {}{}".format(
            bcolors.OKGREEN,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
        self.debug = lambda m: logger.debug("\n{}DEBUG: {}{}".format(
            bcolors.OKBLUE,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
        self.error = lambda m: logger.error("\n{}ERROR: {}{}".format(
            bcolors.FAIL,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
   
    @staticmethod
    def set_level(level):
        n_level = getattr(logging, level.upper(), None)
        logger.setLevel(n_level)
        console_handler.setLevel(n_level)

    
    @staticmethod
    def is_disabled_for(level):
        real_level = logger.level
        n_level = getattr(logging, level.upper(), None)
        return real_level>n_level

log = Log()