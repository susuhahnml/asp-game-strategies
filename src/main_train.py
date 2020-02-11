#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time
import argparse
from py_utils import arg_metav_formatter
from ml_agent.rl_instance import RLInstance
from py_utils.logger import log


def main_train(architecture,agent,policy,epsilon,rewardf,opponent_name,n_steps,model_name,game_name,strategy_path=None): 
    log.info("""
Training Summary:
    architecture: {}
    agent: {}
    policy: {}
    epsilon: {}
    rewardf: {}
    oponent: {}
    n_steps: {}
    model_name: {}
    game_name: {}
    """.format(architecture,agent.__class__.__name__,policy.__class__.__name__,epsilon,rewardf,opponent_name,n_steps,model_name,game_name))
    model = RLInstance(architecture, agent, policy, epsilon, rewardf, opponent_name, n_steps, model_name, game_name, strategy_path)
    model.train(num_steps=n_steps)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(formatter_class=arg_metav_formatter)
    parser.add_argument("--log", type=str, default="INFO",
                        help="Log level: 'info' 'debug' 'error'" )
    parser.add_argument("--architecture", type=str, default="dense",
                        help="underlying neural network architecture;" +
                        " Available: 'dense', 'dense-deep', 'dense-wide', 'resnet-50'")
    parser.add_argument("--agent", type=str, default="dqn",
                        help="agent used by rl network" +
                        " Available: 'dqn'") # TODO: add more agents
    parser.add_argument("--policy", type=str, default="custom_eps_greedy",
                        help="policy used for action selection;" +
                        " Available: 'custom_eps_greedy', 'eps_greedy'")
    parser.add_argument("--epsilon", type=float, default=0.1,
                        help="exploration factor epsilon")
    parser.add_argument("--rewardf", type=str, default="dom",
                        help="reward function used by network;" +
                        " Available: 'dom', 'clipped'")
    parser.add_argument("--opponent", type=str, default="strategy",
                        help="model underlying opponent behaviour"+
                        " Available: 'random', 'strategy-[name]', 'ml'")
    parser.add_argument("--n-steps", type=int, default=50000,
                        help="total number of steps to take in environment")
    parser.add_argument("--model-path", type=str, default=None,
                        help="path to saved weights for model to be used")
    parser.add_argument("--model-name", type=str, default="unnamed",
                        help="name of the model, used for saving and logging")
    parser.add_argument("--game-name", type=str, default="Dom",
                        help="short name for the game. Available: Dom and Nim")
    parser.add_argument("--grid-search", type=bool, default=False,
                        help="true for performing a grid search")

    
    args = parser.parse_args()
    log.set_level(args.log)

    if(args.grid_search):
        architecture = ['dense', 'dense-deep', 'dense-wide'] 
        epsilons = [0.1, 0.3, 0.5]
        for a in architecture:
                for e in epsilons:
                    name = "{}-{}".format(a,e)
                    main_train(a,args.agent,args.policy,e,args.rewardf,args.opponent,args.n_steps,name,args.game_name)
    else:
        main_train(args.architecture,args.agent,args.policy,args.epsilon,args.rewardf,args.opponent,args.n_steps,args.model_name,args.game_name)
