from rl.policy import EpsGreedyQPolicy
import numpy as np
from py_utils.logger import log
class PolicySelector():

	def __init__(self, env, epsilon):
		self.env = env
		self.epsilon = epsilon

	def return_policy(self, policy_name):
		if policy_name == 'custom_eps_greedy':
			return CustomPolicy(env = self.env, eps = self.epsilon)

		elif policy_name == 'eps_greedy':
			return EpsGreedyQPolicy(eps = self.epsilon)

		else:
			raise ValueError("You have supplied an unknown architecture.")


class CustomPolicy(EpsGreedyQPolicy):
    """Implement the epsilon greedy policy
    Eps Greedy policy either:
    - takes a random action with probability epsilon
    - takes current best action with prob (1 - epsilon)
    """
    def __init__(self, env, eps=.1):
        super(CustomPolicy, self).__init__(eps)
        self.env = env

    def select_action(self, q_values):
        """Return the selected action
        # Arguments
            q_values (np.ndarray): List of the estimations of Q for each action
        # Returns
            Selection action
        """

        mask = self.env.game.mask_legal_actions()
        masked_q_values = q_values[:]
        masked_q_values[mask==0] = -np.inf
        assert q_values.ndim == 1
        nb_actions = q_values.shape[0]

        if np.random.uniform() < self.eps:
            action = self.env.game.sample_random_legal_action()
        else:
            action = np.argmax(masked_q_values)

        # log.debug("\n\n\n\n~~~~~~~~~~~~++++~~~~~~~~~~~~~ ~~~++~~~~~~~~~+~~~~~~~~~~~~~++ ~~~~~~~~~~~~~~~~~~~~~")
        # log.debug("All actions:", self.env.game.all_actions)
        # log.debug("Legal Mask:",self.env.game.mask_legal_actions())
        # log.debug("Q-Vals:",q_values)
        # log.debug("Masked Actions:",masked_q_values)
        # log.debug("Current State:",self.env.game.current_state)
        # log.debug("Index:",action)
        # if action:
        #     log.debug("Action:", self.env.game.all_actions[action])
        return action