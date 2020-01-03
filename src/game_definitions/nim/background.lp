% Removable configuration
#const n = 3.
removable(1..n).

% Roles (Players)
role(a).
role(b).

% Condition where last pile is encountered
last_pile :- #sum{1,M:true(has(M,Q)),Q!=0} = 1.

% Create symmetry to ensure only unique or pseudo-unique piles are handled
unique(P) :- #sum{1,L:true(has(L,Q))} = 1, true(has(P,Q)).
unique(X) :- #sum{1,L:true(has(L,Q))} != 1, true(has(P,Q)), X = #min{L:true(has(L,Q))}.

% Action selection
legal(X,remove(P,N)) :- true(has(P,M)), unique(P), removable(N), N<=M, true(control(X)), not terminal, not last_pile.
legal(X,remove(P,N)) :- true(has(P,M)), removable(N), N<M, true(control(X)), not terminal, last_pile.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)).
next(control(a)) :- true(control(b)).
next(has(P,N-M)) :- does(_,remove(P,M)), true(has(P,N)).
next(has(P,N)) :- not does(_,remove(P,_)), true(has(P,N)).

% Define goal and terminal states
goal(X,-1) :- #sum{N,M:true(has(M,N))}=1, true(control(X)).
goal(X,-1*G):- goal(Y,G), role(X), X!=Y.
terminal :- goal(_,_).

#show does/2.
