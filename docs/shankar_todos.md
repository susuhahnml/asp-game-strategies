Workflow to-do\'s
-----------------

### Minimax algorithm

1.  **TODO** add pull request with new asp encodings for more
    arbitrary examples, piles and exact solutions instead of symmetries,
    get Susana\'s opinion which might require editing of full~time~.lp
    encodings

2.  add pydocstrings to all tree bits

3.  check if possible to use reverse level iterator without list
    conversion

### Presentation

1.  **TODO** make nicer visualizations with more symmetric
    faces

2.  **TODO** add bold for terminal and root scores

3.  save graphs as images, dotfiles and pickles to binary which can be
    used later

### Optimizations

1.  **TODO** optimize mini-max algorithm with fewer tree
    visits where possible

2.  add further symmetries to reduce search space; extra overhead to
    search for level-symmetries

3.  add parallelization to all scripts, linear time reduction

4.  time gained in linear symmetry searched, time saved in greater than
    linear reduced number of leaves due to branching factor

### Monte-carlo tree search

1.  investigate theory and implement in code to approximate minimax tree

2.  show that minimax and monte-carlo trees converge in practice

### Long-term goals

1.  build efficient mini-max algorithm and integrate alpha-beta pruning

2.  integrate monte-carlo tree search to auto-generate good and bad
    examples for ilasp

3.  show that monte-carlo approach can approximate minimax tree

4.  integrate this approach with asp/ilasp to provide bravely ordered
    samples for complex games
