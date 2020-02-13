from gym import Env
import numpy as np
from gym.spaces import Discrete, Tuple
from py_utils.colors import *
import sys
import copy
from .game import Game
from approaches.strategy.player import StrategyPlayer

class ASPGameEnv(Env):
    """The abstract environment class that is used by all agents. This class has the exact
    same API that OpenAI Gym uses so that integrating with it is trivial. In contrast to the
    OpenAI Gym implementation, this class only defines the abstract methods without any actual
    implementation.
    To implement your own environment, you need to define the following methods:
    - `step`
    - `reset` 
    - `render`
    - `close`
    Refer to the [Gym documentation](https://gym.openai.com/docs/#environments).
    """

    def __init__(self,game_def,opponent,clip_rewards=False,player_name="a"):
        self.game_def = game_def
        self.game= Game(game_def, clip_rewards = clip_rewards,player_name=player_name)
        self.nb_actions = len(self.game.all_actions)
        self.nb_observations = len(self.game.all_obs)
        self.action_space = Discrete(self.nb_actions)
        self.observation_space = Tuple([Discrete(2) for i in range(0,self.nb_observations)])
        self.reward_range = (-60, 60)
        self.opponent = opponent
        self.clip_rewards = clip_rewards



    def step(self, action):
        """Run one timestep of the environment's dynamics.
        Accepts an action and returns a tuple (observation, reward, done, info).
        # Arguments
            action (object): An action provided by the environment.
        # Returns
            observation (object): Agent's observation of the current environment.
            reward (float) : Amount of reward returned after previous action.
            done (boolean): Whether the episode has ended, in which case further step() calls will return undefined results.
            info (dict): Contains auxiliary diagnostic information (helpful for debugging, and sometimes learning).
        """
        #TODO what if not starting with a?
        #Performing one step for player a
        obs1, rew1, done1, info =  self.game.step("a",action,next_strategy =  self.opponent.strategy)

        if done1:
            return obs1, rew1, done1, info
        
        action = self.opponent.choose_action(self.game.current_state)
        action_idx = self.game.actionstr_to_idx[str(action.action)]
        # rand_idx = self.game.sample_random_legal_action()
        #Performing one random step for player b
        return self.game.step("a",action_idx)

    def reset(self):
        """
        Resets the state of the environment and returns an initial observation.
        # Returns
            observation (object): The initial observation of the space. Initial reward is assumed to be 0.
        """
        #TODO find how to deep copy the game without the clingo errors
        self.game.random_reset()
        return self.game.current_observation

    def render(self, mode='human', close=False):
        """Renders the environment.
        The set of supported modes varies per environment. (And some
        environments do not support rendering at all.)
        # Arguments
            mode (str): The mode to render with.
            close (bool): Close all open renderings.
        """
        self.game.render()

    def close(self):
        """Override in your subclass to perform any necessary cleanup.
        Environments will automatically close() themselves when
        garbage collected or when the program exits.
        """
        return

    def seed(self, seed=None):
        """Sets the seed for this env's random number generator(s).
        # Returns
            Returns the list of seeds used in this env's random number generators
        """
        # TODO
        pass

    def configure(self, *args, **kwargs):
        """Provides runtime configuration to the environment.
        This configuration should consist of data that tells your
        environment how to run (such as an address of a remote server,
        or path to your ImageNet data). It should not affect the
        semantics of the environment.
        """
        # TODO
        pass

    def __del__(self):
        self.close()

    def __str__(self):
        return """
        Current state: {}
        """.format(self.game.current_state)
