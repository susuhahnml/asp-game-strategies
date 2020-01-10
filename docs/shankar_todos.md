Workflow to-do\'s
-----------------

### Presentation

1.  **TODO** make html table-like grids for more symmetric
    game visualizations

2.  **TODO** add specific minimax and tree creation functions
    into base readme

3.  **TODO** add dedicated modular html conversion functions
    while keeping old ascii functions intact

4.  save graphs as images, dotfiles and pickles to binary which can be
    used later

### Monte-carlo tree search

1.  **TODO** investigate theory and implement in code to
    approximate minimax tree given certain time threshold

2.  show that minimax and monte-carlo trees converge in practice,
    perhaps for smaller trees

### Minimax algorithm

1.  **TODO** add pydocstrings to all tree bits

2.  **TODO** review pull request which might require editing
    of full~time~.lp encodings

3.  check if possible to use reverse level iterator without list
    conversion

### Optimizations

1.  **TODO** optimize mini-max algorithm with fewer tree
    visits where possible, might need to look into exact source code
    within step/state

2.  add parallelization to all scripts, linear time reduction

### Extra: game encodings

1.  possible to terminate nim even one step earlier with next has

2.  add asp encodings for tic-tac-toe, add ability to read more diverse
    encodings

### Long-term goals

1.  build efficient mini-max algorithm and integrate alpha-beta pruning

2.  integrate monte-carlo tree search to auto-generate good and bad
    examples for ilasp

3.  show that monte-carlo approach can approximate minimax tree

4.  integrate this approach with asp/ilasp to provide bravely ordered
    samples for complex games
