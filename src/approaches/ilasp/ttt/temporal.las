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

#modeo(3,next(has(var(player),var(cell))),(positive)).
#modeo(1,in_line(var(cell),var(cell),var(cell)),(positive)).
#modeo(1,next(free(var(cell))),(positive)).
#modeo(1,next(control(var(player))),(positive)).
#weight(-1).
#weight(1).
#maxp(2).
#maxv(4).

% Expected hypothesis
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(has(P,V3)).[-1@1]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(free(V3)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V3)), next(free(V2)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V3)), next(has(P,V2)), next(free(V1)), next(control(P)).[1@1]

#pos(e0,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(1,3))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e7,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e9,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#pos(e11,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e13,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e15,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e17,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e19,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e21,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e23,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e25,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e27,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e29,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e31,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e33,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e35,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e37,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e39,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e41,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e43,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e45,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#pos(e47,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e49,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,3))). 
}).
#pos(e51,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e53,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e55,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e57,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e59,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e61,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e63,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e65,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e67,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,2))). 
}).
#pos(e69,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(b)). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e71,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e73,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e72,e73).

#pos(e74,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e75,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e74,e75).

#pos(e76,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e77,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e76,e77).

#pos(e78,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e79,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e78,e79).

#pos(e80,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e81,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e80,e81).

#pos(e82,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e83,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e82,e83).

#pos(e84,{}, {}, {
 true(control(a)). true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e85,{}, {}, {
 true(control(a)). true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e84,e85).