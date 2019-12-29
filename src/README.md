## Learning game strategies in ASP :clubs: :game_die:

Here we document our source code and its various functionalities. Most functions use a combination of ASP (clingo), ILASP and python.

### Table of contents

1. [Dependencies](#1-Dependencies) 
2. [Code structure](#2-Code-structure)
3. [Tests](#3-Tests)
4. [Simulate match](#4-Simulate-match)

### 1. Dependencies

#### i. Pythonic dependencies 

To install python-based dependencies, one can use the file `requirements.txt`. Simply execute the following (possibly within a virtual environment):

```shell
$ pip install -r requirements.txt
```

Additionally, for conducting sanity tests, we recommend installing `pytest`:

```shell
$ pip install pytest
```

#### ii. External dependencies

The next steps involve setting up this repository for testing. To proceed, execute the following prompt-based script:

```shell
$ ./init.sh
```

a. The first prompt will initialize a pre-commit hook, which will automatically update `requirements.txt` on every `git commit`.

b. The next prompt will download and decompress an appropriate upstream binary for `clingo-5.4.0`, based on your OS. Alternatively, you could skip this step and install `clingo` via your OS's package manager, if it is available upstream.

c. The next prompt will download and decompress an appropriate upstream binary for `ILASP-3.4.0`, based on your OS.

**Note:** It is necessary to manually copy both decompressed binaries into a directory located on your `PATH` variable. Additionally, both binaries must be located in a directory owned by a user with the same access permissions, since `ILASP` will call `clingo` in our scripts. This action can be omitted for the `clingo` binary if you installed it via your package manager, but it would still need to be done for the `ILASP` binary.

**Note:** If you are using the downloaded `clingo` binary in step "b" above, you would need to install python support for `clingo`. This step can be skipped if you installed `clingo` via your package manager.

To install python support for `clingo`, you can run the following command using `conda`:

```shell
$ conda install -c potassco clingo 
```

### 2. Code structure

Here we provide a tabular summary of our main code structure.

#### i. `game_definitions`

| L1                   | L2                                          | L3                                                  | Description                                                                                                                                 |
| :---:                | :---:                                       | :---:                                               | :---                                                                                                                                        |
| **game_definitions** |                                             |                                                     | Contains files with the asp encodings of games                                                                                              |
| --->                 | [game_def.py](game_definitions/game_def.py) |                                                     | Definitions of games that include the paths for the game, any extra configuration and a transformation of the states to ascii for printing. |
| --->                 | **game_name**                               |                                                     | Generic name of game (eg. "nim"). It is passed as a path in many functions.                                                                 |
| --->                 | --->                                        | [background.lp](game_definitions/nim/background.lp) | Defines the basic rules using of the game for one `time_step`, using `next`                                                                 |
| --->                 | --->                                        | [initial.lp](game_definitions/nim/initial.lp)       | Defines the initial state of the game                                                                                                       |
| --->                 | --->                                        | [full_time.lp](game_definitions/nim/full_time.lp)   | Defines the basic rules using of the game for all the game, using `holds` in each possible `time_step`                                      |

#### ii. `players`

| L1          | L2                                                   | Description                                                                                   |
| :---:       | :---:                                                | :---                                                                                          |
| **players** |                                                      | Contains all the possible players representing the approaches for selecting actions in a game |
| --->        | [players.py](players/players.py)                     | Defines the behaviour of each player                                                          |
| --->        | [min_max_asp.py](players/min_max_asp.py)             | Functions to compute algorithm using asp                                                      |
| --->        | [min_max_python.py](players/min_max_python.py)       | Functions to compute algorithm in python                                                      |

#### iii. `py_utils`

| L1           | L2                                                  | Description                                |
| :---:        | :---:                                               | :---                                       |
| **py_utils** |                                                     | Folders with utils functions               |
| --->         | [clingo_utils.py](py_utils/clingo_utils.py)         | Clingo bindings to be used in python       |
| --->         | [colors.py](py_utils/colors.py)                     | Defining python colors for pretty-printing |
| --->         | [match_simulation.py](py_utils/match_simulation.py) | Match simulation functions                 |

#### iv. `structures`

| L1             | L2                                | Description                                                                                                                                                                          |
| :---:          | :---:                             | :---                                                                                                                                                                                 |
| **structures** |                                   | Contains the structures used to model the games                                                                                                                                      |
| --->           | [action.py](structures/action.py) | An action selected by a player. An extended class also includes the fluents of the next state once the action ins performed                                                          |
| --->           | [state.py](structures/state.py)   | The state of the game, including board state, hows turn it is, if the game finished and if such, the goals reached. An extended class also includes all valid actions from the state |
| --->           | [step.py](structures/step.py)     | The step on a match, includes the state and the action performed in such state                                                                                                       |
| --->           | [match.py](structures/match.py)   | A full match of a game, list of steps                                                                                                                                                |
| --->           | [tree.py](structures/tree.py)     | A full tree of a game created by steps, with all possible paths                                                                                                                      |
| --->           | [game.py](structures/game.py)     | The game representation used for RL agents                                                                                                                                           |

### 3. Tests

#### i. Test ILASP with `nim` example

In order to run ILASP for learning weak constraints in the game of `nim`, you can run the following command (with corresponding output):

```
$ ILASP --clingo5 --version=3 ./game_definitions/nim/ilasp.las --max-wc-length=6

:~ next(has(V0,2)), next(has(V1,2)), next(has(V2,0)), V0 != V1.[-1@2, 1, V0, V1, V2]
:~ next(has(V0,1)).[-1@1, 2, V0]
%% score = 5
Pre-processing  : 0.318s
Solve time      : 77.426s
Total           : 77.745s
```

#### ii. Run sanity tests

For generic tests, we use the `pytest` package, which has its documentation [here](https://docs.pytest.org/en/latest/getting-started.html#install-pytest).

To run all tests, use the following command:

```shell
$ pytest -v -s test.py
```

### 4. Simulate match

To simulate a match, one can run `main.py` with the following arguments:

```
$ python3 main.py --help

usage: main.py [-h] [--path str] [--depth int] [--pA-style str] [--pB-style str]
               [--debug]

optional arguments:
  -h, --help      show this help message and exit
  --path str      relative path of game description language for game (default:
                  ./game_definitions/nim)
  --depth int     depth to which game should be played (default: None)
  --pA-style str  playing style for player a; either 'random', 'strategy' or 'human'
                  (default: random)
  --pB-style str  playing style for player b; either 'random', 'strategy' or 'human'
                  (default: random)
  --debug         print debugging information from stack (default: False)
```

An example of simulating two random players with verbosity is shown below:

```shell
$ python3 main.py --debug
```

### 5. Developments

Further developments are summarized in our [changelog](/docs/changelog.md).
