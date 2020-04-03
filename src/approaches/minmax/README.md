# Minimax algorithm

## Description

In this approach we construct a full game tree and  use the minimax algorithm to compute the best action.

The minimax algorithm is a recursive tree-search algorithm which has its origins in combinatorial game theory for choosing the next best move of a two-person zero-sum game. The intuition behind this algorithm lays in the fact that every movement made by player *a* will aim to maximize the reward of *a*, while player *b* will try to minimize this same reward. This algorithm will first construct the complete game tree *T* of depth *D* for alternately-playing players *p* and *p'*. All the terminal nodes of the tree will be annotated with reward values *v* extracted from predicate ``goal/1}.`` Then, it will proceed to compute the minimax score *M* of any node on the tree starting on the leaves by utilizing the following piecewise function:
