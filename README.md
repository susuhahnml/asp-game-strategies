## Learning game strategies in ASP :clubs: :game_die:

### Overview

This project involves the creation of a framework to play two player games using Answer Set Programming for game description and dynamics.

#### Game description

The description of the games is represented in ASP and it is called from python to compute the best moves for a player using different approaches and strategies. 

To represent the game encoding we will use the [Game Description Language (GDL)](https://en.wikipedia.org/wiki/Game_Description_Language) used to formalize the rules of any finite game with complete information. This framework only works with two player games with complete information where turns alternate after every move.

As a main example we use the mathematical strategy game called [Nim](https://en.wikipedia.org/wiki/Nim). This game has a wining strategy which we attempt to learn using this framework.

### Learning strategies

The strategies are represented as Weak Constraints and are learned using the [ILASP](http://www.ilasp.com) system for Inductive Logic Programming with Answer Set Programing.


### Methodologies

Information on our source code and workflow can be found in the [src](/src) directory.

### Development

A comprehensive changelog can be found [here](/docs/changelog.md)

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
