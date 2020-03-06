import time
import subprocess
from structures.players import Player
from approaches.pruned_minmax.player import PrunedMinmaxPlayer
from py_utils.logger import log
import os
class ILASPPlayer(Player):
    """
    A player using an ILASP strategy

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = "A player using a strategy learned by ILASP"

    def __init__(self, game_def, name_style, main_player):
        """
        Constructs a player using saved information, the information must be saved 
        when the build method is called. This information should be able to be accessed
        using parts of the name_style to refer to saved files or other conditions

        Args:
            game_def (GameDef): The game definition used for the creation
            main_player (str): The name of the player either a or b
            name_style (str): The name style used to create the built player. This name will be passed
                        from the command line. 
        """
        strategy = "./approaches/ilasp/{}/strategies/{}".format(game_def.name,name_style[6:])
        name = "ILASP using strategy file: {}".format(strategy)
        super().__init__(game_def, name, main_player,strategy=strategy)

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
        Returns: 
            String for the description
        """
        return "ilasp-<strategy-path> where strategy-path if the path for the strategy file inside rooted in directory ./approaches/ilasp/game_name/strategies" 

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
        return name_style[:6]=="ilasp-"


    @staticmethod
    def add_parser_build_args(approach_parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
        approach_parser.add_argument("--main-player", type= str, default="a",
            help="The player for which to maximize; either a or b")
        approach_parser.add_argument("--ilasp-examples-file-name", type=str, default=None,
            help="File name where the ilasp examples have already been generated during the computation of the asp pruned min max tree. ")
        approach_parser.add_argument("--language-bias-name", type=str, default="final.las",
            help="File name encoding the language bias for ILASP. The file must be in the directory approaches/ilasp/game_name/languages. Any ASP rules defined in this file will also be saved as part of the strategy")
        approach_parser.add_argument("--background-path", type=str, default=None, required=True,
            help="The full path for the background definition of the game rooted in src")
        approach_parser.add_argument("--strategy-name", type=str, default="strategy.lp",
            help="File name on which to save the strategy computed by ILASP. The file will be saved in the directory approaches/ilasp/game_name/strategies. Can be latter used as parte of name_style")
        approach_parser.add_argument("--ilasp-arg", type=str, action='append',
            help="An argument to pass to ilasp without --. Must of the form <id>=<value>, can appear multiple times")



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
        args.rules_file_name = None
        args.tree_image_file_name = None
        args.train_file_name = None
        args.tree_name = None
        if args.ilasp_examples_file_name is None:
            log.debug("Generating examples using min_max_asp algorithm")
            args.ilasp_examples_file_name = 'temp_examples.las'
            PrunedMinmaxPlayer.build(game_def, args)
        base_path = './approaches/ilasp/{}/'.format(game_def.name)
        lines = []
        with open(args.background_path,'r') as background_file:
            lines.extend(background_file.readlines())
        with open('{}languages/{}'.format(base_path,args.language_bias_name),'r') as language_bias_file:
            langauage_bias_lines = language_bias_file.readlines()
            lines.extend(langauage_bias_lines)
        with open('{}examples/{}'.format(base_path,args.ilasp_examples_file_name),'r') as examples_file:
            lines.extend(examples_file.readlines())
        with open('{}temporal.las'.format(base_path),'w') as complete_file:
            complete_file.write("".join(lines))
            complete_file.close()
        
        if not args.ilasp_arg is None:
            ilasp_args = ["--"+a for a in args.ilasp_arg]
        else:
            ilasp_args = []

        command = ["ILASP ","--clingo5 ","--version=2i",'{}temporal.las'.format(base_path ),"--multi-wc ","--simple","--max-rule-length=6","--max-wc-length=5","-ml=5","-q"]
        command.extend(ilasp_args)

        string_command = " ".join(command)
        log.info("Running ilasp command: \n{}".format(" ".join(command)))
        result = subprocess.check_output(string_command, shell=True).decode("utf-8") 
        log.debug("Found strategy: \n{}".format(result))
        t0 = time.time()
        
        strategy_file_path = '{}/strategies/{}'.format(base_path,args.strategy_name)
        os.makedirs(os.path.dirname(strategy_file_path), exist_ok=True)
        
        langauage_bias_predicates = [l for l in langauage_bias_lines if l[0]!="#"]
        result = result + "".join(langauage_bias_predicates)
        with open(strategy_file_path,'w') as startegy:
            startegy.write(result)
            startegy.close()
        log.debug("Strategy saved in {}/strategies/{}".format(base_path,args.strategy_name))

        t1 = time.time()
        save_time = round((t1-t0)*1000,3)
        return {
            'save_time':save_time}


    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        return state.legal_actions[-1]
