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

#constant(cell,1).
#constant(cell,2).
#constant(cell,3).
#constant(player,a).
#constant(player,b).
#modeo(4,next(has(var(player),var(cell))),(positive)).
#modeo(1,in_line(var(cell),var(cell),var(cell)),(positive)).
#modeo(3,next(free(var(cell))),(positive)).
#modeo(1,true(control(var(player))),(positive)).
#modeo(1,next(control(var(player))),(positive)).
#weight(-1).
#weight(1).
#maxp(2).
#maxv(5).

% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(has(P,V3)), true(control(P)).[-2@2]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(free(V3)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V3)), next(free(V2)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V3)), next(has(P,V2)), next(free(V1)), next(control(P)).[1@1]


#pos(e0,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). does(b,mark(cell(1,3))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(a)). true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e7,{}, {}, {
 true(control(a)). true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e6,e7).