from ml_agent.asp_game_env import ASPGameEnv
from py_utils.logger import log
import numpy as np
import asyncio
import json

import tensorflow as tf
tf.compat.v1.disable_eager_execution()


class MLInstance():

	def __init__(self):
		self.build()
		self.input = locals()
		del self.input['self']
		
		
	def build(self):
		pass

	def train(self, saving = True, num_steps = 1000):
		#Partition data for cv

		#Use initial state and action state to train a network to learn the next state
		#Maybe save partial network for testing

		#Remove last layer of network and retrain to learn the reward and win
		#Save final network

		if saving:
			self.save()	    

	def test(self):
		#Test
		pass

	def save(self):
		file_base = "./ml_agent/saved_models/"+self
		file_weights = file_base + ".weights"
		file_info = file_base + ".json"
		#Save wigths of nn
		with open(file_info, 'w') as fp:
			json.dump(self.input, fp)


	def load_weights(self, model_name):
		file_name = "./ml_agent/saved_models/" + model_name + ".weights"
		#Load weigths of nn
		# self.agent.load_weights(file_name)


	@classmethod
	def from_file(cls, model_name):
		file_info = "./ml_agent/saved_models/"+ model_name + ".json"
		with open(file_info, 'r') as fr:
			dct = json.load(fr)
		rl_instance = cls(**dct)
		rl_instance.load_weights(model_name)
		return rl_instance

