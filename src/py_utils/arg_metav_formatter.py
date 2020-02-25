#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
from py_utils.logger import log

class CustomHelpFormatter(argparse.HelpFormatter):
    def __init__(self, prog):
        super().__init__(prog, max_help_position=40, width=120)

    def _split_lines(self, text, width):
        s= [text]
        if text.startswith('R|'):
            s= text[2:].splitlines()  
        # this is the RawTextHelpFormatter._split_lines
        parsed =  [argparse.HelpFormatter._split_lines(self, t, width) for t in s]
        if len(parsed) == 1:
            return parsed[0] + ['']
        else:
            flattened_list = [y for x in parsed for y in x]
            return flattened_list + ['']

    
    def _format_action_invocation(self, action):
        if not action.option_strings or action.nargs == 0:
            return super()._format_action_invocation(action)
        # default = self._get_default_metavar_for_optional(action)
        args_string = self._format_args(action, "")
        return ', '.join(action.option_strings) + ' ' + args_string

    
    def _format_action(self, action):
        if type(action) == argparse._SubParsersAction:
            # inject new class variable for subcommand formatting
            subactions = action._get_subactions()
            invocations = [self._format_action_invocation(a) for a in subactions]
            self._subcommand_max_length = max(len(i) for i in invocations)

        if type(action) == argparse._SubParsersAction._ChoicesPseudoAction:
            # format subcommand help line
            subcommand = self._format_action_invocation(action) # type: str
            width = self._subcommand_max_length
            help_text = ""
            if action.help:
                help_text = self._expand_help(action)
            return "  {:{width}} -  {}\n".format(subcommand, help_text, width=width)

        elif type(action) == argparse._SubParsersAction:
            # process subcommand help section
            msg = '\n'
            for subaction in action._get_subactions():
                msg += self._format_action(subaction)
            return msg
        else:
            return super(CustomHelpFormatter, self)._format_action(action)

