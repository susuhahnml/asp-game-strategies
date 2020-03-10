import os
import time
from structures.players import Player
from structures.tree import Tree
from structures.treeMCTS import TreeMCTS
from py_utils.logger import log
from structures.players import Player
from random import randint
from structures.action import Action
from structures.step import Step
from approaches.ml_agent.train_utils import training_data_to_csv

class MCTSPlayer(Player):
    """
    Creates the full mcts tree

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = "Generates a mcts tree"

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

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
                    path to the file required information for player."
        Returns: 
            String for the description
        """
        return "mcts"

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
        return name_style[:4]=="mcts"


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
        approach_parser.add_argument("--train-file",type=str, default=None,
            help="Name of the file to save the training data with mcts probabilites, must have .cvs extention")
        approach_parser.add_argument("--iter", type= int, default=100,
            help="Number of iteration to transverse the tree")
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
        if not 'first_build' in args:
            log.debug("Creating new files")
            new_files = 'w'
            args.first_build = False
        else:
            log.debug("Appending to existent files")
            new_files = 'a'

        log.debug("Computing mcts for tree")
        state = game_def.get_initial_state()
        root = TreeMCTS.node_class(Step(state,None,0),args.main_player)
        tree = TreeMCTS(root,game_def,args.main_player)
        tree.run_mcts(args.iter)
        t0 = time.time()
        if(not args.tree_image_file_name is None):
            file_name = '{}/{}'.format(game_def.name,args.tree_image_file_name)
            tree.print_in_file(file_name=file_name)
            log.debug("Tree image saved in {}".format(file_name))
        n_nodes = tree.get_number_of_nodes()
        if(not args.tree_name is None):
            file_path = "./approaches/mcts/trees/{}/{}".format(game_def.name,args.tree_name)
            tree.save_values_in_file(file_path)
            log.debug("Tree saved in {}".format(file_path))
        if(not args.train_file is None):
            file_path = "./approaches/mcts/train/{}/{}".format(game_def.name,args.train_file)
            l = tree.get_train_list()
            os.makedirs(os.path.dirname(file_path), exist_ok=True)
            training_data_to_csv(file_path,l,game_def,new_files,extra_array=['p','n'])
            log.debug("Training data saved in {}".format(file_path))

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
        step = Step(state,None,0)

        tree = TreeMCTS(TreeMCTS.node_class(step,self.main_player),self.game_def,self.main_player)
        try:
            tree.run_mcts(10000)
        except TimeoutError:
            log.debug("Reached timeout error for mcts, computation will stop")

        
        action = tree.get_best_action(tree.root)
        action_ex = [l_a for l_a in state.legal_actions
                if l_a == action][0]
        return action_ex

