% Removable configuration
#const n = 3.
removable(1..n).

% Roles (Players)
role(a).
role(b).

% Action selection
legal(X,remove(P,N)) :- true(has(P,M)), removable(N), N<=M, true(control(X)), not terminal.
% legal(X,remove(P,N)) :- true(has(P,M)), P = #min{L:true(has(L,M))}, removable(N), N<=M, true(control(X)), not terminal.
0 {does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)).
next(control(a)) :- true(control(b)).
next(has(P,N-M)) :- does(_,remove(P,M)), true(has(P,N)).
next(has(P,N)) :- not does(_,remove(P,_)), true(has(P,N)).

% Define goal and terminal states
goal(X,1) :- #sum{N,M:true(has(M,N))}=0, true(control(X)).
goal(X,-1*G):- goal(Y,G), role(X), X!=Y.
terminal :- goal(_,_).

#show does/2.

