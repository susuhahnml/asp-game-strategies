import pandas as pd
import timeit	
import numpy as np
import warnings
from csv import DictWriter
from rl.callbacks import Callback
from py_utils.clingo_utils import symbol_str
from py_utils.logger import log

class SaveTrackEpisodes(Callback):
    def __init__(self, name):
        # Some algorithms compute multiple episodes at once since they are multi-threaded.
        # We therefore use a dictionary that is indexed by the episode to separate episodes
        # from each other.
        self.episode_start = {}
        self.observations = {}
        self.rewards = {}
        self.actions = {}
        self.metrics = {}
        self.step = 0
        self.name = name

    def on_train_begin(self, logs):
        """ Print training values at beginning of training """
        self.train_start = timeit.default_timer()
        self.metrics_names = self.model.metrics_names
        self.all_info = []
        log.info('Training for {} steps ...'.format(self.params['nb_steps']))

    def on_episode_begin(self, episode, logs):
        """ Reset environment variables at beginning of each episode """
        self.episode_start[episode] = timeit.default_timer()
        self.episode_var_dict = {}
        self.episode_var_dict['episode'] = episode


        self.observations[episode] = []
        self.actions[episode] = []
        self.metrics[episode] = []
        self.rewards[episode] = []


    def on_step_end(self, step, logs):
        """ Update statistics of episode after each step """
       	episode = logs['episode']
        self.observations[episode].append(logs['observation'])
        self.actions[episode].append(logs['action'])
        self.metrics[episode].append(logs['metrics'])
        self.rewards[episode].append(logs['reward'])
        self.step += 1

    def on_episode_end(self, episode, logs):
        """ Compute and print training statistics of the episode when done """

        self.episode_var_dict['duration'] = timeit.default_timer() - self.episode_start[episode]
        self.episode_var_dict['steps'] = len(self.observations[episode])
        self.episode_var_dict['observation_hist'] = self.observations[episode]
        self.episode_var_dict['action_hist'] = self.actions[episode]
        self.episode_var_dict['final_action'] = self.actions[episode][-1]
        self.episode_var_dict['final_state'] = self.observations[episode][-1]
        self.episode_var_dict['reward'] = self.rewards[episode][-1]

        # Get metrics for loss, mae, and mean_q
        metrics = np.array(self.metrics[episode])
        metrics_variables = []
        with warnings.catch_warnings():
            warnings.filterwarnings('error')
            for idx, name in enumerate(self.metrics_names):
                try:
                	value = np.nanmean(metrics[:, idx])
                except Warning:
                	value = '--'
                metrics_variables.append((name, value))      

        for tpl in metrics_variables:
        	self.episode_var_dict[tpl[0]] = tpl[1]
        
        self.all_info.append(self.episode_var_dict)

       	 # Free up resources.
       	del self.episode_var_dict
        del self.episode_start[episode]
        del self.observations[episode]
        del self.rewards[episode]
        del self.actions[episode]
        del self.metrics[episode]

    def on_train_end(self, logs):
        """ Print training time at end of training """
        duration = timeit.default_timer() - self.train_start
        self.save_to_file()
        log.info('Training finished, took {:.3f} seconds'.format(duration))

    def save_to_file(self):
    	COLUMN_NAMES = ['episode', 'duration', 'steps', 'reward', 'loss', 'mae', 'mean_q', 'final_state', 'final_action', 'observation_hist', 'action_hist']
    	file_name = "./rl_agent/logs/" + self.name + "_training_log.csv"
    	try:
    		with open(file_name, 'w') as csvfile:
    			writer = DictWriter(csvfile, fieldnames = COLUMN_NAMES)
    			writer.writeheader()
    			for data in self.all_info:
    				writer.writerow(data)
    	except IOError:
    		log.error("Error saving")