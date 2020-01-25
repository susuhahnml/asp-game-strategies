%------------------------------- BACKGROUND KNOWLEDGE --------------------------------------
%Configuration
removable(1..3).

% Roles (Players)
role(a).
role(b).

% Action selection
legal(X,remove(P,N)) :- true(has(P,M)), removable(N), N<=M, true(control(X)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)).
next(control(a)) :- true(control(b)).
next(has(P,N-M)) :- does(_,remove(P,M)), true(has(P,N)).
next(has(P,N)) :- not does(_,remove(P,_)), true(has(P,N)).

% Define goal and terminal states
goal(X,1):- true(has(p1,0)), true(has(p2,0)), true(has(p3,0)), true(control(X)).
terminal :- goal(_,_).

%------------------------------- LANGUAGE BIAS --------------------------------------

#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(player,a).
#constant(player,b).

#modeo(3,next(has(var(pile),const(amount))),(positive)).
#modeo(3,var(pile)!=var(pile),(symmetric,anti_reflexive)).
#weight(-1).
#weight(1).
#weight(2).
#maxp(3).

%------------------------------- EXAMPLES --------------------------------------

%------------ Context E ----------------

#pos(e0,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). 
}).
#pos(e1,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). 
}).
#pos(e3,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). 
}).
#pos(e5,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e7,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,1)). 
}).
#pos(e9,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,1)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e11,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e13,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#pos(e15,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#pos(e17,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#pos(e19,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,2)). true(has(2,1)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,2)). 
}).
#pos(e21,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,2)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,2)). 
}).
#pos(e23,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,2)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{ does(a,remove(1,3)) }, {}, {
 true(has(1,3)). true(has(2,2)). true(has(3,2)). true(control(a)). 
}).
#pos(e25,{ does(a,remove(1,1)) }, {}, {
 true(has(1,3)). true(has(2,2)). true(has(3,2)). true(control(a)). 
}).
#brave_ordering(e24,e25).