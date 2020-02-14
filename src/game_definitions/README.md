# How to create your own game definition

* You must add a directory to the game_definions directory.
  The directory name will be your `game_name`

* After you have added the directory with the requested files, your game definition will be available
  to be run from the console. Using `game_name='game_name'`

* Your folder should have at least the following files:
  ```sh
  game_definitions/
    game_name/
        __init__.py
        player.py
  ```
* `game_name/__init__.py` should be empty
                - background.lp: Clingo file with all rules
                from the game in GDL [format](https://en.wikipedia.org/wiki/Game_Description_Language)
                - default_initial.lp: Clingo file with all facts
                for the idefault initial state
                - all_initial.lp: Clingo file generating one stable model
                for each possible initial state
                - game_def.py: The game definition extending this class


* `game_name/background.lp` Clingo file with all rules from the game in GDL [format](https://en.wikipedia.org/wiki/Game_Description_Language)

* `game_name/default_initial.lp` Clingo file with all facts for the default initial state

* `game_name/game_def.py` should have:

  ```python
    from structures.game_def import GameDef
    class GameNameDef(GameDef):

        def __init__(self,name,initial=None,constants={}):
            """
            Constructs a definition for your game
            Args:
                name: Will be passed as your game_name
                initial: Initial state, will be passed directly 
                    to the super class
                constants: The constants to overwrite
                    you can save your definition constants for
                    faster access using: 
                    self.const_name = int(self.get_constant("const_name"))
                    after the super class creation is done
            """
            super().__init__(name,initial,constants)
            #Save your own attrinutes

        def state_to_ascii(self, state):
            """
            Transforms a state into ascii representation for better visualization

            Args:
                state (State): A state of type State

            Returns:
                String with ascii representation
            """
            #Must implement

        def step_to_ascii(self, step):
            """
            Transforms a step into ascii representation.
            This representation must include the effects of the step's action 
            one the step's state. The action of this step can not be assumed
            of being of type StateExpanded.

            Args:
                step (Step): A step of type Step

            Returns:
                String with ascii representation
            """
            #Must implement


  ```

    Notes:
    - Relative imports are not allowed.
    - The class extending GameDef must be the last definition of the file
