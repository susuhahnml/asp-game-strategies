# Game strategies in ASP :clubs: :game_die:

This project involves the creation of a framework for learning strategies for games.
The strategies are represented as Weak Constraints and are learned using the [ILASP](http://www.ilasp.com) system for Inductive Logic Programming with Answer Set Programing.
The game play and search for examples is done using [*clingo*](https://potassco.org/clingo/). These two systems are connected using python to learn strategies via self-play.

The idea for this project is mainly based on the paper [Learning weak constraints](https://www.imperial.ac.uk/media/imperial-college/faculty-of-engineering/computing/public/1718-ug-projects/Elliot-Greenwood-Learning-Player-Strategies-using-Weak-Constraints.pdf) by Elliot Greenwood. We will explore some of his proposed future work while reimplementing the framework. Also inspired by some of the other work from Imperial College of London [symbolic-rl](https://github.com/921kiyo/symbolic-rl). 

## Game Example

As a main example we use the mathematical strategy game called [Nim](https://en.wikipedia.org/wiki/Nim).
This game has a wining strategy which we attempt to learn using this framework.

To represent the game encoding we will use the Game Description Language (GDL) used to formalize the rules of any finite game with complete information.

## Further Bibliography 

  - [Clingo Python API](https://potassco.org/clingo/python-api/current/#clingo.SymbolType)
  - [ILASP system](http://www.ilasp.com)
  - [ILASP framework with hard constraints Git Repo](https://github.com/921kiyo/symbolic-rl)
  - [Learning weak constraints](https://www.imperial.ac.uk/media/imperial-college/faculty-of-engineering/computing/public/1718-ug-projects/Elliot-Greenwood-Learning-Player-Strategies-using-Weak-Constraints.pdf)
  - [Game Description Language](http://www.cse.unsw.edu.au/~mit/Papers/IJCAI11.pdf)
  - [Towards symbolic deep learning](https://arxiv.org/abs/1609.05518)
  - [DeepMind paper on combining inductive logic with deep learning](https://deepmind.com/research/publications/learning-explanatory-rules-noisy-data)
  - [RL for the game of Nim](http://www.diva-portal.org/smash/get/diva2:814832/FULLTEXT01.pdf)
Proposed by Javier, Meta-Interpretative Learning:
  - [Machine Discovery of Comprehensible Strategies for Simple Games Using Meta-interpretive Learning](https://www.researchgate.net/publication/332654748_Machine_Discovery_of_Comprehensible_Strategies_for_Simple_Games_Using_Meta-interpretive_Learning)
  - [Can Meta-Interpretive Learning Outperform Deep Reinforcement Learning of. Evaluable Game Strategies](https://www.ijcai.org/proceedings/2019/0909.pdf)
