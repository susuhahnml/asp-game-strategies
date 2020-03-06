import time
from structures.players import Player
from structures.tree import Tree
from structures.treeMinmax import TreeMinmax
from approaches.minmax.minmax import minmax_from_game_def
from py_utils.logger import log
from structures.players import Player
from random import randint
from structures.action import Action
class MinmaxPlayer(Player):
    """
    Creates the full minmax tree

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = "Generates the full minmax tree"

    def __init__(self, game_def, name_style, main_player):
        """
        Constructs a player using saved information, the information must be saved 
        when the build method is called. This information should be able to be accessed
        using parts of the name_style to refer to saved files or other conditions

        Args:
            game_def (GameDef): The game definition used for the creation
            main_player (str): The name of the player either a or b
            name_style (str): The name style used to create the built player. 
        """
        super().__init__(game_def, "Min max tree", main_player)
        file_path = "./approaches/minmax/trees/{}/{}".format(game_def.name,name_style[7:])
        # self.tree = Tree.load_from_file(file_path,game_def)
        f = TreeMinmax.get_scores_from_file(file_path)
        self.tree_scores = f["tree_scores"]
        self.scores_main_player = f["main_player"]

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
                    path to the file required information for player."
        Returns: 
            String for the description
        """
        return "minmax-<tree-file>: where tree-file is the name of the file saved in the folder trees during build"

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
        return name_style[:7]=="minmax-"


    @staticmethod
    def add_parser_build_args(approach_parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
        approach_parser.add_argument("--tree-image-file-name", "--tree-img",type=str, default=None,
            help="Name of the file to save an image of the computed tree")
        approach_parser.add_argument("--tree-name", "--tree-name",type=str, default=None,
            help="Name of the file to save the computed tree, must have .json extention")
        approach_parser.add_argument("--main-player", type= str, default="a",
            help="The player for which to maximize; either a or b")


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
        log.debug("Computing normal minmax for tree")
        tree = minmax_from_game_def(game_def,main_player=args.main_player)
        t0 = time.time()
        if(not args.tree_image_file_name is None):
            file_name = '{}/{}'.format(game_def.name,args.tree_image_file_name)
            tree.print_in_file(file_name=file_name)
            log.debug("Tree image saved in {}".format(file_name))
        n_nodes = tree.get_number_of_nodes()
        if(not args.tree_name is None):
            file_path = "./approaches/minmax/trees/{}/{}".format(game_def.name,args.tree_name)
            tree.save_scores_in_file(file_path)
            log.debug("Tree saved in {}".format(file_path))
        t1 = time.time()
        save_time = round((t1-t0)*1000,3)
        return {
            'number_of_nodes':n_nodes,
            'save_time':save_time}

    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        state_facts = state.to_facts()
        
        
        if state_facts in self.tree_scores:
            opt = self.tree_scores[state_facts].items()
            if self.scores_main_player == self.main_player:
                best = max(opt, key = lambda i : i[1])
            else:
                best = min(opt, key = lambda i : i[1])
            action = Action.from_facts(best[0],self.game_def)
        else:
            log.debug("Minmax has no information in tree for current step, choosing random")
            index = randint(0,len(state.legal_actions)-1)
            return state.legal_actions[index]

        action = [l_a for l_a in state.legal_actions
                if l_a == action][0]
        return action

