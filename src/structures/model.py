from tensorflow.keras.models import Sequential, Model
from tensorflow.keras.layers import Dense, Activation, Flatten

class ModelSelector():

	def __init__(self,env):
		self.env = env

	def return_model(self, architecture):
		if architecture == 'dense':
			model = DenseSimple(self.env)
			return model.build()

		elif architecture == 'dense-deep':
			model = DenseDeep(self.env)
			return model.build()

		elif architecture == 'dense-wide':
			model = DenseWide(self.env)
			return model.build()

		elif architecture == 'resnet-50':
			model = ResNetFifty(self.env)
			return model.build()

		else:
			raise ValueError("You have supplied an unknown architecture.")


class DenseSimple():

	def __init__(self,env):
		self.env = env
	
	def build(self):
		# building of simp
	    model = Sequential()
	    model.add(Flatten(input_shape=(1,) + (self.env.nb_observations,)))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(self.env.nb_actions))
	    model.add(Activation('softmax'))

	    return model

class DenseDeep():

	def __init__(self,env):
		self.env = env

		
	def build(self):
		# building of simp
	    model = Sequential()
	    model.add(Flatten(input_shape=(1,) + (self.env.nb_observations,)))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(40))
	    model.add(Activation('relu'))
	    model.add(Dense(self.env.nb_actions))
	    model.add(Activation('softmax'))

	    return model

class DenseWide():

	def __init__(self,env):
		self.env = env
	
	def build(self):
		# building of simp
	    model = Sequential()
	    model.add(Flatten(input_shape=(1,) + (self.env.nb_observations,)))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(80))
	    model.add(Activation('relu'))
	    model.add(Dense(self.env.nb_actions))
	    model.add(Activation('softmax'))


class ResNetFifty():
	def build(self):
		pass