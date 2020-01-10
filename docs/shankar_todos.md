Workflow to-do\'s
-----------------

### Presentation

1.  **TODO** add specific minimax and tree creation functions
    into base readme

2.  **TODO** save graphs as images, dotfiles and pickles to
    binary which can be used later

3.  **TODO** update pull request documentation with changes
    till now

4.  add consistent pydocstrings to all parts of code

### Monte-carlo tree search

1.  **TODO** investigate theory and implement in code to
    approximate minimax tree given certain time threshold

2.  show that minimax and monte-carlo trees converge in practice,
    perhaps for smaller trees

### Minimax algorithm

1.  **TODO** review pull request which might require editing
    of full~time~.lp encodings

2.  check if possible to use reverse level iterator without list
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
