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
goal(X,1):- true(has(1,0)), true(has(2,0)), true(has(3,0)), true(control(X)).
terminal :- goal(_,_).

%------------------------------- LANGUAGE BIAS --------------------------------------

#constant(amount,0).
#constant(amount,1).
#constant(amount,2).

#constant(player,a).
#constant(player,b).


#modeo(3,true(has(var(pile),const(amount))),(positive)).
#modeo(3,next(has(var(pile),const(amount))),(positive)).
#modeo(3,var(pile)!=var(pile),(symmetric,anti_reflexive)).
#weight(-1).
#weight(1).
#weight(2).
#maxp(3).


#pos(e0,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)).
}).
#pos(e1,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)).
}).
#brave_ordering(e0,e1).
#pos(e2,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)).
}).
#pos(e3,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)).
}).
#brave_ordering(e2,e3).
#pos(e4,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#pos(e5,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#brave_ordering(e4,e5).
#pos(e6,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#pos(e7,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#brave_ordering(e6,e7).
#pos(e8,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)).
}).
#pos(e9,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)).
}).
#brave_ordering(e8,e9).
#pos(e10,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)).
}).
#pos(e11,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)).
}).
#brave_ordering(e10,e11).
#pos(e12,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,1)).
}).
#pos(e13,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,1)).
}).
#brave_ordering(e12,e13).
#pos(e14,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,1)).
}).
#pos(e15,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,1)).
}).
#brave_ordering(e14,e15).
#pos(e16,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#pos(e17,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#brave_ordering(e16,e17).
#pos(e18,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,1)).
}).
#pos(e19,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,1)).
}).
#brave_ordering(e18,e19).
#pos(e20,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,1)).
}).
#pos(e21,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,1)).
}).
#brave_ordering(e20,e21).
#pos(e22,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)).
}).
#pos(e23,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)).
}).
#brave_ordering(e22,e23).
#pos(e24,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#pos(e25,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#brave_ordering(e24,e25).
#pos(e26,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#pos(e27,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#brave_ordering(e26,e27).
#pos(e28,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#pos(e29,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#brave_ordering(e28,e29).
#pos(e30,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#pos(e31,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,2)).
}).
#brave_ordering(e30,e31).
#pos(e32,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)).
}).
#pos(e33,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)).
}).
#brave_ordering(e32,e33).
#pos(e34,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,0)).
}).
#pos(e35,{ does(a,remove(3,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,0)).
}).
#brave_ordering(e34,e35).
#pos(e36,{ does(a,remove(3,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,1)).
}).
#pos(e37,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,1)).
}).
#brave_ordering(e36,e37).
#pos(e38,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)).
}).
#pos(e39,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)).
}).
#brave_ordering(e38,e39).
#pos(e40,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)).
}).
#pos(e41,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)).
}).
#brave_ordering(e40,e41).
#pos(e42,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)).
}).
#pos(e43,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)).
}).
#brave_ordering(e42,e43).
#pos(e44,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,1)).
}).
#pos(e45,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,1)).
}).
#brave_ordering(e44,e45).
#pos(e46,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)).
}).
#pos(e47,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)).
}).
#brave_ordering(e46,e47).
#pos(e48,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)).
}).
#pos(e49,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)).
}).
#brave_ordering(e48,e49).
#pos(e50,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)).
}).
#pos(e51,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)).
}).
#brave_ordering(e50,e51).
#pos(e52,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)).
}).
#pos(e53,{ does(b,remove(3,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)).
}).
#brave_ordering(e52,e53).
#pos(e54,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#pos(e55,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#brave_ordering(e54,e55).
#pos(e56,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#pos(e57,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)).
}).
#brave_ordering(e56,e57).
#pos(e58,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#pos(e59,{ does(a,remove(3,2)) }, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)).
}).
#brave_ordering(e58,e59).
#pos(e60,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)).
}).
#pos(e61,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)).
}).
#brave_ordering(e60,e61).