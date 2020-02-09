% Player identifier
role(a).
role(b).

% Action selection
legal(P,mark(X,Y)) :- X=1..N, Y=1..N, true(has(grid_size(N))), true(control(P)), not true(has(_,X,Y)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)), not terminal.
next(control(a)) :- true(control(b)), not terminal.
next(has(P,X,Y)) :- does(P,mark(X,Y)), not terminal.
next(has(P,X,Y)) :- true(has(P,X,Y)), not terminal.
next(has(grid_size(N))) :- true(has(grid_size(N))),not terminal.
next(has(win_conf(M))) :- true(has(win_conf(M))), not terminal.

% Horizontal win
goal(P,1) :- #count{P,X+M,Y:true(has(P,X+M,Y)),M=0..(Q-1)}=Q, true(has(win_conf(Q))), true(has(P,X,Y)), role(P).

% Vertical win
goal(P,1) :- #count{P,X,Y+M:true(has(P,X,Y+M)),M=0..(Q-1)}=Q, true(has(win_conf(Q))), true(has(P,X,Y)), role(P).

% Downwards diagonal win
goal(P,1):- #count{P,X+M,Y-M:true(has(P,X+M,Y-M)),M=0..(Q-1)}=Q, true(has(win_conf(Q))), true(has(P,X,Y)), role(P).

% Upwards diagonal win
goal(P,1):- #count{P,X+M,Y+M:true(has(P,X+M,Y+M)),M=0..(Q-1)}=Q, true(has(win_conf(Q))), true(has(P,X,Y)), role(P).

% Draw declaration
goal(P,0) :- true(control(P)), not goal(P,1), not goal(P,-1), #count{X,Y:true(has(_,X,Y))}=N**2, true(has(grid_size(N))).

% Complementary goal declaration
goal(X,-1*G) :- goal(Y,G), role(X), X!=Y.

% Terminal declaration
terminal :- goal(_,_).

#show does/2.
