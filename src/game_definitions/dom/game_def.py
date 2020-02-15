from structures.game_def import GameDef
import re

class GameNimDef(GameDef):

    def __init__(self,name,initial=None,constants={}):
        """
        Constructs a nim definition
        """
        super().__init__(name,initial,constants)
        self.size = int(self.get_constant("size"))+1
        self.subst_var = {"in_hand":[True,False],
                          "stack":[True,True],
                          "plays":[False,True],
                          "pass":[],
                          "control":[False],
                          "domino":[True,True]}

    def state_to_ascii(self, state):
        """
        Transforms a state into ascii representation for better visualization

        Args:
            state (State): A state of type State

        Returns:
            String with ascii representation
        """
        div = "-"*(self.size*2 +1) +"\n"
        a = div
        in_hand = [f for f in state.fluents if f.name == "in_hand"]
        hands = {'a':[],'b':[]}
        for h in in_hand:
            t = (h.arguments[1].arguments[0].number,h.arguments[1].arguments[1].number)
            hands[h.arguments[0].name].append(t)
        stack = {f.arguments[0].name:f.arguments[1].number for f in state.fluents if f.name == "stack"}
        cont_a = "➤ " if state.control == "a" else " "
        cont_b = "➤ " if state.control == "b" else " "
        hand_a = "  ".join(["{}-{}".format(t[0],t[1]) for t in hands['a']])
        hand_b = "  ".join(["{}-{}".format(t[0],t[1]) for t in hands['b']])
        return """
{}a: {}

    ⎡{}⎤
    ⎣{}⎦

{}b: {}
        """.format(cont_a, hand_a, stack['l'],stack['r'],cont_b,hand_b)

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
        p=step.state.control
        state = step.state
        a_split = self.state_to_ascii(state).splitlines(True)
        if(not step.action):
            return "".join(a_split)
        if(step.action.action.name=="pass"):
            a_split = a_split[:3] + ["\tpass\n"] + a_split[3:]
            a_split = a_split[:6] + ["\tpass\n"] + a_split[6:]
            return "".join(a_split)
        d = (step.action.action.arguments[0].arguments[0].number,step.action.action.arguments[0].arguments[1].number)
        s = step.action.action.arguments[1].name
        d_string = "\t[{}-{}]\n".format(d[0],d[1])
        if s == "l":
            a_split = a_split[:3] + [d_string] + a_split[3:]
        else:
            a_split = a_split[:5] + [d_string] + a_split[5:]
        return "".join(a_split)
