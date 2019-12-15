from py_utils import *

nim_url='./src/game_definitions/nim'
match = simulate_match(nim_url,
[
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"},
    # {"name":"strategy","strategy_path":nim_url+"/strategy.lp"}
    # {"name":"human"}
    {"name":"random"},
    {"name":"random"}
])
