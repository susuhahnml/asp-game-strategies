## Game play strategies powered by ASP :clubs: :game_die:

### Overview

With this framework, we want to encourage the use and research of Answer Ser Programming(ASP) in two-player games. Our implementation allows simple expansions for new games following the Game Description Language formalisms as well as new approaches for learning strategies. These expansions will automatically generate command-line tools to build strategies, create agents and compute benchmarks. We also make available the tree visualizations by simply defining an ASCII representation of the states for the new game. In the README we include a detailed explanation of how to extend it with new games and approaches. 


#### Game description

The description of the games is represented in ASP and it is called from python using Clingo API to compute the legal actions and successor states.
 
To represent the game encoding we use [Game Description Language (GDL)](https://en.wikipedia.org/wiki/Game_Description_Language), allowing the formalization of any finite game with complete information. This framework only works with two-player games with complete information where turns alternate after every move.

Some of the already available games are [Nim](https://en.wikipedia.org/wiki/Nim) and TicTacToe. 

### Learning approaches

We consider as a learning approach, a process that is capable of creating a strategy given a game description and use such strategy latter on to choose actions during game play. A strategy might involve an additional ASP file, a pre-computed tree search, a machine learning model among many other.

All approaches can be found inside the [approaches](src/approaches) directory. Every folder in this directory will automatically generate command-line arguments to run the building of the strategy and to play such approach against other, generating usefully benchmarks.

The instructions to create a new strategic approach can be found [here](src/approaches/README.md). Please refer to the README.md file in each approach for any specific information.


### Methodologies

Information on our source code and workflow can be found in the [src](/src) directory.

### Development

A comprehensive changelog can be found [here](/docs/changelog.md). You can fork this repo and extend it with your own approach and game definitions.

### Citations

Gebser, Kaminski, Kaufmann and Schaub, 2019 (Clingo)

```
@article{gebser2019multi,
  title={Multi-shot ASP solving with clingo},
  author={Gebser, Martin and Kaminski, Roland and Kaufmann, Benjamin and Schaub, Torsten},
  journal={Theory and Practice of Logic Programming},
  volume={19},
  number={1},
  pages={27--82},
  year={2019},
  publisher={Cambridge University Press}
}
```
Law, Russo and Broda, 2015 (ILASP)

```
@misc{ILASP_system,
  author="Law, Mark and Russo, Alessandra and Broda, Krysia",
  title="The {ILASP} system for learning Answer Set Programs",
  year="2015",
  howpublished={\url{www.ilasp.com}}
}
```

### Authors

Susana Hahn, Atreya Shankar

Cognitive Systems, University of Potsdam, WiSe 2019/20
