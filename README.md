## Game strategies in ASP :clubs: :game_die:

### Overview

This project involves the creation of a framework for learning strategies for games.

The strategies are represented as Weak Constraints and are learned using the [ILASP](http://www.ilasp.com) system for Inductive Logic Programming with Answer Set Programing.

The game play and search for examples is done using [clingo](https://potassco.org/clingo/). These two systems are connected using python to learn strategies via self-play.

The idea for this project is mainly based on the paper ["Learning weak constraints"](https://www.imperial.ac.uk/media/imperial-college/faculty-of-engineering/computing/public/1718-ug-projects/Elliot-Greenwood-Learning-Player-Strategies-using-Weak-Constraints.pdf) by *Elliot Greenwood*, and further inspired by the [work](https://github.com/921kiyo/symbolic-rl) of *Kiyohito Kunii* in learning hard constraints via inductive logic programming . We will explore some of the proposed future work ideas proposed by these authors while reimplementing the the overall frameworks. 

### Methodologies

As a main example we use the mathematical strategy game called [Nim](https://en.wikipedia.org/wiki/Nim). This game has a wining strategy which we attempt to learn using this framework. Furthermore, we will attempt to cross-model the simple game of [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe), as an extension to our framework.

To represent the game encoding we will use the [Game Description Language (GDL)](https://en.wikipedia.org/wiki/Game_Description_Language) used to formalize the rules of any finite game with complete information.

Information on our source code and workflow can be found in the [src](/src) directory.

### Development

A comprehensive changelog can be found [here](/docs/todos.md)

### Citations

1. Gebser, Kaminski, Kaufmann and Schaub, 2019 (Clingo)

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

2. Law, Russo and Broda, 2015 (ILASP system)

```
@misc {ILASP_system,
  author = "Law, Mark and Russo, Alessandra and Broda, Krysia",
  title  = "The {ILASP} system for learning Answer Set Programs",
  year   = "2015",
  howpublished={\url{www.ilasp.com}}
}
```

### Authors

Susana Hahn, Atreya Shankar

Cognitive Systems, University of Potsdam, WiSe 2019/20
