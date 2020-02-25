from structures.game_def import GameDef
import re
class GameNimDef(GameDef):

    def __init__(self,name,initial=None,constants={}):
        """
        Constructs a nim definition
        """
        super().__init__(name,initial,constants)
        self.number_piles = int(self.get_constant("num_piles"))
        self.max_sticks = int(self.get_constant("num_piles"))
        self.subst_var = {"remove":[True,False],
                          "has":[True,False],"control":[True]}

    def state_to_ascii(self, state):
        """
        Transforms a state into ascii representation for better visualization

        Args:
            state (State): A state of type State

        Returns:
            String with ascii representation
        """
        has = {f.arguments[0].number:f.arguments[1].number
               for f in state.fluents if f.name=="has"}
        a = ""
        for p in range(self.number_piles):
            n = has[p+1] if p+1 in has else 0
            a+="• "*n  + " "*((self.max_sticks-n)*2) + "\n"
        return a

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
        state = step.state
        a = "\n"
        a += self.state_to_ascii(state)
        if(not step.action):
            return a
        p = step.action.action.arguments[0].number
        n = step.action.action.arguments[1].number
        lines = a.splitlines()
        new_line = (step.action.player+" ")*(n) + lines[p][(n)*2:]
        lines[p] = new_line
        # for i,line in enumerate(lines):
        #     if i != 0 and re.match(r'^\s*$', line):
        #         del lines[i]
        return "\n".join(lines)
