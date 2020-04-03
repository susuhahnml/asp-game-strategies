# Learning weak constratins with ILASP

## Description

In this approach, we use the Inductive Learning of Answer Set Programs (ILASP) framework, which is an inductive logic programming framework developed largely by Mark Law from the Imperial College London. It uses the system *clingo* to generate answer sets explaining the examples. The framework can also generate *weak constraints* as hypotheses using *ordered examples* ILASP_system. This particular feature allows us to find a game strategy in the form of weak constraints given an ordered set of preferred moves in a given context. Such characteristics make it a great fit to learn strategies for games defined in ASP.

### Language Bias

The language bias for each game is saved in one inside each game's folder. This folder will also contain the generated strategies.

### Ordered examples

Ordered examples can be obtained from the Pruned Minimax algorithm when specified in the command line. 