%------------------------------- BACKGROUND KNOWLEDGE --------------------------------------
%Configuration
removable(1..6).

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
goal(X,-1):- true(has(1,0)), true(has(2,0)), true(has(3,0)), true(has(4,0)), true(control(X)).
terminal :- goal(_,_).

% #show does/2.
% Define predicates to learn real strategy
binary(0,1,0).binary(0,2,0).binary(0,4,0).

binary(1,1,1).binary(1,2,0).binary(1,4,0).

binary(2,1,0).binary(2,2,1).binary(2,4,0).

binary(3,1,1).binary(3,2,1).binary(3,4,0).

binary(4,1,0).binary(4,2,0).binary(4,4,1).

binary(5,1,1).binary(5,2,0).binary(5,4,1).

binary(6,1,0).binary(6,2,1).binary(6,4,1).

binary(7,1,1).binary(7,2,1).binary(7,4,1).

% num(0..6).
% odd(X) :- num(X), X\2 != 0.

%%% Expected Hypothesis
% nim_sum(V1,0,0) :- b(_,V1,_).
% b(V3,V1,V2) :- binary(V0,V1,V2), next(has(V3,V0)).
% nim_sum(V0,V1+V3,V2) :- nim_sum(V0,V1,V2-1), b(V2,V0,V3).
% :~ nim_sum(V0,V1,4), odd(V1).[1@1, 4, V0, V1]

%%% Expected Hypothesis reduced without lines 63 and 64 and with 5 variables
% nim_sum(V1,0,0) :- binary(_,V1,_).
% nim_sum(V0,V1+V4,V2) :- nim_sum(V0,V1,V2-1), binary(V3,V0,V4), next(has(V2,V3)).
% :~ nim_sum(V0,V1,4), odd(V1).[1@1, 4, V0, V1]

%------------------------------  Language bias
#constant(pile,1).
#constant(pile,2).
#constant(pile,3).
#constant(pile,4).

#modeb(1,b(var(pile),var(n),var(binary)),(positive)).
#modeh(b(var(pile),var(n),var(binary)),(positive)).
#modeh(nim_sum(var(n),var(total)+var(binary),var(pile)),(positive)).
#modeh(nim_sum(var(n),0,0),(positive)).
#modeb(1,nim_sum(var(n),var(total),var(pile)-1),(positive)).
#modeb(1,binary(var(num),var(n),var(binary)),(positive)).
#modeb(1,next(has(var(pile),var(num))),(positive)).
#modeo(1,nim_sum(var(n),var(t),const(pile))).
% #modeo(1,odd(var(t))).
#modeo(1,var(t)\2 != 0).

#weight(1).
#weight(-1).
#maxp(1).
#maxv(4).
#pos(e0,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e1,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,0)). true(has(1,1)). true(has(2,1)). does(a,remove(3,3)). 
}).
#pos(e3,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,0)). true(has(1,1)). true(has(2,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#pos(e5,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e7,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e9,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e13,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#pos(e15,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#pos(e17,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e19,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e21,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e23,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e25,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(4,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e27,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(4,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(4,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e29,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(4,0)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e31,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e33,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e35,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e37,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e39,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e41,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e43,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e45,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,0)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e47,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e49,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e48,e49).