## ILP-ASP game hypotheses

Here we document our source code and its various functionalities. Further documentation underway :snail:

## Structure


> **game_definitions**: *Contains folders with the asp files to define a game*

>> [game_def.py](game_definitions/game_def.py): Definitions of games that include the paths for the game, any extra configuration and a transformation of the states to ascii for printing.

>> **game_name**: *The name of the game, is passed as path in many functions. As many of this folders as games difined*
    
>>>[background.lp](game_definitions/nim/background.lp): *Defines the basic rules using of the game for one time_step, using next*
 
>>>[initial.lp](game_definitions/nim/initial.lp): *Defines the initial state of the game*

>>>[full_time.lp](game_definitions/nim/full_time.lp): *Defines the basic rules using of the game for all the game, using holds in each possible time_step*


>**players**: *Contains all the possible players representing the approaches for selecting actions in a game*

>> **min_max_asp**: *Approach using asp optimization statements to compute the minmax algorithm*

>>>[min_max_asp.py](players/min_max_asp/min_max_asp.py): *Functions to compute algorithm*

>> **minmax_python**: *Approach using the minmax algorithm in python*

>>>[minmax.py](players/minmax_python/minmax.py): *Functions to compute algorithm*

>> **ilas_strategy**: *Approach using ILASP to calculate and use a strategy*

>>[players.py](players/players.py): *Defines the behaivour of each player*

>**py_utils**: *Files with utils functions*

>**structures**: *Contains the structures used to model the games*

>>[action.py](structures/action.py): *An action selected by a player. An extended class also includes the fluents of the next state once the action ins performed*

>>[state.py](structures/state.py): *The state of the game, including board state, hows turn it is, if the game finished and if such, the goals reached. An extended class also includes all valid actions from the state*

>>[step.py](structures/step.py): *The step on a match, includes the state and the action performed in such state*

>>[match.py](structures/match.py): *A full match of a game, list of steps*

>>[tree.py](structures/tree.py): *A full tree of a game created by steps, with all possible paths*

>>[game.py](structures/game.py): *The game representation used for RL agents*



## Dependencies

1. Clingo (preferably one of the version 5's)
2. ILASP
   * Use the executables provided in the folder ILASP_exec and manually copy it onto one of your binary directories on your `$PATH`
    <!-- * Download latest binary from [here](https://sourceforge.net/projects/spikeimperial/files/ILASP/) and manually copy it onto one of your binary directories on your `$PATH` -->


## Test ILASP with small example

In order to check some basic results, you can run the snippet below and you should receive a similar output (timings may differ):

```shell
$ ILASP --clingo5 --version=3 ./src/players/ilasp_strategy/ilasp_examples/schedule.las

:~ assigned(V0, V1), type(V0, V1, c2).[1@2, 1, V0, V1]
:~ assigned(V0, V1), assigned(V2, V3), V2 != V0.[1@1, 2, V0, V1, V2, V3]
%% score = 5
Pre-processing  : 0.015s
Solve time      : 1.125s
Total           : 1.14s
```

## Learn weak constraints with ILASP

In order to run ILASP for learning weak constraints in the game of NIM run the following command

```shell
$ ILASP --clingo5 --version=3 ./src/game_definitions/nim/nim_ILASP.las --max-wc-length=6

:~ next(has(V0,2)), next(has(V1,2)), next(has(V2,0)), V0 != V1.[-1@2, 1, V0, V1, V2]
:~ next(has(V0,1)).[-1@1, 2, V0]
%% score = 5
Pre-processing  : 0.318s
Solve time      : 77.426s
Total           : 77.745s
```

This process will take over 1 minute.

When using a *conda* environment you might need to define the *clingo* path or deactivate the environment.

## Run main to simulate a match


Use the following command to simulate a match of nim using a strategy found by ILASP

```shell
$ python src/main.py
```

# Tests

For the test we use the pytest pakage, the documentation can be found [here](https://docs.pytest.org/en/latest/getting-started.html#install-pytest).

To run all tests use the following command

```shell
pytest . -v -s -p no:warnings
```

To run tests in one file run

```shell
pytest src/tests/test_file.py -v -s
```

This will run the tests in all the files in the tests folder.
All test files must have the format `test_*.py`