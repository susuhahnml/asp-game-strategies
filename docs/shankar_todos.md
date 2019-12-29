Workflow to-do\'s
-----------------

### Minimax algorithm

1.  **TODO** add minimax pipeline to tree class in simple
    python as this does not require asp references

2.  **TODO** add pull request with new asp encodings for more
    arbitrary examples, piles and exact solutions instead of symmetries

3.  check if possible to use reverse level iterator without list
    conversion

### Presentation

1.  **TODO** make nicer visualizations with more symmetric
    faces

2.  **TODO** possibly merge visualization into single tree
    pipeline for less overhead, reduce overall tree visits

3.  **TODO** change location of images to ./src/img directory

4.  save graphs as images, dotfiles and pickles to binary which can be
    used later

### Optimizations

1.  **TODO** optimize mini-max algorithm with fewer tree
    visits where possible, add slower approach for plotting trees

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
