from structures.game_def import GameDef
import re
class GameTTTFixedDef(GameDef):

    def __init__(self,name,initial=None,constants={}):
        """
        Constructs a nim definition
        """
        super().__init__(name,initial,constants)
        self.grid_size = int(self.get_constant("grid_size"))
        self.subst_var = {"mark":[False], "cell":[False,False],
                          "has":[True,False],"control":[True],"free":[False,False]}

    def state_to_ascii(self, state):
        """
        Transforms a state into ascii representation for better visualization

        Args:
            state (State): A state of type State

        Returns:
            String with ascii representation
        """
        to_sub = [["•"]*self.grid_size for i in range(self.grid_size)]
        fluents = state.fluents
        for fluent in fluents:
            if fluent.name == "has":
                p = str(fluent.arguments[0])
                x = fluent.arguments[1].arguments[0].number
                y = fluent.arguments[1].arguments[1].number
                to_sub[x-1][y-1]=p
        return "\n".join([" ".join(x) for x in to_sub])

    def step_to_ascii(self, step):
        """
        Transforms a step into ascii representation.
        This representation must include the effects of the step's action 
        one the step's state. The action of this step can not be assumed
        of being of type StateExpanded.

        Args:
            step (Step): A step of type Step

        Returns:
            String with ascii representation
        """
        a_split = self.state_to_ascii(step.state).splitlines(True)
        if(not step.action):
            return "".join(a_split)
        x = step.action.action.arguments[0].arguments[0].number -1
        y = step.action.action.arguments[0].arguments[1].number -1
        a_split[x] = a_split[x][0:y*2] + step.action.player + a_split[x][y*2+1:]

        return "".join(a_split)

