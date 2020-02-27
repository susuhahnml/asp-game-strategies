# How to create your own approach

* You must add a directory to the approaches directory.
  The directory name will be your `approach_name`

* After you have added the directory with the requested files, your approach will be available
  to be run from the console, for building and match simulations. This allows benchamarking
  against other approaches.

* Your folder should have at least the following files:
  ```sh
  approaches/
    approach_name/
        __init__.py
        player.py
  ```
* `approach_name/__init__.py` should be empty

* `approach_name/player.py` should have:

  ```python
  from structures.players import Player

  class ApproachNamePlayer(Player):
    """
    Description of your player

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """
    
    description = "Must be filled with a description of the approach to show on the console"
    
    def __init__(self, game_def, name_style, main_player):
        """
        Constructs a player using saved information, the information must be saved 
        when the build method is called. This information should be able to be accessed
        using parts of the name_style to refer to saved files or other conditions

        Args:
            game_def (GameDef): The game definition used for the creation
            main_player (str): The name of the player either a or b
            name_style (str): The name style used to create the built player. This name will be passed
                        from the command line. EXAMPLE approach_name<file-name>, in this case 
                        the initialization could use the name file to load player.
        """
        super().__init__(game_def, name, main_player)
        #Must implement adding specific attributes of the class

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
        EXAMPLE: "approach_name<file-name> where file-name is the relative 
                 path to the file required information for player."
        Returns: 
            String for the description
        """
        #Must implement
        return ""

    @staticmethod
    def match_name_style(name_style):
        """
        Verifies if a name_style matches the approach

        Args:
            name_style (str): The name style used to create the built player. This name will be passed
                        from the command line. Will then be used in the constructor. 
        Returns: 
            Boolean value indicating if the name_style is a match
        """
        #Must implement
        return False


    @staticmethod
    def add_parser_build_args(approach_parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        Use approach_parser.add_argument(...) as explained in https://docs.python.org/2/library/argparse.html
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
        #Add the required console arguments with approach_parser.add_argument(...)
        pass
    

    @staticmethod
    def build(game_def, args):
        """
        Runs the required computation to build a player. For instance, creating a tree or 
        training a model. 
        The computed information should be stored to be accessed latter on using the name_style
        Args:
            game_def (GameDef): The game definition used for the creation
            args (NameSpace): A name space with all the attributes defined in add_parser_build_args
        """
        #Must implement
        pass

    def choose_action(self,state):
        """
        The player chooses an action given a current state. 
        A TimeOutError might be raised during this execution to indicate that the time
        for choosing an action is finished. In this case a random action will be selected.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        #Must implement
        return None
  ```

    Notes:
    - Relative imports are not allowed.
    - The class extending player must be the last definition of the file
