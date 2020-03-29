import os
from py_utils.colors import paint, bcolors

def run(command):
    print(paint("\t\tRunning: " + command,bcolors.WARNING))
    os.system(command)

if __name__ == "__main__":
    #Bild players
    game_names = ['nim','ttt']
    backgrounds = ['./approaches/ilasp/nim/background.lp','./game_definitions/ttt/background.lp']
    initial_names = [('S',6),('M',3),('L',1)]
    # initial_names = [('S',2)]
    print("--------------- Building --------------------")
    # for g_i, g in enumerate(game_names):
    #     print(paint("Game: {}".format(g),bcolors.OKBLUE))
    #     for i,n in initial_names:
    #         print(paint("\tInitial: {}".format(i),bcolors.HEADER))
    #         base = "python main.py {} --log=error --n={} --game-name={} --init=initial_{}.lp --out={}.json {}".format('{}',n,g,i,i,'{}')
    #         run(base.format('minmax','--tree-name={}.json'.format(i)))
    #         run(base.format('pruned_minmax','--tree-name={}.json'.format(i)))
    #         run(base.format('pruned_minmax','--rules={}.lp'.format(i)))
    #         run(base.format('ilasp','--strategy-name={}.lp --background-path="{}"'.format(i,backgrounds[g_i])))
    
    print("--------------- Testing --------------------")
    # initial_names = [('full',5)]
    initial_names = [('full',150)]
    players = ['pruned_minmax-rule-S.lp','pruned_minmax-rule-M.lp','pruned_minmax-rule-L.lp']
    players.extend(['pruned_minmax-tree-S.json','pruned_minmax-tree-M.json','pruned_minmax-tree-L.json'])
    players.extend(['minmax-S.json','minmax-M.json','minmax-L.json'])
    players.extend(['ilasp-S.lp','ilasp-M.lp','ilasp-L.lp'])
    # players = ['pruned_minmax-rule-S.lp','pruned_minmax-rule-M.lp']
    # players.extend(['pruned_minmax-tree-S.json','pruned_minmax-tree-M.json'])
    # players.extend(['minmax-S.json','minmax-M.json'])
    # players.extend(['ilasp-S.lp','ilasp-M.lp'])

    for g in game_names:
        print(paint("Game: {}".format(g),bcolors.OKBLUE))
        for i,n in initial_names:
            print(paint("\tInitial: {}".format(i),bcolors.HEADER))
            for p_a in players:
                command = "python main.py vs  --log=error --n={} --game-name={} --init=initial_{}.lp --out=VS_{}_in_{}.json --play-symmetry --a=random --b={}".format(n,g,i,p_a,i,p_a)
                run(command)