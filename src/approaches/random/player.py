from structures.players import Player
from random import randint


class RandomPlayer(Player):
    """
    A random player

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = "A player that decides actions randomly"

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
        super().__init__(game_def, "Random player", main_player)
        #Must implement adding specific attributes of the class

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
        Returns: 
            String for the description
        """
        #Must implement
        return "random"

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
        return name_style=="random"


    @staticmethod
    def add_parser_build_args(approach_parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
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
        pass

    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        index = randint(0,len(state.legal_actions)-1)
        return state.legal_actions[index]