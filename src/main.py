from py_utils.match_simulation import simulate_match
from game_definitions.game_def import *

nim_url='./game_definitions/nim'
game_def = GameNimDef(nim_url)

match = simulate_match(game_def,
[
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"},
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"}
    # {"name":"human"}
    {"name":"random"},
    {"name":"random"}
],debug=True)
