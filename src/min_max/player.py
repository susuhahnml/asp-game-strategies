
from structures.players import Player
from structures.tree import Tree
from min_max.min_max import minmax_from_game_def


class MinmaxPlayer(Player):
    """
    Player that choses an action using the classic minmax computation

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """
    def __init__(self, config):
        super().__init__()
        self.game_def = config['game_def']
        self.main_player = config['main_player']

    @staticmethod
    def match_name(name):
        return name=="minmax"

    def get_name(self):
        return "Normal Minmax maximizing player {}".format(self.main_player)

    def choose_action(self,state):
        #TODO Give a time limit and save learned rules
        tree = minmax_from_game_def(self.game_def,initial_state=state,main_player=self.main_player)
        next_steps = [c.name for c in tree.root.children if c.name.score==tree.root.name.score]
        action_name = str(next_steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if str(l_a.action) == action_name][0]
        return action
