from structures.players import Player
from py_utils.logger import log
from py_utils.colors import bcolors, paint
from ml_agent.rl_instance import RLInstance
class RLPlayer(Player):
    """
    RL Player chooses an action given a model trained with rl

    Attributes
    ----------
    model: The trained model of instance RLInstance
    main_player: The name of the player to optimize

    """
    def __init__(self, config):
        super().__init__()
        model = RLInstance.from_file(config['name'][3:])
        self.model = model
        self.model_name = config['name'][3:]
        # self.main_player = config['main_player']

    @staticmethod
    def match_name(name):
        return name[:2]=="rl"

    def get_name(self):
        return "Reiforcement Learning player loaded from {}".format(self.model_name)
    @property 
    def game(self):
        return self.model.env.game

    def choose_action(self,state):
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


class MLPlayer(Player):
    """
    ML Player chooses an action given a model trained with supervised learning

    Attributes
    ----------
    model: The trained model
    main_player: The name of the player to optimize
    """
    def __init__(self, config):
        super().__init__()
        self.model = config['model']
        self.main_player = config['main_player']

    @staticmethod
    def match_name(name):
        return name[:2]=="ml"

    def choose_action(self,state):
        #Use a Game to transform state into observation (Allways based on player a in control)
        #Pass all legal actions tru model
        #Get action with better result
        #Return index of such action
        return 0