from py_utils.clingo_utils import  generate_rule, get_all_possible, symbol_str
from py_utils.colors import *
from collections import defaultdict
import numpy as np
from .state import StateExpanded, State
from .match import Match
from structures.step import Step
from py_utils.logger import log
class Game:

    """
    Creates a game from a game_def.
    Args: 
        game_def: Game Definition
    """
    def __init__(self, game_def,debug=False,clip_rewards = False,player_name="a"):
        self.game_def = game_def
        #Set all options for actions and observations
        all_actions, all_obs = get_all_possible(game_def.all,player_name)
        self.all_actions = all_actions
        self.actionstr_to_idx = {symbol_str(a):i for i,a in enumerate(all_actions)}
        self.all_obs = all_obs
        self.obsstr_to_idx = {symbol_str(o):i for i,o in enumerate(all_obs)}
        self.debug = debug
        self.clip_rewards = clip_rewards
        #Set current state
        #TODO define how and where to randomly initialize
        self.random_reset()

    """
    Returns a nparray with True in the legal actions and False in the rest
    """
    def mask_action(self,action):
        actions = np.zeros(len(self.all_actions))
        actions[self.actionstr_to_idx[action]] = 1
        return actions

    """
    Returns a nparray with True in the legal actions and False in the rest
    """
    def mask_legal_actions(self):
        actions = np.zeros(len(self.all_actions))
        legal_actions = self.current_state.get_symbol_legal_actions()
        for a in legal_actions:
            actions[self.actionstr_to_idx[a]] = 1
        return actions

    """
    The list defining the current obstervation with the size of all possible fluents.
    Contains 1 in the position of fluents that are true in the current state
    """
    @property
    def current_observation(self):
        obs = np.zeros(len(self.all_obs))
        fluents = self.current_state.fluents_str
        fluents = [f for f in fluents if f!='terminal']
        for f in fluents:
            obs[self.obsstr_to_idx[f]] = 1
        return obs
    
    """
    Resets the game with a random initial state
    """
    def random_reset(self):
        initial = self.game_def.get_random_initial()
        initial_state = StateExpanded.from_game_def(self.game_def,initial)
        self.current_state = initial_state
        self.match = Match([Step(initial_state,None,0)])


    """
    Randomly sample an action from leagal actions in current state.
    Returns the idx of the action.
    """
    def sample_random_legal_action(self):
        n_legal = len(self.current_state.legal_actions)
        if n_legal==0: # "Cant sample without legal actions"
            return None
        r_l_idx = np.random.randint(n_legal)
        legal_action_str = symbol_str(self.current_state.legal_actions[r_l_idx].action)
        real_idx = self.actionstr_to_idx[legal_action_str]

        return real_idx

    """
    Gets a dictionary with the rewards for all players in the current state
    """
    @property 
    def current_rewards(self):
        resdict = defaultdict(int,self.current_state.goals)
        if self.clip_rewards:
            for key in resdict.keys():
                if resdict[key] > 0:
                    resdict[key] = 1
                elif resdict[key] < 0:
                    resdict[key] = -1
        return resdict

    """Run one timestep of the games dynamics.
    Accepts an action index and returns a tuple (observation, reward, done, info).
    Args:
        action_idx (number): The index of the action performed my the player
        player_str: The player name from which we want the reward
    Returns
        observation (object): Agent's observation of the current environment. Hot-One List
        reward (float) : Amount of reward returned after selected action.
        done (boolean): Whether the episode has ended
        info (dict): Contains auxiliary diagnostic information (helpful for debugging, and sometimes learning).
    """
    def step(self, player_str, action_idx, next_strategy = None):
        log.debug(paint("\n----------- Performing GAME step -----------",bcolors.REF))
        action_str =  symbol_str(self.all_actions[action_idx])
        legal_action = self.current_state.get_legal_action_from_str(action_str)
        log.debug(legal_action)
        if not legal_action:
            log.debug(paint("\tSelected non legal action",bcolors.FAIL))
            player_reward = -100
            log.debug(paint_bool("••••••• EPISODE FINISHED Reward:{} •••••••".format(player_reward),player_reward>0))
            return self.current_observation, player_reward, True, {}
        #Construct next state
        self.match.add_step(Step(self.current_state,legal_action,len(self.match.steps)))
        next_state = self.current_state.get_next(legal_action, strategy_path=next_strategy)
        self.current_state = next_state
        
        #Get information from next state
        done = self.current_state.is_terminal
        goals_dic = self.current_rewards
        player_reward = goals_dic[player_str] 
        if(done):
            log.debug(paint_bool("••••••• EPISODE FINISHED Reward:{} •••••••".format(player_reward),player_reward>0))
        return self.current_observation, player_reward, done, {}

    def __str__(self):
        return self.match.steps[-1].ascii

    def render(self):
        last = self.match.steps[-1]
        if(last.time_step%2 == 0 and last.time_step>0):
            log.info("\n" + self.match.steps[-2].ascii + "\n\n" + self.match.steps[-1].ascii)
        else:
            log.info("\n" + self.match.steps[-1].ascii)
