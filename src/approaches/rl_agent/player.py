from structures.players import Player
from py_utils.logger import log
from py_utils.colors import bcolors, paint
from approaches.rl_agent.rl_instance import RLInstance
from structures.players import Player

def main_train(architecture,agent,policy,epsilon,rewardf,opponent_name,n_steps,model_name,game_name,strategy_path=None): 
    log.info("""
Training Summary:
    architecture: {}
    agent: {}
    policy: {}
    epsilon: {}
    rewardf: {}
    oponent: {}
    n_steps: {}
    model_name: {}
    game_name: {}
    """.format(architecture,agent.__class__.__name__,policy.__class__.__name__,epsilon,rewardf,opponent_name,n_steps,model_name,game_name))
    model = RLInstance(architecture, agent, policy, epsilon, rewardf, opponent_name, n_steps, model_name, game_name, strategy_path)
    model.train(num_steps=n_steps)

class RLPlayer(Player):
    """
    Description of your player

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """

    description = "A player trained using reiforcement learning"

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
        name = "Reiforcement Learning player loaded from {}".format(name_style)
        super().__init__(game_def, name, main_player)
        model = RLInstance.from_file(name_style[3:])
        self.model = model
        self.model_name = name_style

    @classmethod
    def get_name_style_description(cls):
        """
        Gets a description of the required format of the name_style.
        This description will be shown on the console.
        Returns: 
            String for the description
        """
        return "rl-<file-name> where file-name indicates the name of the saved model inside rl_agent/saved_models"

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
        return name_style[:2]=="rl"


    @staticmethod
    def add_parser_build_args(approach_parser):
        """
        Adds all required arguments to the approach parser. This arguments will then 
        be present on when the build method is called.
        
        Args:
            approach_parser (argparser): An argparser used from the command line for
                this specific approach. 
        """
        approach_parser.add_argument("--architecture", type=str, default="dense",
                            help="underlying neural network architecture;" +
                            " Available: 'dense', 'dense-deep', 'dense-wide', 'resnet-50'")
        approach_parser.add_argument("--agent", type=str, default="dqn",
                            help="agent used by rl network" +
                            " Available: 'dqn'") # TODO: add more agents
        approach_parser.add_argument("--policy", type=str, default="custom_eps_greedy",
                            help="policy used for action selection;" +
                            " Available: 'custom_eps_greedy', 'eps_greedy'")
        approach_parser.add_argument("--epsilon", type=float, default=0.1,
                            help="exploration factor epsilon")
        approach_parser.add_argument("--rewardf", type=str, default="dom",
                            help="reward function used by network;" +
                            " Available: 'dom', 'clipped'")
        approach_parser.add_argument("--opponent", type=str, default="strategy-approaches/rl_agent/none.lp",
                            help="model underlying opponent behaviour"+
                            " Available: 'random', 'strategy-[name]', 'ml'")
        approach_parser.add_argument("--n-steps", type=int, default=50000,
                            help="total number of steps to take in environment")
        approach_parser.add_argument("--model-path", type=str, default=None,
                            help="path to saved weights for model to be used")
        approach_parser.add_argument("--model-name", type=str, default="unnamed",
                            help="name of the model, used for saving and logging")
        approach_parser.add_argument("--grid-search", type=bool, default=False,
                            help="true for performing a grid search")
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
        log.set_level(args.log)

        if(args.grid_search):
            architecture = ['dense', 'dense-deep', 'dense-wide'] 
            epsilons = [0.1, 0.3, 0.5]
            for a in architecture:
                    for e in epsilons:
                        name = "{}-{}".format(a,e)
                        main_train(a,args.agent,args.policy,e,args.rewardf,args.opponent,args.n_steps,name,args.game_name)
        else:
            main_train(args.architecture,args.agent,args.policy,args.epsilon,args.rewardf,args.opponent,args.n_steps,args.model_name,args.game_name)
            
        pass
    @property 
    def game(self):
        return self.model.env.game
        
    def choose_action(self,state):
        """
        The player chooses an action given a current state.

        Args:
            state (State): The current state
        
        Returns:
            action (Action): The selected action. Should be one from the list of state.legal_actions
        """
        self.game.current_state = state
        obs = self.game.current_observation
        # TODO Check if ok
        action_idx = self.model.agent.forward(obs)
        action_str =  str(self.game.all_actions[action_idx])
        legal_action = self.game.current_state.get_legal_action_from_str(action_str)
        if not legal_action:
            log.debug("RL Player select a non leagal action")
            action_idx = self.game.sample_random_legal_action
            action_str =  str(self.game.all_actions[action_idx])
            log.debug(paint("\t Selected random instead action: {}".format(action_str),bcolors.FAIL))
            
            return self.game.current_state.get_legal_action_from_str(action_str)
        return legal_action
