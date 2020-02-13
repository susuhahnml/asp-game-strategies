from structures.players import Player
from py_utils.clingo_utils import fluents_to_asp_syntax, rules_file_to_gdl
from approaches.min_max_asp.min_max_asp import get_minmax_init
from py_utils.logger import log
import os
from approaches.ml_agent.train_utils import training_data_to_csv, remove_duplicates_training
class MinmaxASPPlayer(Player):
    """
    Player that choses an action using the minmax of asp

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """
    description = "Calculates the min max tree pruned by the clingo optimizations to improve complexity."
    
    def __init__(self, game_def, name_style, main_player):
        name = "Min max asp pruned player"
        super().__init__(game_def, name, main_player)
        apply_rules_rule="{does(P,A,T):best_do(P,A,T)}=1:-time(T),not holds(goal(_,_),T),{best_do(P,A,T)}>0,true(control(P)).\n"
        rules_file = "./approaches/min_max_asp/learned_rules/{}/{}".format(game_def.name,name_style[12:])
        with open(rules_file, "r") as text_file:
            rules = text_file.readlines()
            rules.append(apply_rules_rule)
            self.learned = "\n".join(rules)

    @staticmethod
    def match_name_style(name):
        return name[:11]=="min_max_asp"

    @staticmethod
    def add_parser_build_args(approach_parser):
        approach_parser.add_argument("--tree-image-file-name", type=str, default=None,
            help="Name of the file save an image of the computed tree")
        approach_parser.add_argument("--main-player", type= str, default="a",
            help="The player for which to maximize; either a or b")
        approach_parser.add_argument("--ilasp-examples-file-name", type=str, default=None,
            help="File name on which to save the order ilasp examples generated during the computation of the asp pruned min max tree. The file will be saved in the directory approaches/ilasp/game_name/examples")
        approach_parser.add_argument("--rules-file-name", type=str, default=None,
            help="File name to save rules learned during the computation of the asp pruned min max tree. Passing this argument implies the use of such rules during the computation to find similarities. IMPORTANT: The game definition used must have the subst_var attribute and the encoding of the game definition must be total regarding fluents (No information is encoded in unprovable fluents)")
        approach_parser.add_argument("--train-file-name", type=str, default=None,
            help="File name to save training information computed during the calculations. The information is encoded in hot-one encoding according to the ml-agent approach. The file is saved in approaches/ml-agent/training")

    
    @classmethod
    def get_name_style_description(cls):
        return "min_max_asp-<rules-file>: where rules-file is the name of the file saved in the folder rules during build"


    @staticmethod
    def build(game_def, args):
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
            rules_file = './approaches/min_max_asp/learned_rules/{}/{}'.format(args.game_name,args.rules_file_name)
            os.makedirs(os.path.dirname(rules_file), exist_ok=True)
            with open(rules_file, new_files) as text_file:
                text_file.write("\n".join(learned_rules))
            rules_file_to_gdl(rules_file)
            log.debug("Rules saved in " + rules_file)

        if generate_train:
            train_file = './approaches/ml_agent/train/{}/{}'.format(args.game_name,args.train_file)
            os.makedirs(os.path.dirname(train_file), exist_ok=True)
            training_data_to_csv(train_file,training_list,args.game_def,new_files)
            log.debug("Training data saved in " + train_file)
            remove_duplicates_training(train_file)
                
        if(not (args.tree_image_file_name is None)):
            image_file_name = '{}/{}'.format(args.game_name,args.tree_image_file_name)
            min_max_tree.print_in_file(file_name=image_file_name,main_player=args.main_player)


    def choose_action(self,state):
        initial = fluents_to_asp_syntax(state.fluents,0)
        match, tree, ex, ls, tl = get_minmax_init(self.game_def,self.main_player,initial,extra_fixed=self.learned)
        action_name = str(match.steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if str(l_a.action) == action_name][0]
        return action