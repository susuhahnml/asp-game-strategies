from rl.memory import SequentialMemory
from rl.agents.dqn import DQNAgent
from tensorflow.keras.optimizers import Adam


class AgentSelector():

	def __init__(self, env, model, policy):
		self.env = env
		self.model = model
		self.policy = policy
		self.memory = SequentialMemory(limit=50000, window_length=1)

	def return_agent(self, agent_name):
		if agent_name == 'dqn':
			agent = DQNAgent(model=self.model, nb_actions=self.env.nb_actions, memory=self.memory, nb_steps_warmup=100, target_model_update=1e-2, policy=self.policy)
			agent.compile(Adam(lr=1e-3), metrics=['mae'])
			agent.test_policy = self.policy
			return agent

		else:
			raise ValueError("You have supplied an unknown agent.")