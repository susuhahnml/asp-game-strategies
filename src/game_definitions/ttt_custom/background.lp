#const win_conf=2.
#const grid_size=2.

% Player identifier
role(a).
role(b).

% Base (All possible fluents)
base(has(P,X,Y)):-role(P), X=1..grid_size, Y=1..grid_size.
base(free(X,Y)):-X=1..grid_size, Y=1..grid_size.
base(control(X)) :- role(X).

% Input (All possible actions)
input(P,mark(X,Y)) :- X=1..grid_size, Y=1..grid_size, role(P).

% Action selection
legal(P,mark(X,Y)) :- true(control(P)), true(free(X,Y)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)), not terminal.
next(control(a)) :- true(control(b)), not terminal.
next(has(P,X,Y)) :- does(P,mark(X,Y)), not terminal.
next(has(P,X,Y)) :- true(has(P,X,Y)), role(P), not terminal.
next(free(X,Y)) :- true(free(X,Y)), not does(_,mark(X,Y)), not terminal.

% % Horizontal win
% goal(P,1) :- #count{P,X+M,Y:true(has(P,X+M,Y)),M=0..(win_conf-1)}==win_conf, true(has(P,X,Y)), role(P).

% % Vertical win
% goal(P,1) :- #count{P,X,Y+M:true(has(P,X,Y+M)),M=0..(win_conf-1)}==win_conf, true(has(P,X,Y)), role(P).

% % Downwards diagonal win
% goal(P,1):- #count{P,X+M,Y-M:true(has(P,X+M,Y-M)),M=0..(win_conf-1)}==win_conf, true(has(P,X,Y)), role(P).

% % Upwards diagonal win
% goal(P,1):- #count{P,X+M,Y+M:true(has(P,X+M,Y+M)),M=0..(win_conf-1)}==win_conf, true(has(P,X,Y)), role(P).

% % Draw declaration
% goal(P,0) :- true(control(P)), not goal(P,1), not goal(P,-1), #count{X,Y:true(free(X,Y))}=0.

% Complementary goal declaration
goal(P,-1*G) :- goal(P',G), role(P), P!=P'.

% Terminal declaration
terminal :- goal(_,_).

% #show does/2.


% %%%%%%%%%%%%%%% FIXED without aggregates

% Horizontal win
goal(P,1):-true(has(P,1,1)),true(has(P,1,2)),true(has(P,1,3)).
goal(P,1):-true(has(P,2,1)),true(has(P,2,2)),true(has(P,2,3)).
goal(P,1):-true(has(P,3,1)),true(has(P,3,2)),true(has(P,3,3)).

% Vertical win
goal(P,1):-true(has(P,1,1)),true(has(P,2,1)),true(has(P,3,1)).
goal(P,1):-true(has(P,1,2)),true(has(P,2,2)),true(has(P,3,2)).
goal(P,1):-true(has(P,1,3)),true(has(P,2,3)),true(has(P,3,3)).

% Downwards diagonal win
goal(P,1):-true(has(P,1,1)),true(has(P,2,2)),true(has(P,3,3)).

% Upwards diagonal win
goal(P,1):-true(has(P,1,3)),true(has(P,2,2)),true(has(P,3,1)).

% Draw declaration
goal(P,0) :- true(control(P)), not goal(P,1), not goal(P,-1), 
true(free(1,1)),true(free(1,2)),true(free(1,3)),
true(free(2,1)),true(free(2,2)),true(free(2,3)),
true(free(3,1)),true(free(3,2)),true(free(3,3)).


