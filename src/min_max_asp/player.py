from structures.players import Player
from py_utils.clingo_utils import fluents_to_asp_syntax
from min_max_asp.min_max_asp import get_minmax_init

class MinmaxASPPlayer(Player):
    """
    Player that choses an action using the minmax of asp

    Attributes
    ----------
    game_def: The game definition
    main_player: The name of the player to optimize
    """
    def __init__(self, config):
        super().__init__()
        self.game_def = config['game_def']
        self.main_player = config['main_player']
        self.learned = "{does(P,A,T):best_do(P,A,T)}=1:-time(T),not holds(goal(_,_),T),{best_do(P,A,T)}>0,true(control(P)).\n"

    @staticmethod
    def match_name(name):
        return name=="minmax_asp"

    def choose_action(self,state):
        initial = fluents_to_asp_syntax(state.fluents,0)
        match, tree, ex, ls, tl = get_minmax_init(self.game_def,self.main_player,initial,extra_fixed=self.learned)
        self.learned+= "\n".join(ls)
        action_name = str(match.steps[0].action.action)
        action = [l_a for l_a in state.legal_actions
                  if str(l_a.action) == action_name][0]
        return action