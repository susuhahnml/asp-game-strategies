% Grid size
#const n = 2.
% Winning number configuration
#const m = 2.

% Player identifier
role(a).
role(b).

% Action selection
legal(P,mark(X,Y)) :- X=1..n, Y=1..n, true(control(P)), not true(has(_,X,Y)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)),not terminal.
next(control(a)) :- true(control(b)),not terminal.
next(has(P,X,Y)) :- does(P,mark(X,Y)),not terminal.
next(has(P,X,Y)) :- true(has(P,X,Y)),not terminal.

% Check for win
goal(P,1):-#count{1,P,X+M,Y:true(has(P,X+M,Y)),M=0..m-1}=C,C=m,true(has(P,X,Y)),role(P).
goal(P,1):-#count{1,P,X,Y+M:true(has(P,X,Y+M)),M=0..m-1}=C,C=m,true(has(P,X,Y)),role(P).
goal(P,1):-#count{1,P,X+M,Y-M:true(has(P,X+M,Y-M)),M=0..m-1}=C,C=m,true(has(P,X,Y)),role(P).
goal(P,1):-#count{1,P,X+M,Y+M:true(has(P,X+M,Y+M)),M=0..m-1}=C,C=m,true(has(P,X,Y)),role(P).

% Complementary goal declaration
goal(X,-1*G) :- goal(Y,G), role(X), X!=Y.

% Draw check
goal(P,0) :- true(control(P)), not goal(P,1), not goal(P,-1), not legal(P,_).

% Terminal declaration
terminal :- goal(_,_).

#show does/2.
