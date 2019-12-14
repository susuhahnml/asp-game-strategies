Workflow to-do\'s
-----------------

### Urgent

1.  make nicer visualizations with more symmetric faces

2.  add better documentation to show functionalities

3.  add ilasp processing pipeline to init.sh, check if possible to
    publish ilasp exec

4.  add pipeline to download ilasp from github link

5.  reformat spacings in all code

### Minimax algorithm

1.  **TODO** extend game to nim

2.  **TODO** check single branch of tree for consistency

3.  check if possible to use reverse level iterator without list
    conversion

### Monte-carlo tree search

1.  investigate theory and implement in code to approximate minimax tree

2.  show that minimax and monte-carlo trees converge in practice

### Optimizations

1.  add parallelization to all scripts, linear time reduction

2.  add further symmetries to reduce search space; extra overhead to
    search for level-symmetries

3.  time gained in linear symmetry searched, time saved in greater than
    linear reduced number of leaves due to branching factor

### Presentation

1.  **TODO** once done, make modular and separate classes for
    compacter representation

2.  **TODO** add script to convert into state-wise tree with
    pretty ansi for easier visualization of some branches

3.  **TODO** possibly merge visualization into single tree
    pipeline for less overhead, reduce overall tree visits

4.  publish separate repository for minimax/monte-carlo game approach
    using python and later pipe into asp framework, resume visualization
    techniques later on and see how monte carlo approach can work, try
    abstracting to nim

5.  save graphs as images, dotfiles and pickles to binary which can be
    used later

### Long-term goals

1.  build efficient mini-max algorithm and integrate alpha-beta pruning

2.  integrate monte-carlo tree search to auto-generate good and bad
    examples for ilasp

3.  show that monte-carlo approach can approximate minimax tree

4.  integrate this approach with asp/ilasp to provide bravely ordered
    samples for complex games
