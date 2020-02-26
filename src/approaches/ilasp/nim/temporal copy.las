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
goal(X,-1):- true(has(1,0)), true(has(2,0)), true(has(3,0)), true(control(X)).
terminal :- goal(_,_).

% #show does/2.% Define predicates to learn real strategy
binary(0,0,0,0).
binary(1,0,0,1).
binary(2,0,1,0).
binary(3,0,1,1).
binary(4,1,0,0).
binary(5,1,0,1).
binary(6,1,1,0).
binary(7,1,1,1).


% Expected strategy
% b(1,P1,B1):-next(has(P1,N1)), binary(N1,B3,B2,B1).
% % 3 ~ b(1,V4,V1) :- binary(V0,V1,_,_), next(has(V4,V0)).
% b(2,P1,B2):-next(has(P1,N1)), binary(N1,B3,B2,B1).
% b(3,P1,B3):-next(has(P1,N1)), binary(N1,B3,B2,B1).

% b(1,P2,B1):-next(has(P2,N1)), binary(N1,B3,B2,B1).
% b(2,P2,B2):-next(has(P2,N1)), binary(N1,B3,B2,B1).
% b(3,P2,B3):-next(has(P2,N1)), binary(N1,B3,B2,B1).

% b(1,P3,B1):-next(has(P3,N1)), binary(N1,B3,B2,B1).
% b(2,P3,B2):-next(has(P3,N1)), binary(N1,B3,B2,B1).
% b(3,P3,B3):-next(has(P3,N1)), binary(N1,B3,B2,B1).

% tb(N,B11+B12+B13) :- b(N,P1,B11), b(N,P2,B12), b(N,P3,B13), P1<P2, P2<P3.
% % 6 ~ tb(V0,V4+V2+V6) :- b(V0,V1,V2), b(V0,V3,V4), b(V0,V5,V6), V1 < V5, V3 < V5.
% odd(N) :- tb(N,T), T\2!=0.
% % 3 ~ odd(V0) :- tb(V0,V1), V1\2 != 0.

% :~ odd(V).[1@1,1,V]
% % 1 ~ :~ odd(V0).[1@1, 108581, V0]
%------------------------------- LANGUAGE BIAS --------------------------------------
#constant(pos,1).
#constant(pos,2).
#constant(pos,3).

#modeh(b(const(pos),var(pile),var(bin))).
#modeb(1,binary(var(num),var(bin),var(bin),var(bin)),(positive)).
#modeb(1,next(has(var(pile),var(num))),(positive)).
#modeb(3,b(var(n),var(pile),var(bin)),(positive)).
#modeh(tb(var(n),var(bin)+var(bin)+var(bin))).
#modeb(1,tb(var(n),var(t)),(positive)).
#modeb(1,var(t)\2!=0).
#modeb(2,var(pile)<var(pile),(symmetric,anti_reflexive)).
#modeh(odd(var(n))).

#modeo(1,odd(var(n))).

#weight(-1).
#weight(1).
#maxv(7).
#maxhl(2).

#pos(e0,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). does(b,remove(2,2)). 
}).
#pos(e1,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e3,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e5,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e7,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e9,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,2)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,1)). 
}).
#pos(e13,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,1)). 
}).
#pos(e15,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(3,1)). 
}).
#pos(e17,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(1,2)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(3,1)). 
}).
#pos(e19,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(1,1)). 
}).
#brave_ordering(e18,e19).