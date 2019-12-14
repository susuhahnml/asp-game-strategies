#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter

####################################
# define key functions/workflows
####################################

def square_possibilities(dim):
    return {(i,j) for i in range(dim) for j in range(dim)}

def remaining_moves(board,leaf_node):
    if leaf_node != []:
        played_moves = {el.name[0] for el in list(leaf_node.iter_path_reverse()) if not el.is_root}
        return board-played_moves
    else:
        return board

def check_consecutive_subsets(arr):
    arr = sorted(arr)
    consec = []
    count=1
    if len(arr) > 1:
        for i in range(len(arr)-1):
            if arr[i]+1 == arr[i+1]:
                count+=1
            else:
                consec.append(count)
                count=1
            if i == len(arr)-2:
                consec.append(count)
        return consec
    elif len(arr) == 1:
        return [1]

def check_consecutive_subsets_2d(arr):
    arr = sorted(arr)
    consec = []
    count=1
    if len(arr) > 1:
        for i in range(len(arr)-1):
            # upwards diagonal
            if arr[i][0]+1 == arr[i+1][0] and arr[i][1]+1 == arr[i+1][1]:
                count+=1
            else:
                consec.append(count)
                count=1
            if i == len(arr)-2:
                consec.append(count)
        count = 1
        for i in range(len(arr)-1):
            # downwards diagonal
            if arr[i][0]+1 == arr[i+1][0] and arr[i][1]-1 == arr[i+1][1]:
                count+=1
            else:
                consec.append(count)
                count=1
            if i == len(arr)-2:
                consec.append(count)
        return consec
    elif len(arr) == 1:
        return [1]

def terminal_check(leaf_node,next_move,player,threshold):
    if leaf_node != ():
        played_moves = [(el.name[0],el.name[1]) for el in list(leaf_node.iter_path_reverse()) if not el.is_root]
        to_check = [el[0] for el in played_moves if el[1] == player]
        to_check.append(next_move)
        # get row and column moves
        rows = {el[0] for el in to_check}
        cols = {el[1] for el in to_check}
        # check for row win
        for row in rows:
            consec = check_consecutive_subsets([el[1] for el in to_check if el[0] == row])
            if any(el >= threshold for el in consec):
                return player
        # check for column win
        for col in cols:
            consec = check_consecutive_subsets([el[0] for el in to_check if el[1] == col])
            if any(el >= threshold for el in consec):
                return player
        # check for diagonal win
        consec = check_consecutive_subsets_2d(to_check)
        if any(el >= threshold for el in consec):
           return player
        else:
            return None
    else:
        return None

def run_game(tree,board,maximum_steps,threshold):
    run = True
    step = 1
    while run:
        # define current player
        player = 2*(step%2)-1
        run = False
        # starting iteration to fill branches
        print("Depth: %s/%s" % (step,maximum_steps))
        for leaf in tqdm(tree.leaves):
            if leaf.name[3] == None or leaf.is_root:
                valid_moves = remaining_moves(board,leaf)
                if len(valid_moves) >= 2:
                    run = True
                for el in valid_moves:
                    result = terminal_check(leaf,el,player,threshold)
                    if result == None and not run:
                        ide = [el,player,step,0]
                    else:
                        ide = [el,player,step,result]
                    Node(ide,parent=leaf)
        step += 1
    return tree

def build_tree(dim,threshold,game="tic-tac-toe"):
    if game == "tic-tac-toe":
        board = square_possibilities(dim)
        tree = Node(game)
        maximum_steps = dim**2
        tree= run_game(tree,board,maximum_steps,threshold)
    return tree

def build_minimax(tree):
    # work recursively backwards to fill up slots
    for node in tqdm(list(reversed(list(LevelOrderIter(tree,maxlevel=tree.height))))):
        scores = [child.name[3] for child in node.children if child != ()]
        if node.name[3] == None:
            if node.name[1] == 1:
                node.name[3] = min(scores)
            elif node.name[1] == -1:
                node.name[3] = max(scores)
    return tree

####################################
# plotting trees in various ways
####################################

# main command call
# tree = build_tree(dim=2,threshold=2)
# tree = build_minimax(tree)

# DotExporter(tree).to_picture("test1.png")
# DotExporter(tree,nodenamefunc=lambda n: 'label="%s"' % (str((n.name[0],n.name[1]))) if not (n.is_root) else n.name,nodeattrfunc=lambda n: 'label="%s"' % (str((n.name[0],n.name[1]))) if not (n.is_root) else None).to_picture("test2.png")
# UniqueDotExporter(tree, nodeattrfunc=lambda n: 'label="%s"' % (str(n.name))).to_picture("test3.png")

####################################
# comments/to-do's
####################################

# add minimax tag to root node
# check single branch of tree for consistency
# add script to convert into state-wise tree for easier visualization of some branches

# publish separate repository for minimax/monte-carlo game approach using python and later pipe into asp framework, resume visualization techniques later on and see how monte carlo approach can work, try abstracting to nim

# important:
# TODO: build minimax from exhaustive tree, assume max player starts first, issue with max-min function implementation
# TODO: mapping from current view to picturized view for better visuals, given certain branch
# TODO: build parallelizable scripts and check for speed-ups and limitations

# next-steps:
# TODO: clean up repo for pushing upstream with documentation
# TODO: abstract game structure to generic style which can be used for nim
# TODO: possibly add further symmetries to reduce search space further, perhaps a symmetry function
# TODO: redefine second graph as winning graph, make it pretty
# TODO: save graphs as images, dotfiles and pickles to binary which can be used later

# goals:
# build efficient mini-max algorithm and integrate alpha-beta pruning
# integrate monte-carlo tree search to auto-generate good and bad examples for ilasp
# show that monte-carlo approach can approximate minimax tree
# find out how to integrate this approach with asp/ilasp
