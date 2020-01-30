from rl_agent.asp_game_env import ASPGameEnv
from .tracker_callbacks import SaveTrackEpisodes
from structures.model import ModelSelector
from structures.agent import AgentSelector
from structures.policy import PolicySelector
from structures.players import StrategyPlayer, RandomPlayer
from game_definitions import GameDef
from py_utils.logger import log

import numpy as np
import asyncio
import json

import tensorflow as tf
tf.compat.v1.disable_eager_execution()


class RLInstance():

	def __init__(self, architecture, agent, policy, epsilon, rewardf, opponent_name, n_steps, model_name, game_name, strategy_path):
		
		self.build(architecture, agent, policy, epsilon, rewardf,opponent_name,n_steps, model_name, game_name, strategy_path)
		self.input = locals()
		del self.input['self']
		
		
	def build(self, architecture, agent, policy, epsilon, rewardf, opponent_name, n_steps, model_name, game_name, strategy_path):
		
		game_def = GameDef.from_name(game_name)

		if(opponent_name=="strategy"):
			opponent = StrategyPlayer(game_def,strategy_path)    
		elif(opponent_name=="random"):
			opponent = RandomPlayer()
		elif(opponent_name=="ml"):
			raise NotImplementedError

		clip_rewards = False
		if rewardf == "clipped":
			clip_rewards = True


		self.env = ASPGameEnv(game_def,opponent,clip_rewards= clip_rewards)
		self.model = ModelSelector(env = self.env).return_model(architecture)
		self.policy = PolicySelector(env = self.env, epsilon = epsilon).return_policy(policy)
		self.agent = AgentSelector(env = self.env, model = self.model, policy = self.policy).return_agent(agent)
		self.instance_name = model_name
		self.loop = asyncio.get_event_loop()
	

	def train(self, saving = True, num_steps = 1000):
		#np.random.seed(666)
		# env.seed(666)

		training_logger = SaveTrackEpisodes(name=self.instance_name)
		
		self.agent.fit(self.env, nb_steps=num_steps, visualize=False, nb_max_episode_steps=99,
			callbacks=[training_logger])

		if saving:
			self.save()	    

	def test(self, num_episodes = 2, visualize = True, nb_max_episode_steps=99):
		log.info("\n\nTesting ---------------\n")
		# recording test results
		self.agent.test(self.env, nb_episodes=num_episodes, visualize=visualize, nb_max_episode_steps=nb_max_episode_steps)
		self.env.game.debug = False

	def save(self):
		file_base = "./rl_agent/saved_models/"+self.instance_name
		file_weights = file_base + ".weights"
		file_info = file_base + ".json"
		self.agent.save_weights(file_weights, overwrite=True)
		with open(file_info, 'w') as fp:
			json.dump(self.input, fp)


	def load_weights(self, model_name):
		file_name = "./rl_agent/saved_models/" + model_name + ".weights"
		self.agent.load_weights(file_name)


	@classmethod
	def from_file(cls, model_name):
		file_info = "./rl_agent/saved_models/"+ model_name + ".json"
		with open(file_info, 'r') as fr:
			dct = json.load(fr)
		rl_instance = cls(**dct)
		rl_instance.load_weights(model_name)
		return rl_instance

