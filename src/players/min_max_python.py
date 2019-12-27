#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from tqdm import tqdm
from anytree import Node, RenderTree
from anytree.exporter import UniqueDotExporter, DotExporter
from anytree.iterators.levelorderiter import LevelOrderIter

def square_possibilities(dim):
    return {(i,j) for i in range(dim) for j in range(dim)}

def remaining_moves(board,leaf_node):
    if leaf_node != []:
        played_moves = {el.name[0] for el in
                        list(leaf_node.iter_path_reverse()) if not el.is_root}
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
        played_moves = [(el.name[0],el.name[1]) for el in
                        list(leaf_node.iter_path_reverse()) if not el.is_root]
        to_check = [el[0] for el in played_moves if el[1] == player]
        to_check.append(next_move)
        # get row and column moves
        rows = {el[0] for el in to_check}
        cols = {el[1] for el in to_check}
        # check for row win
        for row in rows:
            consec = check_consecutive_subsets([el[1] for el in
                                                to_check if el[0] == row])
            if any(el >= threshold for el in consec):
                return player
        # check for column win
        for col in cols:
            consec = check_consecutive_subsets([el[0] for el in
                                                to_check if el[1] == col])
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
    for node in tqdm(list(reversed
                          (list(LevelOrderIter(tree,maxlevel=tree.height))))):
        scores = [child.name[3] for child in node.children if child != ()]
        if node.name[3] == None:
            if node.name[1] == 1:
                node.name[3] = min(scores)
            elif node.name[1] == -1:
                node.name[3] = max(scores)
    return tree
