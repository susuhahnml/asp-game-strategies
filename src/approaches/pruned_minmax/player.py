from structures.players import Player
from py_utils.clingo_utils import fluents_to_asp_syntax, rules_file_to_gdl
from approaches.pruned_minmax.pruned_minmax import get_minmax_init
from py_utils.logger import log
import os
from approaches.ml_agent.train_utils import training_data_to_csv, remove_duplicates_training
from random import randint
from structures.tree import Tree
from structures.action import Action
class PrunedMinmaxPlayer(Player):
    """
    Player that choses an action using the minmax of asp

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """
    description = "Calculates the min max tree pruned by the clingo optimizations to improve complexity."
    
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
        style = name_style[14:18]
        file_name = name_style[19:]
        file_path = "./approaches/pruned_minmax/{}s/{}/{}".format(style,game_def.name,file_name)
        name = "Pruned min max player from {}:{}".format(style, file_name)
        super().__init__(game_def, name, main_player)
        self.style = style
        if style == "rule":
            apply_rules_rule="{does(P,A):best_do(P,A),legal(P,A)}=1:-not terminal,{best_do(P,A)}>0,true(control(P)).\n"
            with open(file_path, "r") as text_file:
                rules = text_file.readlines()
                rules = [apply_rules_rule,"\n"] + rules
                self.learned = rules
        elif style == "tree":
            f = Tree.get_scores_from_file(file_path)
            self.tree_scores = f["tree_scores"]
            self.scores_main_player = f["main_player"]
        else:
            raise RuntimeError("Invalid style for pruned minmax :{}".format(style))

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
                    path to the file required information for player."
        Returns: 
            String for the description
        """
        return "pruned_minmax-rule-<rule-file>: where rule-file is the name of the file saved in the folder rule during build cointaining rules. Or pruned_minmax-tree-<tree-file>: where tree-file is the name of the file saved in the folder tree representing the search tree"

    @staticmethod
    def match_name_style(name):
        """
        Verifies if a name_style matches the approach

        Args:
            name_style (str): The name style used to create the built player. This name will be passed
                        from the command line. Will then be used in the constructor. 
        Returns: 
            Boolean value indicating if the name_style is a match
        """
        return name[:14]=="pruned_minmax-"

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
            help="Name of the file save an image of the computed tree")
        approach_parser.add_argument("--tree-name", "--tree-name",type=str, default=None,
            help="Name of the file to save the computed tree, must have .json extention. Will be saved in ./approaches/pruned_minmax/tree")
        approach_parser.add_argument("--main-player", type= str, default="a",
            help="The player for which to maximize; either a or b")
        approach_parser.add_argument("--ilasp-examples-file-name","--ilasp", type=str, default=None,
            help="File name on which to save the order ilasp examples generated during the computation of the asp pruned min max tree. The file will be saved in the directory approaches/ilasp/game_name/examples. Extension .las")
        approach_parser.add_argument("--rules-file-name", "--rules", type=str, default=None,
            help="File name to save rules learned during the computation of the asp pruned min max tree. Passing this argument implies the use of such rules during the computation to find similarities. IMPORTANT: The game definition used must have the subst_var attribute and the encoding of the game definition must be total regarding fluents (No information is encoded in unprovable fluents) Extension .lp")
        approach_parser.add_argument("--train-file-name", type=str, default=None,
            help="File name to save training information computed during the calculations. The information is encoded in hot-one encoding according to the ml-agent approach. The file is saved in approaches/ml-agent/training. Extension .csv")



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
        learn_examples = not (args.ilasp_examples_file_name is None)
        learn_rules = not (args.rules_file_name is None)
        generate_train = not (args.train_file_name is None)
        
        log.debug("Computing asp minmax for tree")
        log.debug("Initial state: \n{}".format(game_def.get_initial_state().ascii))
        initial = game_def.get_initial_time()
        minmax_match, min_max_tree, examples, learned_rules, training_list = get_minmax_init(game_def,
                                                            args.main_player,
                                                            initial,
                                                            generating_training=generate_train,learning_rules=learn_rules, learning_examples=learn_examples)
        log.debug(minmax_match)
        
                                                            
        if learn_examples:
            ilasp_examples_file_name = './approaches/ilasp/{}/examples/{}'.format(args.game_name,args.ilasp_examples_file_name)
            os.makedirs(os.path.dirname(ilasp_examples_file_name), exist_ok=True)
            with open(ilasp_examples_file_name, new_files) as text_file:
                text_file.write("\n".join(examples))
                log.debug("ILASP Examples saved in " + ilasp_examples_file_name)
        
        if learn_rules:
            rules_file = './approaches/pruned_minmax/rules/{}/{}'.format(args.game_name,args.rules_file_name)
            os.makedirs(os.path.dirname(rules_file), exist_ok=True)
            with open(rules_file, new_files) as text_file:
                text_file.write("\n".join(learned_rules))
            rules_file_to_gdl(rules_file)
            log.debug("Rules saved in " + rules_file)

        if generate_train:
            train_file = './approaches/ml_agent/train/{}/{}'.format(args.game_name,args.train_file_name)
            os.makedirs(os.path.dirname(train_file), exist_ok=True)
            training_data_to_csv(train_file,training_list,game_def,new_files)
            log.debug("Training data saved in " + train_file)
            remove_duplicates_training(train_file)
                
        if(not (args.tree_image_file_name is None)):
            image_file_name = '{}/{}'.format(args.game_name,args.tree_image_file_name)
            min_max_tree.print_in_file(file_name=image_file_name,main_player=args.main_player)
        n_nodes = min_max_tree.get_number_of_nodes()
        if(not args.tree_name is None):
            file_path = "./approaches/pruned_minmax/trees/{}/{}".format(game_def.name,args.tree_name)
            min_max_tree.save_scores_in_file(file_path)
            log.debug("Tree saved in {}".format(file_path))

        return {
            'number_of_nodes':n_nodes}

    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        if self.style == "tree":
            # Using tree
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
        
        else:
            # Using rules
            initial = fluents_to_asp_syntax(state.fluents,0)
            match, tree, ex, ls, tl = get_minmax_init(self.game_def,self.main_player,initial,extra_fixed="\n".join(self.learned), learning_rules = True)
            self.learned.extend(ls)
            if(len(ls)>0):
                log.info("{} learned new rules during game play".format(self.name))
            if match is None:
                raise TimeoutError
            action = match.steps[0].action.action
        
        action_name = str(action)
        action = [l_a for l_a in state.legal_actions
                if str(l_a.action) == action_name][0]
        return action
