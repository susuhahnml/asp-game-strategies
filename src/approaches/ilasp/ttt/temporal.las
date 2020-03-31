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
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e7,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e9,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e11,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e13,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e15,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e17,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e19,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e21,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e23,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e25,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e27,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e29,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e31,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e33,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e35,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e37,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e39,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e41,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e43,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e45,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e47,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e49,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e51,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e53,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e55,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e57,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e59,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e61,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e63,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e65,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e67,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e69,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e71,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e73,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e72,e73).

#pos(e74,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e75,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e74,e75).

#pos(e76,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e77,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e76,e77).

#pos(e78,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e79,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e78,e79).

#pos(e80,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e81,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e80,e81).

#pos(e82,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e83,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e82,e83).

#pos(e84,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e85,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e84,e85).

#pos(e86,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e87,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e86,e87).

#pos(e88,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e89,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e88,e89).

#pos(e90,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e91,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e90,e91).

#pos(e92,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e93,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e92,e93).

#pos(e94,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e95,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e94,e95).

#pos(e96,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e97,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e96,e97).

#pos(e98,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e99,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e98,e99).

#pos(e100,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e101,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e100,e101).

#pos(e102,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e103,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e102,e103).

#pos(e104,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#pos(e105,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e104,e105).

#pos(e106,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e107,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e106,e107).

#pos(e108,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e109,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e108,e109).

#pos(e110,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e111,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e110,e111).

#pos(e112,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e113,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e112,e113).

#pos(e114,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e115,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e114,e115).

#pos(e116,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e117,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e116,e117).

#pos(e118,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e119,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e118,e119).

#pos(e120,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e121,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e120,e121).

#pos(e122,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#pos(e123,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e122,e123).

#pos(e124,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#pos(e125,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e124,e125).

#pos(e126,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e127,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e126,e127).

#pos(e128,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e129,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e128,e129).

#pos(e130,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e131,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e130,e131).

#pos(e132,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e133,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e132,e133).

#pos(e134,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e135,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e134,e135).

#pos(e136,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e137,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e136,e137).

#pos(e138,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e139,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e138,e139).

#pos(e140,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#pos(e141,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e140,e141).

#pos(e142,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e143,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e142,e143).

#pos(e144,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e145,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e144,e145).

#pos(e146,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e147,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e146,e147).

#pos(e148,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e149,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e148,e149).

#pos(e150,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e151,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e150,e151).

#pos(e152,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#pos(e153,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e152,e153).

#pos(e154,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e155,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e154,e155).

#pos(e156,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e157,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e156,e157).

#pos(e158,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e159,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e158,e159).

#pos(e160,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#pos(e161,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e160,e161).

#pos(e162,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e163,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e162,e163).

#pos(e164,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#pos(e165,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e164,e165).

#pos(e166,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e167,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e166,e167).

#pos(e168,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e169,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e168,e169).

#pos(e170,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e171,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e170,e171).

#pos(e172,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#pos(e173,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e172,e173).

#pos(e174,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#pos(e175,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e174,e175).

#pos(e176,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e177,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e176,e177).

#pos(e178,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e179,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e178,e179).

#pos(e180,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#pos(e181,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e180,e181).

#pos(e182,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e183,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e182,e183).

#pos(e184,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e185,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e184,e185).

#pos(e186,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e187,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e186,e187).

#pos(e188,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e189,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e188,e189).

#pos(e190,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e191,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e190,e191).

#pos(e192,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e193,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e192,e193).

#pos(e194,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e195,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e194,e195).

#pos(e196,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e197,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e196,e197).

#pos(e198,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e199,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e198,e199).

#pos(e200,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e201,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e200,e201).

#pos(e202,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e203,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e202,e203).

#pos(e204,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e205,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e204,e205).

#pos(e206,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e207,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e206,e207).

#pos(e208,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e209,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e208,e209).

#pos(e210,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e211,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e210,e211).

#pos(e212,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e213,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e212,e213).

#pos(e214,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e215,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e214,e215).

#pos(e216,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e217,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e216,e217).

#pos(e218,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e219,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e218,e219).

#pos(e220,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e221,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e220,e221).

#pos(e222,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e223,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e222,e223).

#pos(e224,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e225,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e224,e225).

#pos(e226,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#pos(e227,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e226,e227).

#pos(e228,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e229,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e228,e229).

#pos(e230,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e231,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e230,e231).

#pos(e232,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e233,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e232,e233).

#pos(e234,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e235,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e234,e235).

#pos(e236,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#pos(e237,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e236,e237).

#pos(e238,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e239,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e238,e239).

#pos(e240,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e241,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e240,e241).

#pos(e242,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e243,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e242,e243).

#pos(e244,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e245,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e244,e245).

#pos(e246,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e247,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e246,e247).

#pos(e248,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e249,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e248,e249).

#pos(e250,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e251,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e250,e251).

#pos(e252,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e253,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e252,e253).

#pos(e254,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e255,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e254,e255).

#pos(e256,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e257,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e256,e257).

#pos(e258,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e259,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e258,e259).

#pos(e260,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e261,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e260,e261).

#pos(e262,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e263,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e262,e263).

#pos(e264,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e265,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e264,e265).

#pos(e266,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e267,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e266,e267).

#pos(e268,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e269,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e268,e269).

#pos(e270,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e271,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e270,e271).

#pos(e272,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e273,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e272,e273).

#pos(e274,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e275,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e274,e275).

#pos(e276,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e277,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e276,e277).

#pos(e278,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e279,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e278,e279).

#pos(e280,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e281,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e280,e281).

#pos(e282,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e283,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e282,e283).

#pos(e284,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e285,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e284,e285).

#pos(e286,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e287,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e286,e287).

#pos(e288,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e289,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e288,e289).

#pos(e290,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#pos(e291,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e290,e291).

#pos(e292,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e293,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e292,e293).

#pos(e294,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e295,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e294,e295).

#pos(e296,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e297,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e296,e297).

#pos(e298,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e299,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e298,e299).

#pos(e300,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e301,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e300,e301).

#pos(e302,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e303,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e302,e303).

#pos(e304,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e305,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e304,e305).

#pos(e306,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e307,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e306,e307).

#pos(e308,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e309,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e308,e309).

#pos(e310,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e311,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e310,e311).

#pos(e312,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e313,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e312,e313).

#pos(e314,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#pos(e315,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e314,e315).

#pos(e316,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#pos(e317,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e316,e317).

#pos(e318,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#pos(e319,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e318,e319).

#pos(e320,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e321,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e320,e321).

#pos(e322,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e323,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e322,e323).

#pos(e324,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e325,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e324,e325).

#pos(e326,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e327,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e326,e327).

#pos(e328,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e329,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e328,e329).

#pos(e330,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e331,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e330,e331).

#pos(e332,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e333,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e332,e333).

#pos(e334,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e335,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e334,e335).

#pos(e336,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e337,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e336,e337).

#pos(e338,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e339,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e338,e339).

#pos(e340,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e341,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e340,e341).

#pos(e342,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e343,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e342,e343).

#pos(e344,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e345,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e344,e345).

#pos(e346,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e347,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e346,e347).

#pos(e348,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e349,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e348,e349).

#pos(e350,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e351,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e350,e351).

#pos(e352,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#pos(e353,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e352,e353).

#pos(e354,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e355,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e354,e355).

#pos(e356,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e357,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e356,e357).

#pos(e358,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e359,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e358,e359).

#pos(e360,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e361,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e360,e361).

#pos(e362,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e363,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e362,e363).

#pos(e364,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e365,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e364,e365).

#pos(e366,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e367,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e366,e367).

#pos(e368,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e369,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e368,e369).

#pos(e370,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e371,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e370,e371).

#pos(e372,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e373,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e372,e373).

#pos(e374,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e375,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e374,e375).

#pos(e376,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e377,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e376,e377).

#pos(e378,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e379,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e378,e379).

#pos(e380,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e381,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e380,e381).

#pos(e382,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e383,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e382,e383).

#pos(e384,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e385,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e384,e385).

#pos(e386,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e387,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e386,e387).

#pos(e388,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e389,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e388,e389).

#pos(e390,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e391,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e390,e391).

#pos(e392,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e393,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e392,e393).

#pos(e394,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e395,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e394,e395).

#pos(e396,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e397,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e396,e397).

#pos(e398,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e399,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e398,e399).

#pos(e400,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e401,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e400,e401).

#pos(e402,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e403,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e402,e403).

#pos(e404,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#pos(e405,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e404,e405).

#pos(e406,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e407,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e406,e407).

#pos(e408,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e409,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e408,e409).

#pos(e410,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e411,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e410,e411).

#pos(e412,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e413,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e412,e413).

#pos(e414,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#pos(e415,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e414,e415).

#pos(e416,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e417,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e416,e417).

#pos(e418,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e419,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e418,e419).

#pos(e420,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#pos(e421,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e420,e421).

#pos(e422,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e423,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e422,e423).

#pos(e424,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e425,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e424,e425).

#pos(e426,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e427,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e426,e427).

#pos(e428,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e429,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e428,e429).

#pos(e430,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e431,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e430,e431).

#pos(e432,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e433,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e432,e433).

#pos(e434,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e435,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e434,e435).

#pos(e436,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e437,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e436,e437).

#pos(e438,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e439,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e438,e439).

#pos(e440,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e441,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e440,e441).

#pos(e442,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e443,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e442,e443).

#pos(e444,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e445,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e444,e445).

#pos(e446,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e447,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e446,e447).

#pos(e448,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e449,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e448,e449).

#pos(e450,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e451,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e450,e451).

#pos(e452,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e453,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e452,e453).

#pos(e454,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e455,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e454,e455).

#pos(e456,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e457,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e456,e457).

#pos(e458,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#pos(e459,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e458,e459).

#pos(e460,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e461,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e460,e461).

#pos(e462,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e463,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e462,e463).

#pos(e464,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e465,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e464,e465).

#pos(e466,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e467,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e466,e467).

#pos(e468,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e469,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e468,e469).

#pos(e470,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e471,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e470,e471).

#pos(e472,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#pos(e473,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e472,e473).

#pos(e474,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e475,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e474,e475).

#pos(e476,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e477,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e476,e477).

#pos(e478,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e479,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e478,e479).

#pos(e480,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e481,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e480,e481).

#pos(e482,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e483,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e482,e483).

#pos(e484,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e485,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e484,e485).

#pos(e486,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e487,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e486,e487).

#pos(e488,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e489,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e488,e489).

#pos(e490,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e491,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e490,e491).

#pos(e492,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e493,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e492,e493).

#pos(e494,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e495,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e494,e495).

#pos(e496,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e497,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e496,e497).

#pos(e498,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#pos(e499,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e498,e499).

#pos(e500,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e501,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e500,e501).

#pos(e502,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e503,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e502,e503).

#pos(e504,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#pos(e505,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e504,e505).

#pos(e506,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e507,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e506,e507).

#pos(e508,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e509,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e508,e509).

#pos(e510,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e511,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e510,e511).

#pos(e512,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e513,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e512,e513).

#pos(e514,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e515,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e514,e515).

#pos(e516,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e517,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e516,e517).

#pos(e518,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#pos(e519,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e518,e519).

#pos(e520,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e521,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e520,e521).

#pos(e522,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e523,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e522,e523).

#pos(e524,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e525,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e524,e525).

#pos(e526,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e527,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e526,e527).

#pos(e528,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e529,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e528,e529).

#pos(e530,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e531,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e530,e531).

#pos(e532,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e533,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e532,e533).

#pos(e534,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e535,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e534,e535).

#pos(e536,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e537,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e536,e537).

#pos(e538,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e539,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e538,e539).

#pos(e540,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e541,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e540,e541).

#pos(e542,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e543,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e542,e543).

#pos(e544,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e545,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e544,e545).

#pos(e546,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e547,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e546,e547).

#pos(e548,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e549,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e548,e549).

#pos(e550,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e551,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e550,e551).

#pos(e552,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e553,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e552,e553).

#pos(e554,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e555,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e554,e555).

#pos(e556,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e557,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e556,e557).

#pos(e558,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#pos(e559,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e558,e559).

#pos(e560,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e561,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e560,e561).

#pos(e562,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e563,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e562,e563).

#pos(e564,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e565,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e564,e565).

#pos(e566,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e567,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e566,e567).

#pos(e568,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e569,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e568,e569).

#pos(e570,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e571,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e570,e571).

#pos(e572,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e573,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e572,e573).

#pos(e574,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e575,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e574,e575).

#pos(e576,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e577,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e576,e577).

#pos(e578,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e579,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e578,e579).

#pos(e580,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#pos(e581,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e580,e581).

#pos(e582,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e583,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e582,e583).

#pos(e584,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#pos(e585,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e584,e585).

#pos(e586,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e587,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e586,e587).

#pos(e588,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#pos(e589,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e588,e589).

#pos(e590,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e591,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e590,e591).

#pos(e592,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e593,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e592,e593).

#pos(e594,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e595,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e594,e595).

#pos(e596,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e597,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e596,e597).

#pos(e598,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e599,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e598,e599).

#pos(e600,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e601,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e600,e601).

#pos(e602,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e603,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e602,e603).

#pos(e604,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e605,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e604,e605).

#pos(e606,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#pos(e607,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e606,e607).

#pos(e608,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e609,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e608,e609).

#pos(e610,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e611,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e610,e611).

#pos(e612,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e613,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e612,e613).

#pos(e614,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e615,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e614,e615).

#pos(e616,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#pos(e617,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e616,e617).

#pos(e618,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e619,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e618,e619).

#pos(e620,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e621,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e620,e621).

#pos(e622,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e623,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e622,e623).

#pos(e624,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e625,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e624,e625).

#pos(e626,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e627,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e626,e627).

#pos(e628,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e629,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e628,e629).

#pos(e630,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e631,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e630,e631).

#pos(e632,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#pos(e633,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e632,e633).

#pos(e634,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e635,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e634,e635).

#pos(e636,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e637,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e636,e637).

#pos(e638,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e639,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e638,e639).

#pos(e640,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e641,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e640,e641).

#pos(e642,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e643,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e642,e643).

#pos(e644,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e645,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e644,e645).

#pos(e646,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e647,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e646,e647).

#pos(e648,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e649,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e648,e649).

#pos(e650,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e651,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e650,e651).

#pos(e652,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e653,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e652,e653).

#pos(e654,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e655,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e654,e655).

#pos(e656,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e657,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e656,e657).

#pos(e658,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e659,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e658,e659).

#pos(e660,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e661,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e660,e661).

#pos(e662,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#pos(e663,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e662,e663).

#pos(e664,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#pos(e665,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e664,e665).

#pos(e666,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#pos(e667,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e666,e667).

#pos(e668,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#pos(e669,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e668,e669).

#pos(e670,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#pos(e671,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e670,e671).

#pos(e672,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e673,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e672,e673).

#pos(e674,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e675,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e674,e675).

#pos(e676,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e677,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e676,e677).

#pos(e678,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e679,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e678,e679).

#pos(e680,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e681,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e680,e681).

#pos(e682,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e683,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e682,e683).

#pos(e684,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e685,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e684,e685).

#pos(e686,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e687,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e686,e687).

#pos(e688,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e689,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e688,e689).

#pos(e690,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e691,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e690,e691).

#pos(e692,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e693,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e692,e693).

#pos(e694,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e695,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e694,e695).

#pos(e696,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e697,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e696,e697).

#pos(e698,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e699,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e698,e699).

#pos(e700,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e701,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e700,e701).

#pos(e702,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e703,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e702,e703).

#pos(e704,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e705,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e704,e705).

#pos(e706,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e707,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e706,e707).

#pos(e708,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e709,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e708,e709).

#pos(e710,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e711,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e710,e711).

#pos(e712,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e713,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e712,e713).

#pos(e714,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e715,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e714,e715).

#pos(e716,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e717,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e716,e717).

#pos(e718,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e719,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e718,e719).

#pos(e720,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e721,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e720,e721).

#pos(e722,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#pos(e723,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e722,e723).

#pos(e724,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#pos(e725,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e724,e725).

#pos(e726,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#pos(e727,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e726,e727).

#pos(e728,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#pos(e729,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e728,e729).

#pos(e730,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#pos(e731,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e730,e731).

#pos(e732,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e733,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e732,e733).

#pos(e734,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e735,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e734,e735).

#pos(e736,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e737,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e736,e737).

#pos(e738,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e739,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e738,e739).

#pos(e740,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e741,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e740,e741).

#pos(e742,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#pos(e743,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e742,e743).

#pos(e744,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e745,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e744,e745).

#pos(e746,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e747,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e746,e747).

#pos(e748,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e749,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e748,e749).

#pos(e750,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e751,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e750,e751).

#pos(e752,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e753,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e752,e753).

#pos(e754,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e755,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e754,e755).

#pos(e756,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e757,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e756,e757).

#pos(e758,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#pos(e759,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e758,e759).

#pos(e760,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#pos(e761,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e760,e761).

#pos(e762,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e763,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e762,e763).

#pos(e764,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e765,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e764,e765).

#pos(e766,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e767,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e766,e767).

#pos(e768,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e769,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e768,e769).

#pos(e770,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#pos(e771,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e770,e771).

#pos(e772,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#pos(e773,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e772,e773).

#pos(e774,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#pos(e775,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e774,e775).

#pos(e776,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#pos(e777,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e776,e777).

#pos(e778,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#pos(e779,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e778,e779).

#pos(e780,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e781,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e780,e781).

#pos(e782,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e783,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e782,e783).

#pos(e784,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e785,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e784,e785).

#pos(e786,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e787,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e786,e787).

#pos(e788,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#pos(e789,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e788,e789).

#pos(e790,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e791,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e790,e791).

#pos(e792,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e793,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e792,e793).

#pos(e794,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e795,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e794,e795).

#pos(e796,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e797,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e796,e797).

#pos(e798,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e799,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e798,e799).

#pos(e800,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e801,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e800,e801).

#pos(e802,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e803,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e802,e803).

#pos(e804,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e805,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e804,e805).

#pos(e806,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e807,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e806,e807).

#pos(e808,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e809,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e808,e809).

#pos(e810,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e811,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e810,e811).

#pos(e812,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e813,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e812,e813).

#pos(e814,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e815,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e814,e815).

#pos(e816,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e817,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e816,e817).

#pos(e818,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e819,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e818,e819).

#pos(e820,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e821,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e820,e821).

#pos(e822,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e823,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e822,e823).

#pos(e824,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e825,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e824,e825).

#pos(e826,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e827,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e826,e827).

#pos(e828,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e829,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e828,e829).

#pos(e830,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e831,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e830,e831).

#pos(e832,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e833,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e832,e833).

#pos(e834,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e835,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e834,e835).

#pos(e836,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#pos(e837,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e836,e837).

#pos(e838,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e839,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e838,e839).

#pos(e840,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e841,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e840,e841).

#pos(e842,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e843,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e842,e843).

#pos(e844,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e845,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e844,e845).

#pos(e846,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e847,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e846,e847).

#pos(e848,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e849,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e848,e849).

#pos(e850,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e851,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e850,e851).

#pos(e852,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#pos(e853,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(1,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e852,e853).

#pos(e854,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#pos(e855,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e854,e855).

#pos(e856,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#pos(e857,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e856,e857).

#pos(e858,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e859,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e858,e859).

#pos(e860,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e861,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e860,e861).

#pos(e862,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#pos(e863,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e862,e863).

#pos(e864,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e865,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e864,e865).

#pos(e866,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e867,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e866,e867).

#pos(e868,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e869,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e868,e869).

#pos(e870,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#pos(e871,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e870,e871).

#pos(e872,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#pos(e873,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e872,e873).

#pos(e874,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e875,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e874,e875).

#pos(e876,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e877,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e876,e877).

#pos(e878,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e879,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e878,e879).

#pos(e880,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e881,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e880,e881).

#pos(e882,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e883,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e882,e883).

#pos(e884,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e885,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e884,e885).

#pos(e886,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e887,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e886,e887).

#pos(e888,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e889,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e888,e889).

#pos(e890,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e891,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e890,e891).

#pos(e892,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e893,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e892,e893).

#pos(e894,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#pos(e895,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e894,e895).

#pos(e896,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e897,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e896,e897).

#pos(e898,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e899,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e898,e899).

#pos(e900,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e901,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e900,e901).

#pos(e902,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e903,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e902,e903).

#pos(e904,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e905,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e904,e905).

#pos(e906,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e907,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e906,e907).

#pos(e908,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e909,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e908,e909).

#pos(e910,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e911,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e910,e911).

#pos(e912,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e913,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e912,e913).

#pos(e914,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e915,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e914,e915).

#pos(e916,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e917,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e916,e917).

#pos(e918,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e919,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e918,e919).

#pos(e920,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#pos(e921,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e920,e921).

#pos(e922,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e923,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e922,e923).

#pos(e924,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e925,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e924,e925).

#pos(e926,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e927,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e926,e927).

#pos(e928,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e929,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e928,e929).

#pos(e930,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e931,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e930,e931).

#pos(e932,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#pos(e933,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e932,e933).

#pos(e934,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e935,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e934,e935).

#pos(e936,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e937,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e936,e937).

#pos(e938,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e939,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e938,e939).

#pos(e940,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e941,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e940,e941).

#pos(e942,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e943,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e942,e943).

#pos(e944,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e945,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e944,e945).

#pos(e946,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e947,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e946,e947).

#pos(e948,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#pos(e949,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e948,e949).

#pos(e950,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#pos(e951,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e950,e951).

#pos(e952,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e953,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e952,e953).

#pos(e954,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e955,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e954,e955).

#pos(e956,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e957,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e956,e957).

#pos(e958,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e959,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e958,e959).

#pos(e960,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#pos(e961,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e960,e961).

#pos(e962,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e963,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e962,e963).

#pos(e964,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e965,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e964,e965).

#pos(e966,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e967,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e966,e967).

#pos(e968,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e969,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e968,e969).

#pos(e970,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e971,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e970,e971).

#pos(e972,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e973,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e972,e973).

#pos(e974,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e975,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e974,e975).

#pos(e976,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#pos(e977,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e976,e977).

#pos(e978,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e979,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e978,e979).

#pos(e980,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e981,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e980,e981).

#pos(e982,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e983,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e982,e983).

#pos(e984,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#pos(e985,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e984,e985).

#pos(e986,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#pos(e987,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e986,e987).

#pos(e988,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e989,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e988,e989).

#pos(e990,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#pos(e991,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e990,e991).

#pos(e992,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e993,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e992,e993).

#pos(e994,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e995,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e994,e995).

#pos(e996,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e997,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e996,e997).

#pos(e998,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e999,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e998,e999).

#pos(e1000,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1001,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1000,e1001).

#pos(e1002,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1003,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1002,e1003).

#pos(e1004,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1005,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1004,e1005).

#pos(e1006,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1007,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1006,e1007).

#pos(e1008,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1009,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1008,e1009).

#pos(e1010,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1011,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1010,e1011).

#pos(e1012,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1013,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1012,e1013).

#pos(e1014,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1015,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1014,e1015).

#pos(e1016,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1017,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1016,e1017).

#pos(e1018,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1019,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1018,e1019).

#pos(e1020,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1021,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1020,e1021).

#pos(e1022,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e1023,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1022,e1023).

#pos(e1024,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e1025,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1024,e1025).

#pos(e1026,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1027,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1026,e1027).

#pos(e1028,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1029,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1028,e1029).

#pos(e1030,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1031,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1030,e1031).

#pos(e1032,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1033,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1032,e1033).

#pos(e1034,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1035,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1034,e1035).

#pos(e1036,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1037,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1036,e1037).

#pos(e1038,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1039,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1038,e1039).

#pos(e1040,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1041,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1040,e1041).

#pos(e1042,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1043,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1042,e1043).

#pos(e1044,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1045,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1044,e1045).

#pos(e1046,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1047,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1046,e1047).

#pos(e1048,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1049,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1048,e1049).

#pos(e1050,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1051,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1050,e1051).

#pos(e1052,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1053,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1052,e1053).

#pos(e1054,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1055,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1054,e1055).

#pos(e1056,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1057,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1056,e1057).

#pos(e1058,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1059,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1058,e1059).

#pos(e1060,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1061,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1060,e1061).

#pos(e1062,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1063,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1062,e1063).

#pos(e1064,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1065,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1064,e1065).

#pos(e1066,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1067,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1066,e1067).

#pos(e1068,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1069,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1068,e1069).

#pos(e1070,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1071,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1070,e1071).

#pos(e1072,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1073,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1072,e1073).

#pos(e1074,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1075,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1074,e1075).

#pos(e1076,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1077,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1076,e1077).

#pos(e1078,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1079,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1078,e1079).

#pos(e1080,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1081,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1080,e1081).

#pos(e1082,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1083,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1082,e1083).

#pos(e1084,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1085,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1084,e1085).

#pos(e1086,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1087,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1086,e1087).

#pos(e1088,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1089,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1088,e1089).

#pos(e1090,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1091,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1090,e1091).

#pos(e1092,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1093,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1092,e1093).

#pos(e1094,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1095,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1094,e1095).

#pos(e1096,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1097,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1096,e1097).

#pos(e1098,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1099,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1098,e1099).

#pos(e1100,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1101,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1100,e1101).

#pos(e1102,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1103,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1102,e1103).

#pos(e1104,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1105,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1104,e1105).

#pos(e1106,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1107,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1106,e1107).

#pos(e1108,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1109,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1108,e1109).

#pos(e1110,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1111,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1110,e1111).

#pos(e1112,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1113,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1112,e1113).

#pos(e1114,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1115,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1114,e1115).

#pos(e1116,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1117,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1116,e1117).

#pos(e1118,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1119,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1118,e1119).

#pos(e1120,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1121,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1120,e1121).

#pos(e1122,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1123,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1122,e1123).

#pos(e1124,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1125,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1124,e1125).

#pos(e1126,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1127,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1126,e1127).

#pos(e1128,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1129,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1128,e1129).

#pos(e1130,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1131,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1130,e1131).

#pos(e1132,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1133,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1132,e1133).

#pos(e1134,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1135,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1134,e1135).

#pos(e1136,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1137,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1136,e1137).

#pos(e1138,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1139,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1138,e1139).

#pos(e1140,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1141,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1140,e1141).

#pos(e1142,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1143,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1142,e1143).

#pos(e1144,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1145,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1144,e1145).

#pos(e1146,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1147,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1146,e1147).

#pos(e1148,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1149,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1148,e1149).

#pos(e1150,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1151,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1150,e1151).

#pos(e1152,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1153,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1152,e1153).

#pos(e1154,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1155,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1154,e1155).

#pos(e1156,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1157,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1156,e1157).

#pos(e1158,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1159,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1158,e1159).

#pos(e1160,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1161,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1160,e1161).

#pos(e1162,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1163,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1162,e1163).

#pos(e1164,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1165,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1164,e1165).

#pos(e1166,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1167,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1166,e1167).

#pos(e1168,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1169,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1168,e1169).

#pos(e1170,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1171,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1170,e1171).

#pos(e1172,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#pos(e1173,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1172,e1173).

#pos(e1174,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1175,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1174,e1175).

#pos(e1176,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1177,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1176,e1177).

#pos(e1178,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1179,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1178,e1179).

#pos(e1180,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1181,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1180,e1181).

#pos(e1182,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1183,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1182,e1183).

#pos(e1184,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1185,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1184,e1185).

#pos(e1186,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1187,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1186,e1187).

#pos(e1188,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1189,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1188,e1189).

#pos(e1190,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1191,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1190,e1191).

#pos(e1192,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1193,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1192,e1193).

#pos(e1194,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1195,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1194,e1195).

#pos(e1196,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1197,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1196,e1197).

#pos(e1198,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1199,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1198,e1199).

#pos(e1200,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1201,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1200,e1201).

#pos(e1202,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1203,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1202,e1203).

#pos(e1204,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1205,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1204,e1205).

#pos(e1206,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1207,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1206,e1207).

#pos(e1208,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1209,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1208,e1209).

#pos(e1210,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1211,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1210,e1211).

#pos(e1212,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1213,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1212,e1213).

#pos(e1214,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1215,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1214,e1215).

#pos(e1216,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1217,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1216,e1217).

#pos(e1218,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e1219,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1218,e1219).

#pos(e1220,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e1221,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1220,e1221).

#pos(e1222,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e1223,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1222,e1223).

#pos(e1224,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1225,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1224,e1225).

#pos(e1226,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1227,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1226,e1227).

#pos(e1228,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1229,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1228,e1229).

#pos(e1230,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1231,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1230,e1231).

#pos(e1232,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1233,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1232,e1233).

#pos(e1234,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1235,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1234,e1235).

#pos(e1236,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1237,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1236,e1237).

#pos(e1238,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). does(b,mark(cell(2,2))). 
}).
#pos(e1239,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1238,e1239).

#pos(e1240,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1241,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1240,e1241).

#pos(e1242,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1243,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1242,e1243).

#pos(e1244,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1245,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1244,e1245).

#pos(e1246,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1247,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1246,e1247).

#pos(e1248,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1249,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1248,e1249).

#pos(e1250,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1251,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1250,e1251).

#pos(e1252,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1253,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1252,e1253).

#pos(e1254,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1255,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1254,e1255).

#pos(e1256,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1257,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1256,e1257).

#pos(e1258,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1259,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1258,e1259).

#pos(e1260,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#pos(e1261,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1260,e1261).

#pos(e1262,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#pos(e1263,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1262,e1263).

#pos(e1264,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1265,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1264,e1265).

#pos(e1266,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1267,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1266,e1267).

#pos(e1268,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1269,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1268,e1269).

#pos(e1270,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1271,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1270,e1271).

#pos(e1272,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1273,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1272,e1273).

#pos(e1274,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1275,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1274,e1275).

#pos(e1276,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1277,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1276,e1277).

#pos(e1278,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1279,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1278,e1279).

#pos(e1280,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1281,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1280,e1281).

#pos(e1282,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1283,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1282,e1283).

#pos(e1284,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1285,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1284,e1285).

#pos(e1286,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1287,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1286,e1287).

#pos(e1288,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1289,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1288,e1289).

#pos(e1290,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1291,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1290,e1291).

#pos(e1292,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1293,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1292,e1293).

#pos(e1294,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1295,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1294,e1295).

#pos(e1296,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1297,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1296,e1297).

#pos(e1298,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1299,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1298,e1299).

#pos(e1300,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1301,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1300,e1301).

#pos(e1302,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1303,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1302,e1303).

#pos(e1304,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1305,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1304,e1305).

#pos(e1306,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1307,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1306,e1307).

#pos(e1308,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1309,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1308,e1309).

#pos(e1310,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1311,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1310,e1311).

#pos(e1312,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1313,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1312,e1313).

#pos(e1314,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1315,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1314,e1315).

#pos(e1316,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1317,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1316,e1317).

#pos(e1318,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1319,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1318,e1319).

#pos(e1320,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1321,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1320,e1321).

#pos(e1322,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1323,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1322,e1323).

#pos(e1324,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1325,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1324,e1325).

#pos(e1326,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1327,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1326,e1327).

#pos(e1328,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1329,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1328,e1329).

#pos(e1330,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1331,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1330,e1331).

#pos(e1332,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1333,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1332,e1333).

#pos(e1334,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1335,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1334,e1335).

#pos(e1336,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1337,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1336,e1337).

#pos(e1338,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1339,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1338,e1339).

#pos(e1340,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1341,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1340,e1341).

#pos(e1342,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1343,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1342,e1343).

#pos(e1344,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1345,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1344,e1345).

#pos(e1346,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1347,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1346,e1347).

#pos(e1348,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e1349,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1348,e1349).

#pos(e1350,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1351,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1350,e1351).

#pos(e1352,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1353,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1352,e1353).

#pos(e1354,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1355,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1354,e1355).

#pos(e1356,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1357,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1356,e1357).

#pos(e1358,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). does(b,mark(cell(2,3))). 
}).
#pos(e1359,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1358,e1359).

#pos(e1360,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1361,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1360,e1361).

#pos(e1362,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1363,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1362,e1363).

#pos(e1364,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1365,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1364,e1365).

#pos(e1366,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e1367,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1366,e1367).

#pos(e1368,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1369,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1368,e1369).

#pos(e1370,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1371,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1370,e1371).

#pos(e1372,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1373,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1372,e1373).

#pos(e1374,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1375,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1374,e1375).

#pos(e1376,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1377,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1376,e1377).

#pos(e1378,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1379,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1378,e1379).

#pos(e1380,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1381,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1380,e1381).

#pos(e1382,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1383,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1382,e1383).

#pos(e1384,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1385,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1384,e1385).

#pos(e1386,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1387,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1386,e1387).

#pos(e1388,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1389,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1388,e1389).

#pos(e1390,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1391,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1390,e1391).

#pos(e1392,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1393,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1392,e1393).

#pos(e1394,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1395,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1394,e1395).

#pos(e1396,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1397,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1396,e1397).

#pos(e1398,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1399,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1398,e1399).

#pos(e1400,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1401,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1400,e1401).

#pos(e1402,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1403,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1402,e1403).

#pos(e1404,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1405,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1404,e1405).

#pos(e1406,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1407,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1406,e1407).

#pos(e1408,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1409,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1408,e1409).

#pos(e1410,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1411,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1410,e1411).

#pos(e1412,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1413,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1412,e1413).

#pos(e1414,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e1415,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1414,e1415).

#pos(e1416,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1417,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1416,e1417).

#pos(e1418,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1419,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1418,e1419).

#pos(e1420,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1421,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1420,e1421).

#pos(e1422,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(2,2))). 
}).
#pos(e1423,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1422,e1423).

#pos(e1424,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1425,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1424,e1425).

#pos(e1426,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1427,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1426,e1427).

#pos(e1428,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1429,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1428,e1429).

#pos(e1430,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1431,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1430,e1431).

#pos(e1432,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1433,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1432,e1433).

#pos(e1434,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1435,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1434,e1435).

#pos(e1436,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1437,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1436,e1437).

#pos(e1438,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1439,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1438,e1439).

#pos(e1440,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1441,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1440,e1441).

#pos(e1442,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1443,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1442,e1443).

#pos(e1444,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#pos(e1445,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1444,e1445).

#pos(e1446,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1447,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1446,e1447).

#pos(e1448,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1449,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1448,e1449).

#pos(e1450,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1451,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1450,e1451).

#pos(e1452,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1453,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1452,e1453).

#pos(e1454,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1455,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1454,e1455).

#pos(e1456,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1457,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1456,e1457).

#pos(e1458,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1459,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1458,e1459).

#pos(e1460,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1461,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1460,e1461).

#pos(e1462,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1463,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1462,e1463).

#pos(e1464,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1465,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1464,e1465).

#pos(e1466,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1467,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1466,e1467).

#pos(e1468,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1469,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1468,e1469).

#pos(e1470,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1471,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1470,e1471).

#pos(e1472,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1473,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1472,e1473).

#pos(e1474,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1475,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1474,e1475).

#pos(e1476,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1477,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1476,e1477).

#pos(e1478,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1479,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1478,e1479).

#pos(e1480,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1481,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1480,e1481).

#pos(e1482,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1483,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1482,e1483).

#pos(e1484,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1485,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1484,e1485).

#pos(e1486,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1487,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1486,e1487).

#pos(e1488,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1489,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1488,e1489).

#pos(e1490,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1491,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1490,e1491).

#pos(e1492,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1493,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1492,e1493).

#pos(e1494,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1495,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1494,e1495).

#pos(e1496,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1497,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1496,e1497).

#pos(e1498,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1499,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1498,e1499).

#pos(e1500,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1501,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1500,e1501).

#pos(e1502,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1503,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1502,e1503).

#pos(e1504,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1505,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1504,e1505).

#pos(e1506,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1507,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1506,e1507).

#pos(e1508,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e1509,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1508,e1509).

#pos(e1510,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1511,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1510,e1511).

#pos(e1512,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e1513,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1512,e1513).

#pos(e1514,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1515,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1514,e1515).

#pos(e1516,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1517,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1516,e1517).

#pos(e1518,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1519,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1518,e1519).

#pos(e1520,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1521,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1520,e1521).

#pos(e1522,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1523,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1522,e1523).

#pos(e1524,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1525,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1524,e1525).

#pos(e1526,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1527,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1526,e1527).

#pos(e1528,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1529,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1528,e1529).

#pos(e1530,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1531,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1530,e1531).

#pos(e1532,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1533,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1532,e1533).

#pos(e1534,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#pos(e1535,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1534,e1535).

#pos(e1536,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1537,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1536,e1537).

#pos(e1538,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#pos(e1539,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1538,e1539).

#pos(e1540,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e1541,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1540,e1541).

#pos(e1542,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e1543,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1542,e1543).

#pos(e1544,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1545,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1544,e1545).

#pos(e1546,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1547,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1546,e1547).

#pos(e1548,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1549,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1548,e1549).

#pos(e1550,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1551,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1550,e1551).

#pos(e1552,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1553,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1552,e1553).

#pos(e1554,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1555,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1554,e1555).

#pos(e1556,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1557,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1556,e1557).

#pos(e1558,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e1559,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1558,e1559).

#pos(e1560,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1561,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1560,e1561).

#pos(e1562,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1563,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1562,e1563).

#pos(e1564,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1565,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1564,e1565).

#pos(e1566,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1567,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1566,e1567).

#pos(e1568,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1569,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1568,e1569).

#pos(e1570,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1571,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1570,e1571).

#pos(e1572,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#pos(e1573,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1572,e1573).

#pos(e1574,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1575,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1574,e1575).

#pos(e1576,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1577,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1576,e1577).

#pos(e1578,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1579,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1578,e1579).

#pos(e1580,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1581,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1580,e1581).

#pos(e1582,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1583,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1582,e1583).

#pos(e1584,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1585,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1584,e1585).

#pos(e1586,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1587,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1586,e1587).

#pos(e1588,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1589,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1588,e1589).

#pos(e1590,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e1591,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1590,e1591).

#pos(e1592,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1593,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1592,e1593).

#pos(e1594,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1595,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1594,e1595).

#pos(e1596,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1597,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1596,e1597).

#pos(e1598,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1599,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1598,e1599).

#pos(e1600,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1601,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1600,e1601).

#pos(e1602,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). does(b,mark(cell(2,2))). 
}).
#pos(e1603,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1602,e1603).

#pos(e1604,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e1605,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1604,e1605).

#pos(e1606,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#pos(e1607,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1606,e1607).

#pos(e1608,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1609,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1608,e1609).

#pos(e1610,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1611,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1610,e1611).

#pos(e1612,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1613,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1612,e1613).

#pos(e1614,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1615,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1614,e1615).

#pos(e1616,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1617,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1616,e1617).

#pos(e1618,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e1619,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1618,e1619).

#pos(e1620,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1621,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1620,e1621).

#pos(e1622,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#pos(e1623,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1622,e1623).

#pos(e1624,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#pos(e1625,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1624,e1625).

#pos(e1626,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1627,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1626,e1627).

#pos(e1628,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1629,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1628,e1629).

#pos(e1630,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1631,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1630,e1631).

#pos(e1632,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1633,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1632,e1633).

#pos(e1634,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1635,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1634,e1635).

#pos(e1636,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1637,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1636,e1637).

#pos(e1638,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1639,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1638,e1639).

#pos(e1640,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1641,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1640,e1641).

#pos(e1642,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1643,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1642,e1643).

#pos(e1644,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#pos(e1645,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1644,e1645).

#pos(e1646,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1647,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1646,e1647).

#pos(e1648,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1649,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1648,e1649).

#pos(e1650,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1651,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1650,e1651).

#pos(e1652,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1653,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1652,e1653).

#pos(e1654,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1655,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1654,e1655).

#pos(e1656,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1657,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1656,e1657).

#pos(e1658,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e1659,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1658,e1659).

#pos(e1660,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e1661,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1660,e1661).

#pos(e1662,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1663,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1662,e1663).

#pos(e1664,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1665,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1664,e1665).

#pos(e1666,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1667,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1666,e1667).

#pos(e1668,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1669,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1668,e1669).

#pos(e1670,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1671,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1670,e1671).

#pos(e1672,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1673,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1672,e1673).

#pos(e1674,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1675,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1674,e1675).

#pos(e1676,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1677,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1676,e1677).

#pos(e1678,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1679,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1678,e1679).

#pos(e1680,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1681,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1680,e1681).

#pos(e1682,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1683,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1682,e1683).

#pos(e1684,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1685,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1684,e1685).

#pos(e1686,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). does(b,mark(cell(3,3))). 
}).
#pos(e1687,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1686,e1687).

#pos(e1688,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1689,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1688,e1689).

#pos(e1690,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1691,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1690,e1691).

#pos(e1692,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1693,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1692,e1693).

#pos(e1694,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1695,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1694,e1695).

#pos(e1696,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1697,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1696,e1697).

#pos(e1698,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#pos(e1699,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1698,e1699).

#pos(e1700,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1701,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1700,e1701).

#pos(e1702,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1703,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1702,e1703).

#pos(e1704,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1705,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1704,e1705).

#pos(e1706,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1707,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1706,e1707).

#pos(e1708,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1709,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1708,e1709).

#pos(e1710,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1711,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1710,e1711).

#pos(e1712,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1713,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1712,e1713).

#pos(e1714,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1715,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1714,e1715).

#pos(e1716,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1717,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1716,e1717).

#pos(e1718,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1719,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1718,e1719).

#pos(e1720,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1721,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1720,e1721).

#pos(e1722,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1723,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1722,e1723).

#pos(e1724,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1725,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1724,e1725).

#pos(e1726,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1727,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1726,e1727).

#pos(e1728,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1729,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1728,e1729).

#pos(e1730,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1731,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1730,e1731).

#pos(e1732,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#pos(e1733,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1732,e1733).

#pos(e1734,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e1735,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1734,e1735).

#pos(e1736,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e1737,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1736,e1737).

#pos(e1738,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1739,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e1738,e1739).

#pos(e1740,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1741,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1740,e1741).

#pos(e1742,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1743,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1742,e1743).

#pos(e1744,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#pos(e1745,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1744,e1745).

#pos(e1746,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1747,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1746,e1747).

#pos(e1748,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1749,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1748,e1749).

#pos(e1750,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1751,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1750,e1751).

#pos(e1752,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1753,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1752,e1753).

#pos(e1754,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1755,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1754,e1755).

#pos(e1756,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1757,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1756,e1757).

#pos(e1758,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1759,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1758,e1759).

#pos(e1760,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1761,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1760,e1761).

#pos(e1762,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1763,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1762,e1763).

#pos(e1764,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1765,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1764,e1765).

#pos(e1766,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1767,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1766,e1767).

#pos(e1768,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1769,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1768,e1769).

#pos(e1770,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1771,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1770,e1771).

#pos(e1772,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1773,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1772,e1773).

#pos(e1774,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1775,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1774,e1775).

#pos(e1776,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1777,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1776,e1777).

#pos(e1778,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#pos(e1779,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1778,e1779).

#pos(e1780,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1781,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1780,e1781).

#pos(e1782,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#pos(e1783,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1782,e1783).

#pos(e1784,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1785,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1784,e1785).

#pos(e1786,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1787,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1786,e1787).

#pos(e1788,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e1789,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1788,e1789).

#pos(e1790,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e1791,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1790,e1791).

#pos(e1792,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e1793,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1792,e1793).

#pos(e1794,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e1795,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1794,e1795).

#pos(e1796,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1797,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1796,e1797).

#pos(e1798,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1799,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1798,e1799).

#pos(e1800,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1801,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1800,e1801).

#pos(e1802,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,2))). 
}).
#pos(e1803,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e1802,e1803).

#pos(e1804,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1805,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1804,e1805).

#pos(e1806,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#pos(e1807,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1806,e1807).

#pos(e1808,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1809,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1808,e1809).

#pos(e1810,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1811,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1810,e1811).

#pos(e1812,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1813,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1812,e1813).

#pos(e1814,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1815,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1814,e1815).

#pos(e1816,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e1817,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1816,e1817).

#pos(e1818,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,3))). 
}).
#pos(e1819,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1818,e1819).

#pos(e1820,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1821,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1820,e1821).

#pos(e1822,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1823,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1822,e1823).

#pos(e1824,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1825,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1824,e1825).

#pos(e1826,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1827,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1826,e1827).

#pos(e1828,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(3,3))). 
}).
#pos(e1829,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1828,e1829).

#pos(e1830,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1831,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1830,e1831).

#pos(e1832,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1833,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1832,e1833).

#pos(e1834,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1835,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1834,e1835).

#pos(e1836,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1837,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1836,e1837).

#pos(e1838,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1839,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1838,e1839).

#pos(e1840,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1841,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1840,e1841).

#pos(e1842,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1843,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1842,e1843).

#pos(e1844,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e1845,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1844,e1845).

#pos(e1846,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1847,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1846,e1847).

#pos(e1848,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1849,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1848,e1849).

#pos(e1850,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1851,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1850,e1851).

#pos(e1852,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1853,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1852,e1853).

#pos(e1854,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1855,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e1854,e1855).

#pos(e1856,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1857,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1856,e1857).

#pos(e1858,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1859,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1858,e1859).

#pos(e1860,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1861,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1860,e1861).

#pos(e1862,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1863,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e1862,e1863).

#pos(e1864,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1865,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1864,e1865).

#pos(e1866,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1867,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1866,e1867).

#pos(e1868,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1869,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1868,e1869).

#pos(e1870,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1871,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1870,e1871).

#pos(e1872,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1873,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1872,e1873).

#pos(e1874,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1875,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1874,e1875).

#pos(e1876,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1877,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1876,e1877).

#pos(e1878,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e1879,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1878,e1879).

#pos(e1880,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1881,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1880,e1881).

#pos(e1882,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1883,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1882,e1883).

#pos(e1884,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1885,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1884,e1885).

#pos(e1886,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#pos(e1887,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e1886,e1887).

#pos(e1888,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1889,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1888,e1889).

#pos(e1890,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1891,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1890,e1891).

#pos(e1892,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1893,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1892,e1893).

#pos(e1894,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1895,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1894,e1895).

#pos(e1896,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1897,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1896,e1897).

#pos(e1898,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1899,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1898,e1899).

#pos(e1900,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1901,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1900,e1901).

#pos(e1902,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1903,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1902,e1903).

#pos(e1904,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1905,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1904,e1905).

#pos(e1906,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1907,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1906,e1907).

#pos(e1908,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1909,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1908,e1909).

#pos(e1910,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1911,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1910,e1911).

#pos(e1912,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1913,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1912,e1913).

#pos(e1914,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1915,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1914,e1915).

#pos(e1916,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1917,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1916,e1917).

#pos(e1918,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1919,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1918,e1919).

#pos(e1920,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1921,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1920,e1921).

#pos(e1922,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#pos(e1923,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1922,e1923).

#pos(e1924,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1925,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1924,e1925).

#pos(e1926,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e1927,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1926,e1927).

#pos(e1928,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1929,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1928,e1929).

#pos(e1930,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#pos(e1931,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1930,e1931).

#pos(e1932,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e1933,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1932,e1933).

#pos(e1934,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e1935,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1934,e1935).

#pos(e1936,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e1937,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e1936,e1937).

#pos(e1938,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e1939,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1938,e1939).

#pos(e1940,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1941,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1940,e1941).

#pos(e1942,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1943,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1942,e1943).

#pos(e1944,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1945,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e1944,e1945).

#pos(e1946,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1947,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e1946,e1947).

#pos(e1948,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e1949,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1948,e1949).

#pos(e1950,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e1951,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1950,e1951).

#pos(e1952,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1953,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1952,e1953).

#pos(e1954,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1955,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1954,e1955).

#pos(e1956,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1957,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e1956,e1957).

#pos(e1958,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1959,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1958,e1959).

#pos(e1960,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1961,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1960,e1961).

#pos(e1962,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e1963,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e1962,e1963).

#pos(e1964,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e1965,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1964,e1965).

#pos(e1966,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1967,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1966,e1967).

#pos(e1968,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e1969,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1968,e1969).

#pos(e1970,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e1971,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e1970,e1971).

#pos(e1972,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,3))). 
}).
#pos(e1973,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1972,e1973).

#pos(e1974,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1975,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1974,e1975).

#pos(e1976,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1977,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1976,e1977).

#pos(e1978,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e1979,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e1978,e1979).

#pos(e1980,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#pos(e1981,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e1980,e1981).

#pos(e1982,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#pos(e1983,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1982,e1983).

#pos(e1984,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#pos(e1985,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1984,e1985).

#pos(e1986,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e1987,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1986,e1987).

#pos(e1988,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1989,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1988,e1989).

#pos(e1990,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#pos(e1991,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(3,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1990,e1991).

#pos(e1992,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e1993,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e1992,e1993).

#pos(e1994,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e1995,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e1994,e1995).

#pos(e1996,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#pos(e1997,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1996,e1997).

#pos(e1998,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#pos(e1999,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,2))). true(has(b,cell(1,2))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e1998,e1999).

#pos(e2000,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e2001,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2000,e2001).

#pos(e2002,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#pos(e2003,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2002,e2003).

#pos(e2004,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2005,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2004,e2005).

#pos(e2006,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2007,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2006,e2007).

#pos(e2008,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2009,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2008,e2009).

#pos(e2010,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2011,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2010,e2011).

#pos(e2012,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2013,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2012,e2013).

#pos(e2014,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e2015,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2014,e2015).

#pos(e2016,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e2017,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2016,e2017).

#pos(e2018,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#pos(e2019,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2018,e2019).

#pos(e2020,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2021,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2020,e2021).

#pos(e2022,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2023,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2022,e2023).

#pos(e2024,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e2025,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2024,e2025).

#pos(e2026,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2027,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2026,e2027).

#pos(e2028,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#pos(e2029,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2028,e2029).

#pos(e2030,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#pos(e2031,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2030,e2031).

#pos(e2032,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2033,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2032,e2033).

#pos(e2034,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e2035,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2034,e2035).

#pos(e2036,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2037,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2036,e2037).

#pos(e2038,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2039,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2038,e2039).

#pos(e2040,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2041,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2040,e2041).

#pos(e2042,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2043,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2042,e2043).

#pos(e2044,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#pos(e2045,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e2044,e2045).

#pos(e2046,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2047,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2046,e2047).

#pos(e2048,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,1))). 
}).
#pos(e2049,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2048,e2049).

#pos(e2050,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2051,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2050,e2051).

#pos(e2052,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2053,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2052,e2053).

#pos(e2054,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2055,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e2054,e2055).

#pos(e2056,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2057,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e2056,e2057).

#pos(e2058,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). does(b,mark(cell(3,1))). 
}).
#pos(e2059,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2058,e2059).

#pos(e2060,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2061,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e2060,e2061).

#pos(e2062,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2063,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2062,e2063).

#pos(e2064,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e2065,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2064,e2065).

#pos(e2066,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(2,2))). 
}).
#pos(e2067,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2066,e2067).

#pos(e2068,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#pos(e2069,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2068,e2069).

#pos(e2070,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2071,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(2,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2070,e2071).

#pos(e2072,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e2073,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2072,e2073).

#pos(e2074,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#pos(e2075,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2074,e2075).

#pos(e2076,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2077,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2076,e2077).

#pos(e2078,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(3,2))). 
}).
#pos(e2079,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2078,e2079).

#pos(e2080,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2081,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2080,e2081).

#pos(e2082,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e2083,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2082,e2083).

#pos(e2084,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2085,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2084,e2085).

#pos(e2086,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2087,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2086,e2087).

#pos(e2088,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2089,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2088,e2089).

#pos(e2090,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#pos(e2091,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2090,e2091).

#pos(e2092,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2093,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2092,e2093).

#pos(e2094,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,1))). 
}).
#pos(e2095,{}, {}, {
 true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(3,2))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e2094,e2095).

#pos(e2096,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2097,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2096,e2097).

#pos(e2098,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#pos(e2099,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2098,e2099).

#pos(e2100,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2101,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2100,e2101).

#pos(e2102,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2103,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2102,e2103).

#pos(e2104,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2105,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e2104,e2105).

#pos(e2106,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2107,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2106,e2107).

#pos(e2108,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e2109,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2108,e2109).

#pos(e2110,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2111,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2110,e2111).

#pos(e2112,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e2113,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2112,e2113).

#pos(e2114,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2115,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2114,e2115).

#pos(e2116,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2117,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2116,e2117).

#pos(e2118,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2119,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2118,e2119).

#pos(e2120,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). does(b,mark(cell(2,2))). 
}).
#pos(e2121,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(3,3))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2120,e2121).

#pos(e2122,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2123,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2122,e2123).

#pos(e2124,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2125,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2124,e2125).

#pos(e2126,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e2127,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2126,e2127).

#pos(e2128,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e2129,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2128,e2129).

#pos(e2130,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2131,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2130,e2131).

#pos(e2132,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e2133,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2132,e2133).

#pos(e2134,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e2135,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2134,e2135).

#pos(e2136,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e2137,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2136,e2137).

#pos(e2138,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#pos(e2139,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2138,e2139).

#pos(e2140,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2141,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,1))). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2140,e2141).

#pos(e2142,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e2143,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(3,3))). true(has(a,cell(1,1))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2142,e2143).

#pos(e2144,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2145,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2144,e2145).

#pos(e2146,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2147,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2146,e2147).

#pos(e2148,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2149,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2148,e2149).

#pos(e2150,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2151,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2150,e2151).

#pos(e2152,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e2153,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2152,e2153).

#pos(e2154,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2155,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e2154,e2155).

#pos(e2156,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e2157,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2156,e2157).

#pos(e2158,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2159,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2158,e2159).

#pos(e2160,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2161,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e2160,e2161).

#pos(e2162,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e2163,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2162,e2163).

#pos(e2164,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). does(b,mark(cell(2,2))). 
}).
#pos(e2165,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2164,e2165).

#pos(e2166,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2167,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2166,e2167).

#pos(e2168,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2169,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2168,e2169).

#pos(e2170,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2171,{}, {}, {
 true(free(cell(3,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2170,e2171).

#pos(e2172,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e2173,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2172,e2173).

#pos(e2174,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#pos(e2175,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2174,e2175).

#pos(e2176,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#pos(e2177,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2176,e2177).

#pos(e2178,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2179,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2178,e2179).

#pos(e2180,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2181,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2180,e2181).

#pos(e2182,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#pos(e2183,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2182,e2183).

#pos(e2184,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2185,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2184,e2185).

#pos(e2186,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2187,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2186,e2187).

#pos(e2188,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e2189,{}, {}, {
 true(free(cell(3,3))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2188,e2189).

#pos(e2190,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2191,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e2190,e2191).

#pos(e2192,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2193,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2192,e2193).

#pos(e2194,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2195,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2194,e2195).

#pos(e2196,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2197,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2196,e2197).

#pos(e2198,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#pos(e2199,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2198,e2199).

#pos(e2200,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(1,1))). 
}).
#pos(e2201,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2200,e2201).

#pos(e2202,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2203,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,3))). 
}).
#brave_ordering(e2202,e2203).

#pos(e2204,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(2,2))). 
}).
#pos(e2205,{}, {}, {
 true(free(cell(3,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2204,e2205).

#pos(e2206,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e2207,{}, {}, {
 true(free(cell(3,3))). true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,3))). 
}).
#brave_ordering(e2206,e2207).

#pos(e2208,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2209,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2208,e2209).

#pos(e2210,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(3,2))). 
}).
#pos(e2211,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2210,e2211).

#pos(e2212,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2213,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2212,e2213).

#pos(e2214,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2215,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2214,e2215).

#pos(e2216,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2217,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2216,e2217).

#pos(e2218,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e2219,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2218,e2219).

#pos(e2220,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2221,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2220,e2221).

#pos(e2222,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#pos(e2223,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#brave_ordering(e2222,e2223).

#pos(e2224,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,2))). 
}).
#pos(e2225,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2224,e2225).

#pos(e2226,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2227,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2226,e2227).

#pos(e2228,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#pos(e2229,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2228,e2229).

#pos(e2230,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2231,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2230,e2231).

#pos(e2232,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e2233,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2232,e2233).

#pos(e2234,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#pos(e2235,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2234,e2235).

#pos(e2236,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2237,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2236,e2237).

#pos(e2238,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2239,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2238,e2239).

#pos(e2240,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2241,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2240,e2241).

#pos(e2242,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2243,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2242,e2243).

#pos(e2244,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(3,1))). 
}).
#pos(e2245,{}, {}, {
 true(free(cell(2,1))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2244,e2245).

#pos(e2246,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2247,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e2246,e2247).

#pos(e2248,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e2249,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2248,e2249).

#pos(e2250,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e2251,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2250,e2251).

#pos(e2252,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(3,1))). 
}).
#pos(e2253,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2252,e2253).

#pos(e2254,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#pos(e2255,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,2))). true(control(b)). true(has(a,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2254,e2255).

#pos(e2256,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). does(b,mark(cell(1,1))). 
}).
#pos(e2257,{}, {}, {
 true(free(cell(2,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(a,cell(2,3))). true(has(a,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,2))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2256,e2257).

#pos(e2258,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2259,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2258,e2259).

#pos(e2260,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2261,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2260,e2261).

#pos(e2262,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2263,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,1))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e2262,e2263).

#pos(e2264,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2265,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2264,e2265).

#pos(e2266,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2267,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(a,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e2266,e2267).

#pos(e2268,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2269,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#brave_ordering(e2268,e2269).

#pos(e2270,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2271,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2270,e2271).

#pos(e2272,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2273,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e2272,e2273).

#pos(e2274,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,1))). 
}).
#pos(e2275,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2274,e2275).

#pos(e2276,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#pos(e2277,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2276,e2277).

#pos(e2278,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,2))). 
}).
#pos(e2279,{}, {}, {
 true(free(cell(3,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2278,e2279).

#pos(e2280,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2281,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2280,e2281).

#pos(e2282,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2283,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,3))). true(control(a)). true(has(b,cell(2,1))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). true(has(a,cell(1,3))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2282,e2283).

#pos(e2284,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2285,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e2284,e2285).

#pos(e2286,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,2))). 
}).
#pos(e2287,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2286,e2287).

#pos(e2288,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,2))). 
}).
#pos(e2289,{}, {}, {
 true(free(cell(3,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2288,e2289).

#pos(e2290,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2291,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(3,1))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2290,e2291).

#pos(e2292,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2293,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(3,1))). 
}).
#brave_ordering(e2292,e2293).

#pos(e2294,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#pos(e2295,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(3,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,1))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e2294,e2295).

#pos(e2296,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2297,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(free(cell(2,2))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2296,e2297).

#pos(e2298,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(3,1))). 
}).
#pos(e2299,{}, {}, {
 true(free(cell(3,1))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2298,e2299).

#pos(e2300,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e2301,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(1,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2300,e2301).

#pos(e2302,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#pos(e2303,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,1))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(3,3))). true(has(b,cell(2,3))). true(has(b,cell(3,1))). true(has(a,cell(1,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2302,e2303).

#pos(e2304,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(1,1))). 
}).
#pos(e2305,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(1,3))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2304,e2305).

#pos(e2306,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#pos(e2307,{}, {}, {
 true(free(cell(1,1))). true(free(cell(3,1))). true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,3))). true(free(cell(2,2))). true(free(cell(2,1))). true(control(a)). true(has(b,cell(3,3))). true(has(a,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e2306,e2307).

#pos(e2308,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2309,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e2308,e2309).

#pos(e2310,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2311,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e2310,e2311).

#pos(e2312,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(2,2))). 
}).
#pos(e2313,{}, {}, {
 true(control(b)). true(has(a,cell(1,3))). true(free(cell(2,1))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(3,1))). true(free(cell(1,1))). true(free(cell(3,3))). does(b,mark(cell(2,1))). 
}).
#brave_ordering(e2312,e2313).