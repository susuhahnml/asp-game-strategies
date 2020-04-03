# Minimax pruned by ASP

## Description

This approach finds the best action by constructing the relevant parts of the min-max tree. The construction is performed similarly as a DFS while using optimization statements from *clingo*. Results are expressed in the form of ASP rules and generalized for other instances.

#### Explicit time encoding

To define a game in this framework we are using the syntax of Game Definition Language. This language uses predicate `true(F)` to indicate that `F`  holds in the current state and `next(F)` when it holds in the next one. This syntax can be translated to a single predicate `holds(F,T)` for stating that `F` holds in time step `T`. In order to translate a full encoding for a game definition we need to perform the following steps:

1. Replace `true(F)` by `holds(F,T)`
2. Replace `next(F)` by `holds(F,T+1)`
3. Replace `p(F1..Fn)` by `p(F1..Fn,T)` where `p` $\in \{$ ``legal,true,does,goal,terminal``$\}$
4. In every rule where a replacement was made, add the time in in the body with predicate `time(T)`
5. Add a new fact with all possible time steps using a defined horizon of `N` `time(0..N)`

With the new encoding, each stable model will represent a full match containing the actions performed in each time step.

##### Optimization

The ASP solver *clingo* includes a set of optimization statements which imply an order on the stable models. This statements allow the selection of an optimal answer set. 

`#maximize{N,T:goal(a,N,T)}.` 

With this statement we aim to find the stable model which maximizes the reward `N` given to player `a` defined in the predicate `goal(a,N,T)`. In this case `T` represents the time step in which the goal was reached.

By adding this to the explicit time encoding of a game we will find the match that maximized players `a` reward. However, this optimization assumes that player `b` will make the moves that generate the best outcome for his opponent. In order to select actions for player `b` working on his own benefit, we would need to minimize the reward of `a` in the time steps where player `b` has control.

`#minimize{N,T:goal(a,N,T)}.` 

 This is the basic idea of the min max algorithm. Sadly, the alternation of different optimizations in every time step is not **possible directly**. 

#### The algorithm

The algorithm in this approach uses the defined explicit time encoding to find different optimal matches (stable models)encoding. It is performed as follows.

1. Find an initial match $M_o$ using the optimization for `a`. This match, is not minimized for `b`, as explained above. 
2. The match will be minimized using the optimization for `b` on the time steps where `b` has control.

Starting on the last step $s_i$ of the match we will construct a tree:
    
*We will check what would happen if the action on that step hadn't been selected fixing the rest of the match until this point.*
  1. We add the facts that define the previous actions and states and negate the selection of the current action.
  2. Call to clingo using the optimization statement of the player in control.

We perform a case analysis over the results of the call:

   - **a.** If there are no other actions in this point we go up to the next step $s_{i-1}$.
   - **b.** We compare the reward obtained by the player in control $r_o$ in the optimal model $M_o$ with the reward $r_c$ current one $M_c$.
     - **b1.** If $r_c > r_o$ then we keep the current step, since performing any other action gets a worst result even in the best case. 
     - **b2.** If $r_c = r_o$ then we keep the current step, since performing any other action cant improve current reward even in the best case. 
     - **b3.** If $r_c < r_o$ then performing the action of this model could get a better reward. However, since this model was only obtained with a simple call to *clingo*, we need to make sure that this match is properly minimized for the opponent. Therefore we must call this process recursively on the new match, while fixing all current actions to this point. This will result on a min-maxed optimized match $M_r$ with reward $r_{r}$.
        - **b31.** If $r_r > r_o$ then we keep the current step, since performing the other action gets a worst. 
       - **b32.** If $r_r = r_o$ then we keep the current step.
       - **b33.** If $r_r < r_o$ then we replace current  match $M_c$ with $M_r$.
  

This algorithm has the advantage of reducing pars of the search space in cases **b1** and **b2**. These parts of the tree are only explored within clingo but remain unknown to the final tree since their result is irrelevant for the selection.

## Images

#### Learning rules

During the process of pruning the match, there are several points where we become aware of one action being better than another. This points are **b1**, **b31** and **b33**. They define the critical points of the search where one player should take an action in order to achieve a better reward. It is here were we can generate rules in the form of an strategy or ordered examples to learn rules using ILASP. We can generate rules of the form:

```
best_do(a,remove(2,2),T):- holds(control(a),T),
                             holds(has(2,2),T),
                             holds(has(1,0),T), 
                             holds(has(3,0),T).
```

This rules state under which state context, described by predicate `holds\2` is it better to perform a certain action. In this case, for the game on Nim we are stating that: In a state where player `a` has control and only pile `2` has 2 sticks. It would be best for player `a` to remove from pile `2` both sticks. These rules can easily be transformed back to GDL syntax.

In order enforce the use of these preferred actions as an strategy we need to add the following rule:

```
1{does(P,A,T):best_do(P,A,T)}1:- time(T),
                                 not goal(_,_,T),
                                 {best_do(P,A,T)}>0,
                                 true(control(P)).
```

This type strategy will not be able to generalize in unknown states. To extend this approach for generalization we wanted the ability to decide whether a term should be converted into a variable or not. *This is added to the game definition with the `subst_var` attribute*. Once we have this information we can generalize such terms as variables, adding an additional line to ensure different variables stay as such.

```
best_do(Va,remove(V2,1),T):- holds(control(Va),T),
                             holds(has(V2,2),T),
                             holds(has(V1,0),T), 
                             holds(has(V3,0),T),
        V1!=V3,V1!=V2,V1!=Va,V3!=V2,V3!=Va,V2!=Va.
```

With this generalization we can apply the strategy to any permutation over the piles.

It is important to notice that this will only work when the set of fluents defining the state does not imply also a different one.

During game play, we can use the learned rules as the strategy. These rules will correspond to an abstract representation of the search tree. By running the construction algorithm when a decision must be made, we can take the learned rules and use them in further steps or even in different matches. We this approach we are both abstracting and combining minmax trees for different instances. Since this trees are represented by ASP rules we avoid the need for indexing the tree.

