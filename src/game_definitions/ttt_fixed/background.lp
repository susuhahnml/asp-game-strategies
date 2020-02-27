#const win_conf=3.
#const grid_size=3.

% Player identifier
role(a).
role(b).

cell(1,1).cell(1,2).cell(1,3).cell(2,1).cell(2,2).cell(2,3).cell(3,1).cell(3,2).cell(3,3).
in_line(cell(X,Y),cell(X,Y+1),cell(X,Y+2)):-cell(X,Y),cell(X,Y+1),cell(X,Y+2).
in_line(cell(X,Y),cell(X+1,Y),cell(X+2,Y)):-cell(X,Y),cell(X+1,Y),cell(X+2,Y).
in_line(cell(X,Y),cell(X+1,Y+1),cell(X+2,Y+2)):-cell(X,Y),cell(X+1,Y+1),cell(X+2,Y+2).
in_line(cell(X,Y),cell(X+1,Y-1),cell(X+2,Y-2)):-cell(X,Y),cell(X+1,Y-1),cell(X+2,Y-2).


% Base (All possible fluents)
base(has(P,cell(X,Y))):- role(P), cell(X,Y).
base(free(cell(X,Y))):- cell(X,Y).
base(control(X)) :- role(X).

% Input (All possible actions)
input(P,mark(cell(X,Y))) :- cell(X,Y), role(P).

% Action selection
legal(P,mark(cell(X,Y))) :- true(control(P)), true(free(cell(X,Y))), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% 1 { does(P,A): legal(P,A)} 1 :- true(control(P)), not terminal.

% State transition
next(control(b)) :- true(control(a)), not terminal.
next(control(a)) :- true(control(b)), not terminal.
next(has(P,cell(X,Y))) :- does(P,mark(cell(X,Y))), not terminal.
next(has(P,cell(X,Y))) :- true(has(P,cell(X,Y))), role(P), not terminal.
next(free(cell(X,Y))) :- true(free(cell(X,Y))), not does(_,mark(cell(X,Y))), not terminal.


goal(P,1) :- true(has(P,C1)),true(has(P,C2)),true(has(P,C3)), in_line(C1,C2,C3).

goal(P,0) :- true(control(P)), not goal(P,1), not goal(P,-1), 
not true(free(cell(1,1))),not true(free(cell(1,2))),not true(free(cell(1,3))),
not true(free(cell(2,1))),not true(free(cell(2,2))),not true(free(cell(2,3))),
not true(free(cell(3,1))),not true(free(cell(3,2))),not true(free(cell(3,3))).

% Complementary goal declaration
goal(P,-1*G) :- goal(P2,G), role(P), P!=P2.

% Terminal declaration
terminal :- goal(_,_).

