% Removable configuration
#const max_removable = 6.
#const max_sticks = 7.
#const num_piles = 4.

% Roles
role(a). role(b).

% Base (All possible fluents)
base(has(P,M)):-P=1..num_piles,M=0..max_sticks.
base(control(X)) :- role(X).

% Input (All possible actions)
input(X,remove(P,N)) :- P=1..num_piles, N=1..max_removable,role(X).


% Legal action
legal(X,remove(P,N)) :- true(has(P,M)), P = #min{L:true(has(L,M))}, N=1..max_removable, N<=M, true(control(X)), not terminal.

% Action selection
0 {does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)), not terminal.
next(control(a)) :- true(control(b)), not terminal.
next(has(P,N-M)) :- does(_,remove(P,M)), true(has(P,N)), not terminal.
next(has(P,N)) :- not does(_,remove(P,_)), true(has(P,N)), not terminal.

% Goals
goal(X,-1) :- #sum{N,M:true(has(M,N))}=0, true(control(X)).
goal(X,-1*G):- goal(Y,G), role(X), X!=Y.

% Terminal state
terminal :- goal(_,_).

