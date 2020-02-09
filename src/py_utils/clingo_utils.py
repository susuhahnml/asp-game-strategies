#!/usr/bin/env python
# -*- coding: utf-8 -*-

import clingo
import abc
from .colors import *

example_number = 0

def get_next_example_name():
    global example_number
    example_name = "e" + str(example_number)
    example_number+=1
    return example_name

class Context:
    def id(self, x):
        return x
    def seq(self, x, y):
        return [x, y]

def symbol_str(symbol):
    """
    Transforms a clingo.Symbol into a string
    """
    if(symbol.type == clingo.SymbolType.Function):
        arg_strings = list(map(lambda x: symbol_str(x), symbol.arguments))
        if len(arg_strings)==0:
            return '{}'.format(symbol.name)
        else:
            return '{}({})'.format(symbol.name, ','.join(arg_strings))
    elif(symbol.type == clingo.SymbolType.Number):
        return  str(symbol.number)
    elif(symbol.type == clingo.SymbolType.String):
        return  symbol.string
    else:
        return symbol.type

def get_all_models(all_path):
    """
    Obtains all possible models of given path as string
    """
    ctl = clingo.Control(["0","--warn=none"])
    # Check if it can load from grounded atoms gotten from AS
    ctl.load(all_path)
    ctl.ground([("base", [])], context=Context())
    models = []
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            atoms = model.symbols(terms=True,shown=True)
            models.append(''.join(["{}.".format(symbol_str(a)) for a in atoms]))
        return models

def has_player_ref(symbol,player_name):
    if(symbol.type == clingo.SymbolType.Function):
        if(symbol.name == player_name and len(symbol.arguments) ==0):
            return True
        list(map(lambda x: has_player_ref(x,player_name), symbol.arguments))
        return any(list(map(lambda x: has_player_ref(x,player_name), symbol.arguments)))
    elif(symbol.type == clingo.SymbolType.Number):
        return  False
    elif(symbol.type == clingo.SymbolType.String):
        return  symbol.string == player_name
    else:
        return symbol.type == player_name


def get_all_possible(all_path,player_name):
    """
    Obtains all possible actions and observations with an initial encoding
    """
    ctl = clingo.Control(["0","--warn=none"])
    # Check if it can load from grounded atoms gotten from AS
    ctl.load(all_path)
    ctl.ground([("base", [])], context=Context())
    with ctl.solve(yield_=True) as handle:
        for model in handle:
            atoms = model.symbols(atoms=True)
            does = [a for a in atoms if a.name=='does']
            fluents = [a for a in atoms if a.name=='true']
            assert len(does) > 0 
            actions = [d.arguments[0] for d in does]
            observations = [f.arguments[0] for f in fluents]
            observations = sorted(observations, key=lambda x: not has_player_ref(x,player_name))
        return actions, observations

def fluents_to_asp_syntax(fluents,time=None):
    if time is None:
        base = "true({})."
    else:
        base = "holds({},{})."
    return " ".join([base.format(symbol_str(f),time) for f in fluents])

def action_to_asp_syntax(action,time=None):
    if time is None:
        base = "does({},{})."
    else:
        base = "does({},{},{})."
    return base.format(action.player,symbol_str(action.action),time)

def generate_example(leaned_examples, state_context,good_action,bad_action):
    if leaned_examples is None:
        return
    context = fluents_to_asp_syntax(state_context.fluents)
    good_example_name = get_next_example_name()
    bad_example_name = get_next_example_name()
    good_example =  "#pos({},{{ {} }}, {{}}, {{\n {} \n}}).".format(
        good_example_name, action_to_asp_syntax(good_action)[:-1], context )
    bad_example =  "#pos({},{{ {} }}, {{}}, {{\n {} \n}}).".format(
        bad_example_name, action_to_asp_syntax(bad_action)[:-1], context )
    order = "#brave_ordering({},{}).".format(good_example_name,bad_example_name)
    leaned_examples.append("\n{}\n{}\n{}".format(good_example,bad_example,order))

def edit_vars(pred,subst_var,var_set):
    trad_args = []
    def add_v(is_var, v_par):
        if is_var:
            v = "V{}".format(v_par)
            var_set.add(v)
        trad_args.append( v if is_var else v_par)
    for i,arg in enumerate(pred.arguments):
        is_var = subst_var[pred.name][i]
        if(arg.type == clingo.SymbolType.Function):
            if len(arg.arguments)>0:
                trad_args.append(edit_vars(arg,subst_var,var_set))
            else:
                add_v(is_var, arg.name)
        elif(arg.type == clingo.SymbolType.Number):
            add_v(is_var, str(arg.number))
        elif(arg.type == clingo.SymbolType.String):
            add_v(is_var, str(arg.string))
    return "{}({})".format(pred.name,",".join(trad_args))

def generate_rule(learned_rules, game_def, state_context,sel_action):
    if learned_rules is None:
        return
    #TODO make it general for variable context
    subst_var = game_def.subst_var
    variables = set([])
    rule = "best_do({},{},T):-".format("V"+sel_action.player,
                                          edit_vars(sel_action.action,
                                                    subst_var,variables))
    for fluent in state_context.fluents:
        rule+="holds({},T),".format(edit_vars(fluent,subst_var,variables))
    variables =  list(variables)
    n_variables = len(variables)
    for i in range(n_variables):
        for j in range(i+1,n_variables):
            rule += "{}!={},".format(variables[i],variables[j])
    learned_rules.append(rule[:-1] + ".")


def rules_file_to_gdl(file_path):
    with open(file_path, 'r') as file:
        data = file.read()
        data = data.replace(',T)',')')
        data = data.replace('holds','true')
        text_file = open(file_path[:-4]+'gdl.txt', "wt")
        text_file.write(data)
        text_file.close()

names_update = ['legal','true','does','goal','terminal','next']


def add_time(stm):
    stm_type = str(stm.type)
    # print("\nSTM: {}({})".format(stm,stm_type))

    if stm_type == "Rule":
        add_time(stm.head)
        return any([add_time(i) for i in stm.body])
    elif stm_type == "Aggregate":
        return any([add_time(i) for i in stm.elements])
    elif stm_type == "ConditionalLiteral":
        l_t = add_time(stm.literal)
        l_c = any([add_time(i) for i in stm.condition])
        return l_t or l_c
    elif stm_type == "Literal":
        return add_time(stm.atom)
    elif stm_type == "Function":
        fun_name = stm.name
        l_a = any([add_time(i) for i in stm.arguments])

        if fun_name in names_update:
            var = clingo.ast.Variable(stm.location,"T")
            if fun_name == "next":
                stm.name = "holds"
                var = clingo.ast.BinaryOperation(stm.location,clingo.ast.BinaryOperator.Plus,var,1)
            if fun_name == "true":
                stm.name = "holds"
            stm.arguments.append(var)
            return True
        else:
            return l_a
    elif stm_type == "SymbolicAtom":
        return add_time(stm.term)
    elif stm_type == "BodyAggregate":
        added = False
        for w in stm.elements:
            l_a = any([add_time(i) for i in w.tuple])
            l_c = any([add_time(i) for i in w.condition])
            added = added or l_a or l_c
        return added
    elif stm_type == "Variable":
        return False
    else:
        # print("No match {}({})".format(stm,stm_type))
        return False

def gdl_to_full_time(path,file_name):
    file = open(path+'/'+file_name,'r')
    prg = "".join(file.readlines())
    updated_rules = []
    def add_time_rule(stm):
        added_time = add_time(stm)
        if(added_time):
            time_f = clingo.ast.Function(stm.location,"time",[clingo.ast.Variable(stm.location,"T")],False)
            stm.body.append(time_f)
        updated_rules.append(str(stm))
    clingo.parse_program(prg, add_time_rule)
    
    # Adding time rule time(0..15)
    interval = clingo.ast.Interval("begin",0,15)
    fun = clingo.ast.Function("begin","time",[interval],False)
    sa = clingo.ast.SymbolicAtom(fun)
    lit = clingo.ast.Literal("begin",clingo.ast.Sign.NoSign,sa)
    time_rule = clingo.ast.Rule("begin",lit,[])
    updated_rules.append(str(time_rule))

    file = open(path+'/full_time.lp','w')
    file.write("\n".join(updated_rules))
    file.close
