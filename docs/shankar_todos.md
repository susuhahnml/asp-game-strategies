Workflow to-do\'s
-----------------

Focus on fully building utilities on nim -\> start with symmetry
reduction and then monte carlo methods based on some time limit, perhaps
also parallelization of scripts, tic-tac-toe can come later as an
additional step where necessary tic-tac-toe can be additional but not
necessary step, remove description from all readmes

Focus on symmetry reduction, followed by monte carlo tree search

### Game encodings

1.  **TODO** add asp encodings for tic-tac-toe, add ability
    to read more diverse encodings

2.  **TODO** possible to terminate nim even one step earlier
    with next has

3.  might be necessary to terminate tic tac toe with next has

4.  shift all groups of m minus (minimum of set minus one)

5.  use sum of n consecutive naturals for proof checking

### Minimax algorithm

1.  **TODO** add pull request with new asp encodings for more
    arbitrary examples, piles and exact solutions instead of symmetries,
    get Susana\'s opinion which might require editing of full~time~.lp
    encodings

2.  **TODO** add pydocstrings to all tree bits

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

2.  **TODO** add further symmetries to reduce search space;
    extra overhead to search for level-symmetries -\> can add symmetry
    searches directly into asp

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
