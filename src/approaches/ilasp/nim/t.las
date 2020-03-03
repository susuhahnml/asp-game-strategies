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
% Define predicates to learn real strategy
binary(0,1,0).binary(0,2,0).binary(0,4,0).

binary(1,1,1).binary(1,2,0).binary(1,4,0).

binary(2,1,0).binary(2,2,1).binary(2,4,0).

binary(3,1,1).binary(3,2,1).binary(3,4,0).

binary(4,1,0).binary(4,2,0).binary(4,4,1).

binary(5,1,1).binary(5,2,0).binary(5,4,1).

binary(6,1,0).binary(6,2,1).binary(6,4,1).

binary(7,1,1).binary(7,2,1).binary(7,4,1).

num(0..6).
odd(X) :- num(X), X\2 != 0.
piles(1,2,3,4).
%%% Expected Hypothesis
% b1(N,B):-binary(M,N,B),next(has(1,M)).
% b2(N,B):-binary(M,N,B),next(has(2,M)).
% b3(N,B):-binary(M,N,B),next(has(3,M)).
% b4(N,B):-binary(M,N,B),next(has(4,M)).
% total_piles(B1+B2+B3+B4):-b1(N,B1),b2(N,B2),b3(N,B3),b4(N,B4).
% :~ total_piles(V0), odd(V0).[1@1, 1, V0]

% b(P,N,B):-binary(M,N,B),next(has(P,M)).
% total_piles(B1+B2+B3+B4):-b(P1,N,B1),b(P2,N,B2),b(P3,N,B3),b(P4,N,B4), piles(P1,P2,P3,P4).
% :~ total_piles(V0), odd(V0).[1@1, 1, V0]

piles(1,2,3,4).
next_val(V1,V2,V3,V4):-next(has(P1,V1)),next(has(P2,V2)),next(has(P3,V3)),next(has(P4,V4)),piles(P1,P2,P3,P4).

#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(amount,3).
#constant(amount,4).
#constant(amount,5).
#constant(amount,6).
#constant(amount,7).
#modeb(1,next_val(var(val),var(val),var(val),var(val)),(positive)).
#modeh(1,next_cob(var(val),var(val),var(val),var(val)),(positive)).
% #modeh(next_val(var(amount),var(amount),var(amount),var(amount))).
#modeo(1,next_cob(const(amount),const(amount),const(amount),const(amount)),(positive)).


% #bias(":- wc(next_val(7,7,7,7)).").
#bias(":- body(next_val(X,X,_,_)).").
#bias(":- body(next_val(X,_,X,_)).").
#bias(":- body(next_val(X,_,_,X)).").
#bias(":- body(next_val(_,X,X,_)).").
#bias(":- body(next_val(_,X,_,X)).").
#bias(":- body(next_val(_,_,X,X)).").

#bias(":- head(next_val(X,X,_,_)).").
#bias(":- head(next_val(X,_,X,_)).").
#bias(":- head(next_val(X,_,_,X)).").
#bias(":- head(next_val(_,X,X,_)).").
#bias(":- head(next_val(_,X,_,X)).").
#bias(":- head(next_val(_,_,X,X)).").


#weight(-1).
#weight(1).
% #weight(2).
#maxp(1).
#maxv(4).

#pos(e0,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e3,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e5,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e7,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e9,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e13,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e15,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e17,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e19,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e21,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e23,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e25,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e27,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e29,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e31,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(2,1)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e33,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e35,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e37,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e39,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e41,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e43,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e45,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e47,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e49,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e51,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e53,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e55,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,5)). 
}).
#pos(e57,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e59,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e61,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e63,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e65,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e67,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e69,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e71,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e73,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e72,e73).

#pos(e74,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e75,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e74,e75).

#pos(e76,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e77,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e76,e77).

#pos(e78,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e79,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e78,e79).

#pos(e80,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e81,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e80,e81).

#pos(e82,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e83,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e82,e83).

#pos(e84,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e85,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e84,e85).

#pos(e86,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e87,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e86,e87).

#pos(e88,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e89,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e88,e89).

#pos(e90,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e91,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e90,e91).

#pos(e92,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e93,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e92,e93).

#pos(e94,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e95,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e94,e95).

#pos(e96,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e97,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e96,e97).

#pos(e98,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e99,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e98,e99).

#pos(e100,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e101,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e100,e101).

#pos(e102,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e103,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e102,e103).

#pos(e104,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e105,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e104,e105).

#pos(e106,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e107,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e106,e107).

#pos(e108,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e109,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e108,e109).

#pos(e110,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e111,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e110,e111).

#pos(e112,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e113,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e112,e113).

#pos(e114,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e115,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e114,e115).

#pos(e116,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e117,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e116,e117).

#pos(e118,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e119,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e118,e119).

#pos(e120,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,5)). 
}).
#pos(e121,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e120,e121).

#pos(e122,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e123,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e122,e123).

#pos(e124,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e125,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e124,e125).

#pos(e126,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e127,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e126,e127).

#pos(e128,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e129,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e128,e129).

#pos(e130,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e131,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,5)). 
}).
#brave_ordering(e130,e131).

#pos(e132,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e133,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e132,e133).

#pos(e134,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e135,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e134,e135).

#pos(e136,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e137,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e136,e137).

#pos(e138,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e139,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e138,e139).

#pos(e140,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e141,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e140,e141).

#pos(e142,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e143,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e142,e143).

#pos(e144,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e145,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e144,e145).

#pos(e146,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e147,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e146,e147).

#pos(e148,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e149,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e148,e149).

#pos(e150,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e151,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e150,e151).

#pos(e152,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(4,5)). 
}).
#pos(e153,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e152,e153).

#pos(e154,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(4,5)). 
}).
#pos(e155,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e154,e155).

#pos(e156,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(4,5)). 
}).
#pos(e157,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e156,e157).

#pos(e158,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e159,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e158,e159).

#pos(e160,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e161,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e160,e161).

#pos(e162,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e163,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e162,e163).

#pos(e164,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e165,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e164,e165).

#pos(e166,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e167,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e166,e167).

#pos(e168,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e169,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e168,e169).

#pos(e170,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e171,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e170,e171).

#pos(e172,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e173,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e172,e173).

#pos(e174,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e175,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e174,e175).

#pos(e176,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e177,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e176,e177).

#pos(e178,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e179,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e178,e179).

#pos(e180,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e181,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e180,e181).

#pos(e182,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e183,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e182,e183).

#pos(e184,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e185,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e184,e185).

#pos(e186,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e187,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e186,e187).

#pos(e188,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e189,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e188,e189).

#pos(e190,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e191,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e190,e191).

#pos(e192,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e193,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e192,e193).

#pos(e194,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e195,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e194,e195).

#pos(e196,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e197,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e196,e197).

#pos(e198,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e199,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e198,e199).

#pos(e200,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e201,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e200,e201).

#pos(e202,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e203,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e202,e203).

#pos(e204,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e205,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e204,e205).

#pos(e206,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e207,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e206,e207).

#pos(e208,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e209,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e208,e209).

#pos(e210,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e211,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e210,e211).

#pos(e212,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e213,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e212,e213).

#pos(e214,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e215,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e214,e215).

#pos(e216,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e217,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e216,e217).

#pos(e218,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e219,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e218,e219).

#pos(e220,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e221,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e220,e221).

#pos(e222,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e223,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e222,e223).

#pos(e224,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e225,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e224,e225).

#pos(e226,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e227,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e226,e227).

#pos(e228,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e229,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e228,e229).

#pos(e230,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e231,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e230,e231).

#pos(e232,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e233,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e232,e233).

#pos(e234,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e235,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e234,e235).

#pos(e236,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e237,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e236,e237).

#pos(e238,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e239,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e238,e239).

#pos(e240,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e241,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e240,e241).

#pos(e242,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e243,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e242,e243).

#pos(e244,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e245,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e244,e245).

#pos(e246,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e247,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e246,e247).

#pos(e248,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e249,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e248,e249).

#pos(e250,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e251,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e250,e251).

#pos(e252,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e253,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e252,e253).

#pos(e254,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e255,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e254,e255).

#pos(e256,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e257,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e256,e257).

#pos(e258,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e259,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e258,e259).

#pos(e260,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e261,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e260,e261).

#pos(e262,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e263,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e262,e263).

#pos(e264,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e265,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e264,e265).

#pos(e266,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e267,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e266,e267).

#pos(e268,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e269,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e268,e269).

#pos(e270,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e271,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e270,e271).

#pos(e272,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e273,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e272,e273).

#pos(e274,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e275,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e274,e275).

#pos(e276,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e277,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e276,e277).

#pos(e278,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e279,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e278,e279).

#pos(e280,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e281,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e280,e281).

#pos(e282,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e283,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e282,e283).

#pos(e284,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e285,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e284,e285).

#pos(e286,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e287,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e286,e287).

#pos(e288,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e289,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e288,e289).

#pos(e290,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e291,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e290,e291).

#pos(e292,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e293,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e292,e293).

#pos(e294,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e295,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e294,e295).

#pos(e296,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e297,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e296,e297).

#pos(e298,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e299,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e298,e299).

#pos(e300,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e301,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e300,e301).

#pos(e302,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e303,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e302,e303).

#pos(e304,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e305,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e304,e305).

#pos(e306,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e307,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e306,e307).

#pos(e308,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e309,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e308,e309).

#pos(e310,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e311,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e310,e311).

#pos(e312,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e313,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e312,e313).

#pos(e314,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e315,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e314,e315).

#pos(e316,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e317,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e316,e317).

#pos(e318,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e319,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e318,e319).

#pos(e320,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e321,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e320,e321).

#pos(e322,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e323,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e322,e323).

#pos(e324,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e325,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e324,e325).

#pos(e326,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e327,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e326,e327).

#pos(e328,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e329,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e328,e329).

#pos(e330,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e331,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e330,e331).

#pos(e332,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e333,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e332,e333).

#pos(e334,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e335,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e334,e335).

#pos(e336,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e337,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e336,e337).

#pos(e338,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e339,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e338,e339).

#pos(e340,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e341,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e340,e341).

#pos(e342,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e343,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e342,e343).

#pos(e344,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e345,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e344,e345).

#pos(e346,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e347,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e346,e347).

#pos(e348,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e349,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e348,e349).

#pos(e350,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e351,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e350,e351).

#pos(e352,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e353,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e352,e353).

#pos(e354,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e355,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e354,e355).

#pos(e356,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e357,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e356,e357).

#pos(e358,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e359,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e358,e359).

#pos(e360,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e361,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e360,e361).

#pos(e362,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e363,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e362,e363).

#pos(e364,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e365,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e364,e365).

#pos(e366,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e367,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e366,e367).

#pos(e368,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e369,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e368,e369).

#pos(e370,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e371,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e370,e371).

#pos(e372,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e373,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#brave_ordering(e372,e373).

#pos(e374,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e375,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e374,e375).

#pos(e376,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e377,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e376,e377).

#pos(e378,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e379,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(3,2)). 
}).
#brave_ordering(e378,e379).

#pos(e380,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e381,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e380,e381).

#pos(e382,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e383,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e382,e383).

#pos(e384,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e385,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e384,e385).

#pos(e386,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e387,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e386,e387).

#pos(e388,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e389,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e388,e389).

#pos(e390,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e391,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e390,e391).

#pos(e392,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e393,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e392,e393).

#pos(e394,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e395,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e394,e395).

#pos(e396,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e397,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e396,e397).

#pos(e398,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e399,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e398,e399).

#pos(e400,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e401,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e400,e401).

#pos(e402,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e403,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e402,e403).

#pos(e404,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e405,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e404,e405).

#pos(e406,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e407,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e406,e407).

#pos(e408,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e409,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e408,e409).

#pos(e410,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e411,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e410,e411).

#pos(e412,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e413,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e412,e413).

#pos(e414,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e415,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e414,e415).

#pos(e416,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e417,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e416,e417).

#pos(e418,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e419,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(3,2)). 
}).
#brave_ordering(e418,e419).

#pos(e420,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e421,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e420,e421).

#pos(e422,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e423,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e422,e423).

#pos(e424,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e425,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e424,e425).

#pos(e426,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e427,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e426,e427).

#pos(e428,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e429,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e428,e429).

#pos(e430,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e431,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e430,e431).

#pos(e432,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e433,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e432,e433).

#pos(e434,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e435,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e434,e435).

#pos(e436,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e437,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e436,e437).

#pos(e438,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e439,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e438,e439).

#pos(e440,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e441,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e440,e441).

#pos(e442,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e443,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e442,e443).

#pos(e444,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e445,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e444,e445).

#pos(e446,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e447,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e446,e447).

#pos(e448,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e449,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e448,e449).

#pos(e450,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e451,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e450,e451).

#pos(e452,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e453,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e452,e453).

#pos(e454,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e455,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e454,e455).

#pos(e456,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e457,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e456,e457).

#pos(e458,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e459,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e458,e459).

#pos(e460,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e461,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e460,e461).

#pos(e462,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e463,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e462,e463).

#pos(e464,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e465,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e464,e465).

#pos(e466,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e467,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e466,e467).

#pos(e468,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e469,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e468,e469).

#pos(e470,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e471,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e470,e471).

#pos(e472,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e473,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e472,e473).

#pos(e474,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e475,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e474,e475).

#pos(e476,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e477,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e476,e477).

#pos(e478,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,0)). does(a,remove(4,5)). 
}).
#pos(e479,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e478,e479).

#pos(e480,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e481,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e480,e481).

#pos(e482,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e483,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e482,e483).

#pos(e484,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e485,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e484,e485).

#pos(e486,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e487,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e486,e487).

#pos(e488,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e489,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,5)). 
}).
#brave_ordering(e488,e489).

#pos(e490,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e491,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e490,e491).

#pos(e492,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e493,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e492,e493).

#pos(e494,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e495,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e494,e495).

#pos(e496,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e497,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e496,e497).

#pos(e498,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e499,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e498,e499).

#pos(e500,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e501,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e500,e501).

#pos(e502,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e503,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e502,e503).

#pos(e504,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e505,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e504,e505).

#pos(e506,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e507,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e506,e507).

#pos(e508,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e509,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e508,e509).

#pos(e510,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e511,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e510,e511).

#pos(e512,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e513,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e512,e513).

#pos(e514,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e515,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e514,e515).

#pos(e516,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e517,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e516,e517).

#pos(e518,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e519,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e518,e519).

#pos(e520,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e521,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e520,e521).

#pos(e522,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e523,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e522,e523).

#pos(e524,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e525,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e524,e525).

#pos(e526,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e527,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e526,e527).

#pos(e528,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e529,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e528,e529).

#pos(e530,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e531,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e530,e531).

#pos(e532,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e533,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e532,e533).

#pos(e534,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e535,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e534,e535).

#pos(e536,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e537,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e536,e537).

#pos(e538,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e539,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e538,e539).

#pos(e540,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e541,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e540,e541).

#pos(e542,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e543,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e542,e543).

#pos(e544,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e545,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e544,e545).

#pos(e546,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e547,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e546,e547).

#pos(e548,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e549,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e548,e549).

#pos(e550,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e551,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e550,e551).

#pos(e552,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e553,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e552,e553).

#pos(e554,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e555,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e554,e555).

#pos(e556,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e557,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e556,e557).

#pos(e558,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e559,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e558,e559).

#pos(e560,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e561,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e560,e561).

#pos(e562,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e563,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e562,e563).

#pos(e564,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e565,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e564,e565).

#pos(e566,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e567,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e566,e567).

#pos(e568,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e569,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e568,e569).

#pos(e570,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e571,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e570,e571).

#pos(e572,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e573,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e572,e573).

#pos(e574,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e575,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,3)). 
}).
#brave_ordering(e574,e575).

#pos(e576,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e577,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e576,e577).

#pos(e578,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e579,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e578,e579).

#pos(e580,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e581,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e580,e581).

#pos(e582,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e583,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e582,e583).

#pos(e584,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e585,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e584,e585).

#pos(e586,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e587,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e586,e587).

#pos(e588,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e589,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e588,e589).

#pos(e590,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e591,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e590,e591).

#pos(e592,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e593,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e592,e593).

#pos(e594,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,5)). 
}).
#pos(e595,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e594,e595).

#pos(e596,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e597,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e596,e597).

#pos(e598,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e599,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e598,e599).

#pos(e600,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e601,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e600,e601).

#pos(e602,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e603,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e602,e603).

#pos(e604,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e605,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e604,e605).

#pos(e606,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e607,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e606,e607).

#pos(e608,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e609,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e608,e609).

#pos(e610,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e611,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e610,e611).

#pos(e612,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e613,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e612,e613).

#pos(e614,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e615,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e614,e615).

#pos(e616,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e617,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e616,e617).

#pos(e618,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e619,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e618,e619).

#pos(e620,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e621,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e620,e621).

#pos(e622,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e623,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e622,e623).

#pos(e624,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e625,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e624,e625).

#pos(e626,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e627,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e626,e627).

#pos(e628,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e629,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e628,e629).

#pos(e630,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e631,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e630,e631).

#pos(e632,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e633,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e632,e633).

#pos(e634,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e635,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e634,e635).

#pos(e636,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e637,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e636,e637).

#pos(e638,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e639,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e638,e639).

#pos(e640,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e641,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e640,e641).

#pos(e642,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e643,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e642,e643).

#pos(e644,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e645,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e644,e645).

#pos(e646,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e647,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e646,e647).

#pos(e648,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e649,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e648,e649).

#pos(e650,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e651,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e650,e651).

#pos(e652,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e653,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e652,e653).

#pos(e654,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e655,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e654,e655).

#pos(e656,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e657,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e656,e657).

#pos(e658,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e659,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e658,e659).

#pos(e660,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e661,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e660,e661).

#pos(e662,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e663,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e662,e663).

#pos(e664,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e665,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e664,e665).

#pos(e666,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e667,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e666,e667).

#pos(e668,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e669,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e668,e669).

#pos(e670,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e671,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e670,e671).

#pos(e672,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e673,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e672,e673).

#pos(e674,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e675,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e674,e675).

#pos(e676,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e677,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e676,e677).

#pos(e678,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e679,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e678,e679).

#pos(e680,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e681,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e680,e681).

#pos(e682,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e683,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e682,e683).

#pos(e684,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e685,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e684,e685).

#pos(e686,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e687,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e686,e687).

#pos(e688,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e689,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e688,e689).

#pos(e690,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e691,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e690,e691).

#pos(e692,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e693,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e692,e693).

#pos(e694,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e695,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e694,e695).

#pos(e696,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e697,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e696,e697).

#pos(e698,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e699,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e698,e699).

#pos(e700,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e701,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e700,e701).

#pos(e702,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e703,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e702,e703).

#pos(e704,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e705,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e704,e705).

#pos(e706,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e707,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e706,e707).

#pos(e708,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e709,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e708,e709).

#pos(e710,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e711,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e710,e711).

#pos(e712,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e713,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e712,e713).

#pos(e714,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e715,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e714,e715).

#pos(e716,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e717,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,4)). 
}).
#brave_ordering(e716,e717).

#pos(e718,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e719,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e718,e719).

#pos(e720,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e721,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e720,e721).

#pos(e722,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e723,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e722,e723).

#pos(e724,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e725,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e724,e725).

#pos(e726,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,2)). 
}).
#pos(e727,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(4,5)). 
}).
#brave_ordering(e726,e727).

#pos(e728,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e729,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e728,e729).

#pos(e730,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e731,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e730,e731).

#pos(e732,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e733,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e732,e733).

#pos(e734,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e735,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e734,e735).

#pos(e736,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e737,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e736,e737).

#pos(e738,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e739,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e738,e739).

#pos(e740,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e741,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e740,e741).

#pos(e742,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e743,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e742,e743).

#pos(e744,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e745,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e744,e745).

#pos(e746,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e747,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e746,e747).

#pos(e748,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e749,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e748,e749).

#pos(e750,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e751,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e750,e751).

#pos(e752,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e753,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e752,e753).

#pos(e754,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e755,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e754,e755).

#pos(e756,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e757,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e756,e757).

#pos(e758,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e759,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e758,e759).

#pos(e760,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e761,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e760,e761).

#pos(e762,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e763,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e762,e763).

#pos(e764,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e765,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e764,e765).

#pos(e766,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e767,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e766,e767).

#pos(e768,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e769,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e768,e769).

#pos(e770,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e771,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e770,e771).

#pos(e772,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e773,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e772,e773).

#pos(e774,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e775,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e774,e775).

#pos(e776,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e777,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e776,e777).

#pos(e778,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e779,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e778,e779).

#pos(e780,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e781,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e780,e781).

#pos(e782,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e783,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e782,e783).

#pos(e784,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e785,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e784,e785).

#pos(e786,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e787,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e786,e787).

#pos(e788,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e789,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e788,e789).

#pos(e790,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e791,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e790,e791).

#pos(e792,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e793,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e792,e793).

#pos(e794,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e795,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e794,e795).

#pos(e796,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(a,remove(4,5)). 
}).
#pos(e797,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e796,e797).

#pos(e798,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e799,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e798,e799).

#pos(e800,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e801,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e800,e801).

#pos(e802,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e803,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e802,e803).

#pos(e804,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e805,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e804,e805).

#pos(e806,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e807,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,0)). does(b,remove(4,5)). 
}).
#brave_ordering(e806,e807).

#pos(e808,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e809,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e808,e809).

#pos(e810,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e811,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e810,e811).

#pos(e812,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e813,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e812,e813).

#pos(e814,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e815,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e814,e815).

#pos(e816,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e817,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e816,e817).

#pos(e818,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e819,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e818,e819).

#pos(e820,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e821,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e820,e821).

#pos(e822,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e823,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e822,e823).

#pos(e824,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e825,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e824,e825).

#pos(e826,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e827,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e826,e827).

#pos(e828,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e829,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e828,e829).

#pos(e830,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e831,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e830,e831).

#pos(e832,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e833,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e832,e833).

#pos(e834,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e835,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e834,e835).

#pos(e836,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e837,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e836,e837).

#pos(e838,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e839,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e838,e839).

#pos(e840,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e841,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e840,e841).

#pos(e842,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e843,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e842,e843).

#pos(e844,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e845,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e844,e845).

#pos(e846,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e847,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e846,e847).

#pos(e848,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e849,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e848,e849).

#pos(e850,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e851,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e850,e851).

#pos(e852,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e853,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e852,e853).

#pos(e854,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e855,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e854,e855).

#pos(e856,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e857,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e856,e857).

#pos(e858,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e859,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e858,e859).

#pos(e860,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e861,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e860,e861).

#pos(e862,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e863,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e862,e863).

#pos(e864,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e865,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e864,e865).

#pos(e866,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e867,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e866,e867).

#pos(e868,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e869,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e868,e869).

#pos(e870,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e871,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e870,e871).

#pos(e872,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e873,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e872,e873).

#pos(e874,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e875,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e874,e875).

#pos(e876,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e877,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e876,e877).

#pos(e878,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e879,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e878,e879).

#pos(e880,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e881,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e880,e881).

#pos(e882,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e883,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e882,e883).

#pos(e884,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e885,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e884,e885).

#pos(e886,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e887,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e886,e887).

#pos(e888,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e889,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e888,e889).

#pos(e890,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e891,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e890,e891).

#pos(e892,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e893,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e892,e893).

#pos(e894,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e895,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e894,e895).

#pos(e896,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e897,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e896,e897).

#pos(e898,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e899,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#brave_ordering(e898,e899).

#pos(e900,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e901,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e900,e901).

#pos(e902,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e903,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e902,e903).

#pos(e904,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e905,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e904,e905).

#pos(e906,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e907,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e906,e907).

#pos(e908,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e909,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e908,e909).

#pos(e910,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e911,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e910,e911).

#pos(e912,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e913,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e912,e913).

#pos(e914,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e915,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e914,e915).

#pos(e916,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e917,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e916,e917).

#pos(e918,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e919,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e918,e919).

#pos(e920,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e921,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e920,e921).

#pos(e922,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e923,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e922,e923).

#pos(e924,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e925,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e924,e925).

#pos(e926,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e927,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e926,e927).

#pos(e928,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e929,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e928,e929).

#pos(e930,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e931,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e930,e931).

#pos(e932,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e933,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e932,e933).

#pos(e934,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,5)). 
}).
#pos(e935,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e934,e935).

#pos(e936,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,5)). 
}).
#pos(e937,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e936,e937).

#pos(e938,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,5)). 
}).
#pos(e939,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e938,e939).

#pos(e940,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,5)). 
}).
#pos(e941,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,5)). true(has(3,1)). does(b,remove(4,4)). 
}).
#brave_ordering(e940,e941).

#pos(e942,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e943,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e942,e943).

#pos(e944,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e945,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e944,e945).

#pos(e946,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e947,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e946,e947).

#pos(e948,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e949,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e948,e949).

#pos(e950,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e951,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e950,e951).

#pos(e952,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e953,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e952,e953).

#pos(e954,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,1)). does(b,remove(3,3)). 
}).
#pos(e955,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,3)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e954,e955).

#pos(e956,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e957,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e956,e957).

#pos(e958,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e959,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e958,e959).

#pos(e960,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e961,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e960,e961).

#pos(e962,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e963,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e962,e963).

#pos(e964,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e965,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e964,e965).

#pos(e966,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e967,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e966,e967).

#pos(e968,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e969,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e968,e969).

#pos(e970,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e971,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e970,e971).

#pos(e972,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e973,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e972,e973).

#pos(e974,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e975,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e974,e975).

#pos(e976,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e977,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e976,e977).

#pos(e978,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e979,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e978,e979).

#pos(e980,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e981,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e980,e981).

#pos(e982,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e983,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e982,e983).

#pos(e984,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e985,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e984,e985).

#pos(e986,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e987,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e986,e987).

#pos(e988,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e989,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e988,e989).

#pos(e990,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#pos(e991,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e990,e991).

#pos(e992,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#pos(e993,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e992,e993).

#pos(e994,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e995,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e994,e995).

#pos(e996,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e997,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e996,e997).

#pos(e998,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e999,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e998,e999).

#pos(e1000,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1001,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1000,e1001).

#pos(e1002,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1003,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1002,e1003).

#pos(e1004,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1005,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1004,e1005).

#pos(e1006,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1007,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1006,e1007).

#pos(e1008,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1009,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e1008,e1009).

#pos(e1010,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1011,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1010,e1011).

#pos(e1012,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1013,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1012,e1013).

#pos(e1014,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1015,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1014,e1015).

#pos(e1016,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1017,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1016,e1017).

#pos(e1018,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1019,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1018,e1019).

#pos(e1020,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1021,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e1020,e1021).

#pos(e1022,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1023,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1022,e1023).

#pos(e1024,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1025,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1024,e1025).

#pos(e1026,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1027,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1026,e1027).

#pos(e1028,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1029,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1028,e1029).

#pos(e1030,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1031,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1030,e1031).

#pos(e1032,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1033,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1032,e1033).

#pos(e1034,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1035,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e1034,e1035).

#pos(e1036,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1037,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1036,e1037).

#pos(e1038,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1039,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#brave_ordering(e1038,e1039).

#pos(e1040,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1041,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1040,e1041).

#pos(e1042,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,1)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e1043,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,1)). true(has(2,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e1042,e1043).

#pos(e1044,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(3,3)). 
}).
#pos(e1045,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1044,e1045).

#pos(e1046,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1047,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1046,e1047).

#pos(e1048,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e1049,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1048,e1049).

#pos(e1050,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e1051,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1050,e1051).

#pos(e1052,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e1053,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1052,e1053).

#pos(e1054,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e1055,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1054,e1055).

#pos(e1056,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e1057,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e1056,e1057).

#pos(e1058,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#pos(e1059,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1058,e1059).

#pos(e1060,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e1061,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e1060,e1061).

#pos(e1062,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e1063,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1062,e1063).

#pos(e1064,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1065,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1064,e1065).

#pos(e1066,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1067,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1066,e1067).

#pos(e1068,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1069,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,1)). true(has(1,0)). true(has(4,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e1068,e1069).

#pos(e1070,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1071,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1070,e1071).

#pos(e1072,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1073,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1072,e1073).

#pos(e1074,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1075,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1074,e1075).

#pos(e1076,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1077,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1076,e1077).

#pos(e1078,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1079,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1078,e1079).

#pos(e1080,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1081,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1080,e1081).

#pos(e1082,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1083,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1082,e1083).

#pos(e1084,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1085,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1084,e1085).

#pos(e1086,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1087,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1086,e1087).

#pos(e1088,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1089,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1088,e1089).

#pos(e1090,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1091,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1090,e1091).

#pos(e1092,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e1093,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1092,e1093).

#pos(e1094,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e1095,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1094,e1095).

#pos(e1096,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1097,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1096,e1097).

#pos(e1098,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1099,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1098,e1099).

#pos(e1100,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1101,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1100,e1101).

#pos(e1102,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1103,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1102,e1103).

#pos(e1104,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#pos(e1105,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e1104,e1105).

#pos(e1106,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#pos(e1107,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1106,e1107).

#pos(e1108,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1109,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1108,e1109).

#pos(e1110,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1111,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1110,e1111).

#pos(e1112,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1113,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e1112,e1113).

#pos(e1114,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1115,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e1114,e1115).

#pos(e1116,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1117,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e1116,e1117).

#pos(e1118,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e1119,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(4,5)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1118,e1119).

#pos(e1120,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1121,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1120,e1121).

#pos(e1122,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e1123,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1122,e1123).

#pos(e1124,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e1125,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1124,e1125).

#pos(e1126,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e1127,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e1126,e1127).

#pos(e1128,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e1129,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1128,e1129).

#pos(e1130,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e1131,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e1130,e1131).

#pos(e1132,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e1133,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1132,e1133).

#pos(e1134,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e1135,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1134,e1135).

#pos(e1136,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e1137,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1136,e1137).

#pos(e1138,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e1139,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,3)). 
}).
#brave_ordering(e1138,e1139).

#pos(e1140,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e1141,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1140,e1141).

#pos(e1142,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e1143,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1142,e1143).

#pos(e1144,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e1145,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1144,e1145).

#pos(e1146,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e1147,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e1146,e1147).

#pos(e1148,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e1149,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1148,e1149).

#pos(e1150,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e1151,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e1150,e1151).

#pos(e1152,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1153,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1152,e1153).

#pos(e1154,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1155,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1154,e1155).

#pos(e1156,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1157,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1156,e1157).

#pos(e1158,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1159,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1158,e1159).

#pos(e1160,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1161,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1160,e1161).

#pos(e1162,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1163,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1162,e1163).

#pos(e1164,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1165,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1164,e1165).

#pos(e1166,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1167,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1166,e1167).

#pos(e1168,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1169,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1168,e1169).

#pos(e1170,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1171,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1170,e1171).

#pos(e1172,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e1173,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1172,e1173).

#pos(e1174,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1175,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e1174,e1175).

#pos(e1176,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1177,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e1176,e1177).

#pos(e1178,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1179,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e1178,e1179).

#pos(e1180,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1181,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e1180,e1181).

#pos(e1182,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1183,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1182,e1183).

#pos(e1184,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1185,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1184,e1185).

#pos(e1186,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1187,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1186,e1187).

#pos(e1188,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1189,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1188,e1189).

#pos(e1190,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1191,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e1190,e1191).

#pos(e1192,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1193,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e1192,e1193).

#pos(e1194,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1195,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1194,e1195).

#pos(e1196,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1197,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1196,e1197).

#pos(e1198,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1199,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1198,e1199).

#pos(e1200,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1201,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1200,e1201).

#pos(e1202,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1203,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1202,e1203).

#pos(e1204,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,0)). true(has(2,0)). does(a,remove(4,5)). 
}).
#pos(e1205,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e1204,e1205).

#pos(e1206,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#pos(e1207,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1206,e1207).

#pos(e1208,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#pos(e1209,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1208,e1209).

#pos(e1210,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#pos(e1211,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1210,e1211).

#pos(e1212,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#pos(e1213,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1212,e1213).

#pos(e1214,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#pos(e1215,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,5)). 
}).
#brave_ordering(e1214,e1215).

#pos(e1216,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e1217,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1216,e1217).

#pos(e1218,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1219,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1218,e1219).

#pos(e1220,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1221,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1220,e1221).

#pos(e1222,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1223,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1222,e1223).

#pos(e1224,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1225,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1224,e1225).

#pos(e1226,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1227,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1226,e1227).

#pos(e1228,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1229,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1228,e1229).

#pos(e1230,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1231,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1230,e1231).

#pos(e1232,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1233,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1232,e1233).

#pos(e1234,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1235,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e1234,e1235).

#pos(e1236,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1237,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1236,e1237).

#pos(e1238,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1239,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e1238,e1239).

#pos(e1240,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1241,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1240,e1241).

#pos(e1242,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1243,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1242,e1243).

#pos(e1244,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1245,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e1244,e1245).

#pos(e1246,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1247,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e1246,e1247).

#pos(e1248,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1249,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1248,e1249).

#pos(e1250,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e1251,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1250,e1251).

#pos(e1252,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1253,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1252,e1253).

#pos(e1254,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1255,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1254,e1255).

#pos(e1256,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1257,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1256,e1257).

#pos(e1258,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1259,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1258,e1259).

#pos(e1260,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1261,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1260,e1261).

#pos(e1262,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1263,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1262,e1263).

#pos(e1264,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1265,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1264,e1265).

#pos(e1266,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1267,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1266,e1267).

#pos(e1268,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1269,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1268,e1269).

#pos(e1270,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e1271,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1270,e1271).

#pos(e1272,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1273,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1272,e1273).

#pos(e1274,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1275,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1274,e1275).

#pos(e1276,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1277,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1276,e1277).

#pos(e1278,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1279,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e1278,e1279).

#pos(e1280,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1281,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1280,e1281).

#pos(e1282,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1283,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1282,e1283).

#pos(e1284,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1285,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1284,e1285).

#pos(e1286,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1287,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1286,e1287).

#pos(e1288,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1289,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1288,e1289).

#pos(e1290,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e1291,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1290,e1291).

#pos(e1292,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e1293,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1292,e1293).

#pos(e1294,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e1295,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1294,e1295).

#pos(e1296,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e1297,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1296,e1297).

#pos(e1298,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e1299,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1298,e1299).

#pos(e1300,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e1301,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1300,e1301).

#pos(e1302,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e1303,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e1302,e1303).

#pos(e1304,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e1305,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1304,e1305).

#pos(e1306,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1307,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1306,e1307).

#pos(e1308,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1309,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1308,e1309).

#pos(e1310,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1311,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1310,e1311).

#pos(e1312,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e1313,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1312,e1313).

#pos(e1314,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e1315,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1314,e1315).

#pos(e1316,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1317,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(2,2)). 
}).
#brave_ordering(e1316,e1317).

#pos(e1318,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1319,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e1318,e1319).

#pos(e1320,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1321,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e1320,e1321).

#pos(e1322,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1323,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1322,e1323).

#pos(e1324,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1325,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1324,e1325).

#pos(e1326,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1327,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e1326,e1327).

#pos(e1328,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1329,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1328,e1329).

#pos(e1330,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e1331,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1330,e1331).

#pos(e1332,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1333,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1332,e1333).

#pos(e1334,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1335,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1334,e1335).

#pos(e1336,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e1337,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1336,e1337).

#pos(e1338,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e1339,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1338,e1339).

#pos(e1340,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e1341,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(2,2)). 
}).
#brave_ordering(e1340,e1341).

#pos(e1342,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e1343,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#brave_ordering(e1342,e1343).

#pos(e1344,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e1345,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e1344,e1345).

#pos(e1346,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e1347,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(2,1)). 
}).
#brave_ordering(e1346,e1347).

#pos(e1348,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e1349,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e1348,e1349).

#pos(e1350,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e1351,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1350,e1351).

#pos(e1352,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e1353,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e1352,e1353).

#pos(e1354,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e1355,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1354,e1355).

#pos(e1356,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1357,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1356,e1357).

#pos(e1358,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e1359,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1358,e1359).

#pos(e1360,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e1361,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1360,e1361).

#pos(e1362,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1363,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1362,e1363).

#pos(e1364,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1365,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e1364,e1365).

#pos(e1366,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1367,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1366,e1367).

#pos(e1368,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1369,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1368,e1369).

#pos(e1370,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1371,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1370,e1371).

#pos(e1372,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1373,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e1372,e1373).

#pos(e1374,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e1375,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1374,e1375).

#pos(e1376,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1377,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1376,e1377).

#pos(e1378,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1379,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1378,e1379).

#pos(e1380,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1381,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1380,e1381).

#pos(e1382,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1383,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1382,e1383).

#pos(e1384,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1385,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1384,e1385).

#pos(e1386,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1387,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1386,e1387).

#pos(e1388,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1389,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1388,e1389).

#pos(e1390,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1391,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1390,e1391).

#pos(e1392,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1393,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1392,e1393).

#pos(e1394,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e1395,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1394,e1395).

#pos(e1396,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e1397,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1396,e1397).

#pos(e1398,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e1399,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1398,e1399).

#pos(e1400,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e1401,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1400,e1401).

#pos(e1402,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e1403,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e1402,e1403).

#pos(e1404,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1405,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1404,e1405).

#pos(e1406,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e1407,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1406,e1407).

#pos(e1408,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1409,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1408,e1409).

#pos(e1410,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1411,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1410,e1411).

#pos(e1412,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1413,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1412,e1413).

#pos(e1414,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1415,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1414,e1415).

#pos(e1416,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#pos(e1417,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1416,e1417).

#pos(e1418,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#pos(e1419,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(3,3)). 
}).
#brave_ordering(e1418,e1419).

#pos(e1420,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#pos(e1421,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1420,e1421).

#pos(e1422,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#pos(e1423,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1422,e1423).

#pos(e1424,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e1425,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e1424,e1425).

#pos(e1426,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e1427,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1426,e1427).

#pos(e1428,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e1429,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,3)). 
}).
#brave_ordering(e1428,e1429).

#pos(e1430,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e1431,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1430,e1431).

#pos(e1432,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e1433,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1432,e1433).

#pos(e1434,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1435,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1434,e1435).

#pos(e1436,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1437,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1436,e1437).

#pos(e1438,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1439,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1438,e1439).

#pos(e1440,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1441,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1440,e1441).

#pos(e1442,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1443,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1442,e1443).

#pos(e1444,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1445,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1444,e1445).

#pos(e1446,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1447,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1446,e1447).

#pos(e1448,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1449,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1448,e1449).

#pos(e1450,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1451,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1450,e1451).

#pos(e1452,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1453,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1452,e1453).

#pos(e1454,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1455,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1454,e1455).

#pos(e1456,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1457,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1456,e1457).

#pos(e1458,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1459,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e1458,e1459).

#pos(e1460,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1461,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1460,e1461).

#pos(e1462,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1463,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1462,e1463).

#pos(e1464,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1465,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1464,e1465).

#pos(e1466,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1467,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1466,e1467).

#pos(e1468,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1469,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1468,e1469).

#pos(e1470,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1471,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1470,e1471).

#pos(e1472,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1473,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e1472,e1473).

#pos(e1474,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1475,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1474,e1475).

#pos(e1476,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1477,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#brave_ordering(e1476,e1477).

#pos(e1478,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1479,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1478,e1479).

#pos(e1480,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e1481,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(3,3)). 
}).
#brave_ordering(e1480,e1481).

#pos(e1482,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e1483,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#brave_ordering(e1482,e1483).

#pos(e1484,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e1485,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e1484,e1485).

#pos(e1486,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e1487,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(3,2)). 
}).
#brave_ordering(e1486,e1487).

#pos(e1488,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e1489,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e1488,e1489).

#pos(e1490,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1491,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1490,e1491).

#pos(e1492,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1493,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1492,e1493).

#pos(e1494,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1495,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1494,e1495).

#pos(e1496,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1497,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1496,e1497).

#pos(e1498,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1499,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1498,e1499).

#pos(e1500,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1501,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1500,e1501).

#pos(e1502,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e1503,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e1502,e1503).

#pos(e1504,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e1505,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1504,e1505).

#pos(e1506,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1507,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1506,e1507).

#pos(e1508,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,2)). 
}).
#pos(e1509,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,3)). 
}).
#brave_ordering(e1508,e1509).

#pos(e1510,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,2)). 
}).
#pos(e1511,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,4)). 
}).
#brave_ordering(e1510,e1511).

#pos(e1512,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,2)). 
}).
#pos(e1513,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1512,e1513).

#pos(e1514,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1515,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1514,e1515).

#pos(e1516,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1517,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1516,e1517).

#pos(e1518,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1519,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1518,e1519).

#pos(e1520,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1521,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1520,e1521).

#pos(e1522,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1523,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e1522,e1523).

#pos(e1524,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1525,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1524,e1525).

#pos(e1526,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1527,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1526,e1527).

#pos(e1528,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1529,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1528,e1529).

#pos(e1530,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1531,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1530,e1531).

#pos(e1532,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1533,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1532,e1533).

#pos(e1534,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1535,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e1534,e1535).

#pos(e1536,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1537,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e1536,e1537).

#pos(e1538,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1539,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1538,e1539).

#pos(e1540,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1541,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1540,e1541).

#pos(e1542,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1543,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1542,e1543).

#pos(e1544,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1545,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1544,e1545).

#pos(e1546,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1547,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1546,e1547).

#pos(e1548,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1549,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1548,e1549).

#pos(e1550,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1551,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e1550,e1551).

#pos(e1552,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1553,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e1552,e1553).

#pos(e1554,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1555,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e1554,e1555).

#pos(e1556,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1557,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e1556,e1557).

#pos(e1558,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#pos(e1559,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1558,e1559).

#pos(e1560,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#pos(e1561,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1560,e1561).

#pos(e1562,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#pos(e1563,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1562,e1563).

#pos(e1564,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1565,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1564,e1565).

#pos(e1566,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1567,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1566,e1567).

#pos(e1568,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1569,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e1568,e1569).

#pos(e1570,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1571,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1570,e1571).

#pos(e1572,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1573,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1572,e1573).

#pos(e1574,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1575,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1574,e1575).

#pos(e1576,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1577,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1576,e1577).

#pos(e1578,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1579,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1578,e1579).

#pos(e1580,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1581,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1580,e1581).

#pos(e1582,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1583,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1582,e1583).

#pos(e1584,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1585,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1584,e1585).

#pos(e1586,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1587,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1586,e1587).

#pos(e1588,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1589,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1588,e1589).

#pos(e1590,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1591,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1590,e1591).

#pos(e1592,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1593,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1592,e1593).

#pos(e1594,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e1595,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e1594,e1595).

#pos(e1596,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e1597,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1596,e1597).

#pos(e1598,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1599,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1598,e1599).

#pos(e1600,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1601,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1600,e1601).

#pos(e1602,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1603,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1602,e1603).

#pos(e1604,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1605,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1604,e1605).

#pos(e1606,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1607,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1606,e1607).

#pos(e1608,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1609,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,2)). 
}).
#brave_ordering(e1608,e1609).

#pos(e1610,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1611,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e1610,e1611).

#pos(e1612,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1613,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e1612,e1613).

#pos(e1614,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e1615,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1614,e1615).

#pos(e1616,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1617,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1616,e1617).

#pos(e1618,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1619,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1618,e1619).

#pos(e1620,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1621,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1620,e1621).

#pos(e1622,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1623,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1622,e1623).

#pos(e1624,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#pos(e1625,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1624,e1625).

#pos(e1626,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#pos(e1627,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,4)). 
}).
#brave_ordering(e1626,e1627).

#pos(e1628,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#pos(e1629,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,5)). 
}).
#brave_ordering(e1628,e1629).

#pos(e1630,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#pos(e1631,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1630,e1631).

#pos(e1632,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#pos(e1633,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1632,e1633).

#pos(e1634,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,5)). 
}).
#pos(e1635,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1634,e1635).

#pos(e1636,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1637,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1636,e1637).

#pos(e1638,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1639,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1638,e1639).

#pos(e1640,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1641,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1640,e1641).

#pos(e1642,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1643,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e1642,e1643).

#pos(e1644,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e1645,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e1644,e1645).

#pos(e1646,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1647,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1646,e1647).

#pos(e1648,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1649,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1648,e1649).

#pos(e1650,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1651,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1650,e1651).

#pos(e1652,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e1653,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1652,e1653).

#pos(e1654,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e1655,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1654,e1655).

#pos(e1656,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e1657,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1656,e1657).

#pos(e1658,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e1659,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1658,e1659).

#pos(e1660,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1661,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1660,e1661).

#pos(e1662,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1663,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1662,e1663).

#pos(e1664,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1665,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1664,e1665).

#pos(e1666,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1667,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1666,e1667).

#pos(e1668,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1669,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1668,e1669).

#pos(e1670,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e1671,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(3,3)). 
}).
#brave_ordering(e1670,e1671).

#pos(e1672,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e1673,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1672,e1673).

#pos(e1674,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e1675,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1674,e1675).

#pos(e1676,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1677,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1676,e1677).

#pos(e1678,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1679,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1678,e1679).

#pos(e1680,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1681,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1680,e1681).

#pos(e1682,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1683,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e1682,e1683).

#pos(e1684,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1685,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1684,e1685).

#pos(e1686,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1687,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1686,e1687).

#pos(e1688,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1689,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1688,e1689).

#pos(e1690,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1691,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1690,e1691).

#pos(e1692,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1693,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1692,e1693).

#pos(e1694,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1695,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1694,e1695).

#pos(e1696,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1697,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1696,e1697).

#pos(e1698,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1699,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1698,e1699).

#pos(e1700,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1701,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1700,e1701).

#pos(e1702,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1703,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1702,e1703).

#pos(e1704,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1705,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1704,e1705).

#pos(e1706,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1707,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1706,e1707).

#pos(e1708,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1709,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1708,e1709).

#pos(e1710,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1711,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1710,e1711).

#pos(e1712,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1713,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1712,e1713).

#pos(e1714,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1715,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1714,e1715).

#pos(e1716,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1717,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1716,e1717).

#pos(e1718,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1719,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1718,e1719).

#pos(e1720,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e1721,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1720,e1721).

#pos(e1722,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e1723,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e1722,e1723).

#pos(e1724,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1725,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e1724,e1725).

#pos(e1726,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1727,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e1726,e1727).

#pos(e1728,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1729,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e1728,e1729).

#pos(e1730,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1731,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1730,e1731).

#pos(e1732,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1733,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1732,e1733).

#pos(e1734,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1735,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e1734,e1735).

#pos(e1736,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1737,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,5)). true(has(2,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e1736,e1737).

#pos(e1738,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1739,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1738,e1739).

#pos(e1740,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1741,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1740,e1741).

#pos(e1742,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1743,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1742,e1743).

#pos(e1744,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1745,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1744,e1745).

#pos(e1746,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1747,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1746,e1747).

#pos(e1748,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1749,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1748,e1749).

#pos(e1750,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1751,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1750,e1751).

#pos(e1752,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1753,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1752,e1753).

#pos(e1754,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e1755,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e1754,e1755).

#pos(e1756,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e1757,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1756,e1757).

#pos(e1758,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e1759,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1758,e1759).

#pos(e1760,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1761,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e1760,e1761).

#pos(e1762,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e1763,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1762,e1763).

#pos(e1764,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1765,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1764,e1765).

#pos(e1766,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1767,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e1766,e1767).

#pos(e1768,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1769,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1768,e1769).

#pos(e1770,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e1771,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e1770,e1771).

#pos(e1772,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1773,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1772,e1773).

#pos(e1774,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1775,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1774,e1775).

#pos(e1776,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1777,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1776,e1777).

#pos(e1778,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1779,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1778,e1779).

#pos(e1780,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1781,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1780,e1781).

#pos(e1782,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1783,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e1782,e1783).

#pos(e1784,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1785,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1784,e1785).

#pos(e1786,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1787,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e1786,e1787).

#pos(e1788,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e1789,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1788,e1789).

#pos(e1790,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1791,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1790,e1791).

#pos(e1792,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1793,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1792,e1793).

#pos(e1794,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1795,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1794,e1795).

#pos(e1796,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1797,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e1796,e1797).

#pos(e1798,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1799,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1798,e1799).

#pos(e1800,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e1801,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e1800,e1801).

#pos(e1802,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e1803,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1802,e1803).

#pos(e1804,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1805,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1804,e1805).

#pos(e1806,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1807,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e1806,e1807).

#pos(e1808,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e1809,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1808,e1809).

#pos(e1810,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1811,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1810,e1811).

#pos(e1812,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1813,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1812,e1813).

#pos(e1814,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1815,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1814,e1815).

#pos(e1816,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1817,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1816,e1817).

#pos(e1818,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1819,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1818,e1819).

#pos(e1820,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1821,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e1820,e1821).

#pos(e1822,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1823,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1822,e1823).

#pos(e1824,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1825,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,3)). 
}).
#brave_ordering(e1824,e1825).

#pos(e1826,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e1827,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1826,e1827).

#pos(e1828,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#pos(e1829,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e1828,e1829).

#pos(e1830,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1831,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1830,e1831).

#pos(e1832,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1833,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1832,e1833).

#pos(e1834,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1835,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e1834,e1835).

#pos(e1836,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e1837,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1836,e1837).

#pos(e1838,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1839,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1838,e1839).

#pos(e1840,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1841,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1840,e1841).

#pos(e1842,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1843,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1842,e1843).

#pos(e1844,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e1845,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e1844,e1845).

#pos(e1846,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1847,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1846,e1847).

#pos(e1848,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1849,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1848,e1849).

#pos(e1850,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1851,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e1850,e1851).

#pos(e1852,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1853,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e1852,e1853).

#pos(e1854,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e1855,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e1854,e1855).

#pos(e1856,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,2)). 
}).
#pos(e1857,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e1856,e1857).

#pos(e1858,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,2)). 
}).
#pos(e1859,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(3,3)). 
}).
#brave_ordering(e1858,e1859).

#pos(e1860,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e1861,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1860,e1861).

#pos(e1862,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e1863,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1862,e1863).

#pos(e1864,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e1865,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e1864,e1865).

#pos(e1866,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e1867,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e1866,e1867).

#pos(e1868,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1869,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1868,e1869).

#pos(e1870,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1871,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e1870,e1871).

#pos(e1872,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e1873,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e1872,e1873).

#pos(e1874,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1875,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1874,e1875).

#pos(e1876,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e1877,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e1876,e1877).

#pos(e1878,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e1879,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1878,e1879).

#pos(e1880,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e1881,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e1880,e1881).

#pos(e1882,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1883,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1882,e1883).

#pos(e1884,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1885,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1884,e1885).

#pos(e1886,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1887,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1886,e1887).

#pos(e1888,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1889,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1888,e1889).

#pos(e1890,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1891,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1890,e1891).

#pos(e1892,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1893,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1892,e1893).

#pos(e1894,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1895,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1894,e1895).

#pos(e1896,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1897,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1896,e1897).

#pos(e1898,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1899,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1898,e1899).

#pos(e1900,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1901,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e1900,e1901).

#pos(e1902,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1903,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e1902,e1903).

#pos(e1904,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1905,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1904,e1905).

#pos(e1906,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1907,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1906,e1907).

#pos(e1908,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1909,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1908,e1909).

#pos(e1910,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1911,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1910,e1911).

#pos(e1912,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1913,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1912,e1913).

#pos(e1914,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e1915,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1914,e1915).

#pos(e1916,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1917,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(2,1)). 
}).
#brave_ordering(e1916,e1917).

#pos(e1918,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1919,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e1918,e1919).

#pos(e1920,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1921,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e1920,e1921).

#pos(e1922,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e1923,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e1922,e1923).

#pos(e1924,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1925,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1924,e1925).

#pos(e1926,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e1927,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1926,e1927).

#pos(e1928,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,5)). 
}).
#pos(e1929,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1928,e1929).

#pos(e1930,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1931,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e1930,e1931).

#pos(e1932,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1933,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e1932,e1933).

#pos(e1934,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1935,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1934,e1935).

#pos(e1936,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1937,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1936,e1937).

#pos(e1938,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e1939,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e1938,e1939).

#pos(e1940,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e1941,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1940,e1941).

#pos(e1942,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1943,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e1942,e1943).

#pos(e1944,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1945,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1944,e1945).

#pos(e1946,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e1947,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1946,e1947).

#pos(e1948,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1949,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e1948,e1949).

#pos(e1950,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1951,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1950,e1951).

#pos(e1952,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e1953,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1952,e1953).

#pos(e1954,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1955,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e1954,e1955).

#pos(e1956,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1957,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e1956,e1957).

#pos(e1958,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e1959,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e1958,e1959).

#pos(e1960,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e1961,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e1960,e1961).

#pos(e1962,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e1963,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1962,e1963).

#pos(e1964,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1965,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e1964,e1965).

#pos(e1966,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1967,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1966,e1967).

#pos(e1968,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1969,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e1968,e1969).

#pos(e1970,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e1971,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e1970,e1971).

#pos(e1972,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e1973,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1972,e1973).

#pos(e1974,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1975,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e1974,e1975).

#pos(e1976,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e1977,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e1976,e1977).

#pos(e1978,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e1979,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1978,e1979).

#pos(e1980,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1981,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e1980,e1981).

#pos(e1982,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1983,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e1982,e1983).

#pos(e1984,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e1985,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e1984,e1985).

#pos(e1986,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e1987,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e1986,e1987).

#pos(e1988,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1989,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e1988,e1989).

#pos(e1990,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e1991,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e1990,e1991).

#pos(e1992,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e1993,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e1992,e1993).

#pos(e1994,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e1995,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e1994,e1995).

#pos(e1996,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e1997,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e1996,e1997).

#pos(e1998,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e1999,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e1998,e1999).

#pos(e2000,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2001,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2000,e2001).

#pos(e2002,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2003,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2002,e2003).

#pos(e2004,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2005,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2004,e2005).

#pos(e2006,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2007,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2006,e2007).

#pos(e2008,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2009,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2008,e2009).

#pos(e2010,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2011,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2010,e2011).

#pos(e2012,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2013,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2012,e2013).

#pos(e2014,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2015,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2014,e2015).

#pos(e2016,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2017,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e2016,e2017).

#pos(e2018,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2019,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e2018,e2019).

#pos(e2020,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e2021,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e2020,e2021).

#pos(e2022,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2023,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2022,e2023).

#pos(e2024,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2025,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2024,e2025).

#pos(e2026,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2027,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2026,e2027).

#pos(e2028,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2029,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2028,e2029).

#pos(e2030,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2031,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2030,e2031).

#pos(e2032,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2033,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2032,e2033).

#pos(e2034,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e2035,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2034,e2035).

#pos(e2036,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e2037,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2036,e2037).

#pos(e2038,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2039,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e2038,e2039).

#pos(e2040,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2041,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2040,e2041).

#pos(e2042,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e2043,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2042,e2043).

#pos(e2044,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e2045,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2044,e2045).

#pos(e2046,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2047,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2046,e2047).

#pos(e2048,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2049,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2048,e2049).

#pos(e2050,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2051,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2050,e2051).

#pos(e2052,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2053,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2052,e2053).

#pos(e2054,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2055,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2054,e2055).

#pos(e2056,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2057,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2056,e2057).

#pos(e2058,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2059,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2058,e2059).

#pos(e2060,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2061,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2060,e2061).

#pos(e2062,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2063,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2062,e2063).

#pos(e2064,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2065,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2064,e2065).

#pos(e2066,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2067,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2066,e2067).

#pos(e2068,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2069,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2068,e2069).

#pos(e2070,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2071,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2070,e2071).

#pos(e2072,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2073,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2072,e2073).

#pos(e2074,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2075,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2074,e2075).

#pos(e2076,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2077,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2076,e2077).

#pos(e2078,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e2079,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2078,e2079).

#pos(e2080,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e2081,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2080,e2081).

#pos(e2082,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2083,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2082,e2083).

#pos(e2084,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2085,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2084,e2085).

#pos(e2086,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2087,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2086,e2087).

#pos(e2088,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2089,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2088,e2089).

#pos(e2090,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2091,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2090,e2091).

#pos(e2092,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2093,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2092,e2093).

#pos(e2094,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2095,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2094,e2095).

#pos(e2096,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e2097,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2096,e2097).

#pos(e2098,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2099,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e2098,e2099).

#pos(e2100,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2101,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2100,e2101).

#pos(e2102,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2103,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2102,e2103).

#pos(e2104,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2105,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2104,e2105).

#pos(e2106,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2107,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2106,e2107).

#pos(e2108,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2109,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2108,e2109).

#pos(e2110,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2111,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2110,e2111).

#pos(e2112,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2113,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2112,e2113).

#pos(e2114,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2115,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2114,e2115).

#pos(e2116,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2117,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e2116,e2117).

#pos(e2118,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2119,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2118,e2119).

#pos(e2120,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2121,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2120,e2121).

#pos(e2122,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2123,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2122,e2123).

#pos(e2124,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2125,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2124,e2125).

#pos(e2126,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2127,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2126,e2127).

#pos(e2128,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2129,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2128,e2129).

#pos(e2130,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2131,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2130,e2131).

#pos(e2132,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2133,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2132,e2133).

#pos(e2134,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2135,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2134,e2135).

#pos(e2136,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2137,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2136,e2137).

#pos(e2138,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2139,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2138,e2139).

#pos(e2140,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2141,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2140,e2141).

#pos(e2142,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e2143,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2142,e2143).

#pos(e2144,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e2145,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e2144,e2145).

#pos(e2146,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e2147,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2146,e2147).

#pos(e2148,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e2149,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e2148,e2149).

#pos(e2150,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e2151,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2150,e2151).

#pos(e2152,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e2153,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,3)). 
}).
#brave_ordering(e2152,e2153).

#pos(e2154,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e2155,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e2154,e2155).

#pos(e2156,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e2157,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e2156,e2157).

#pos(e2158,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e2159,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(3,2)). 
}).
#brave_ordering(e2158,e2159).

#pos(e2160,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#pos(e2161,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e2160,e2161).

#pos(e2162,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e2163,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2162,e2163).

#pos(e2164,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2165,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2164,e2165).

#pos(e2166,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2167,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2166,e2167).

#pos(e2168,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2169,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2168,e2169).

#pos(e2170,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2171,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2170,e2171).

#pos(e2172,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e2173,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2172,e2173).

#pos(e2174,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e2175,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2174,e2175).

#pos(e2176,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e2177,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e2176,e2177).

#pos(e2178,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e2179,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2178,e2179).

#pos(e2180,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e2181,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e2180,e2181).

#pos(e2182,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e2183,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2182,e2183).

#pos(e2184,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2185,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2184,e2185).

#pos(e2186,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2187,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2186,e2187).

#pos(e2188,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2189,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2188,e2189).

#pos(e2190,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2191,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2190,e2191).

#pos(e2192,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2193,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2192,e2193).

#pos(e2194,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2195,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2194,e2195).

#pos(e2196,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2197,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2196,e2197).

#pos(e2198,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2199,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(3,2)). 
}).
#brave_ordering(e2198,e2199).

#pos(e2200,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2201,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e2200,e2201).

#pos(e2202,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2203,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e2202,e2203).

#pos(e2204,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2205,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2204,e2205).

#pos(e2206,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2207,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2206,e2207).

#pos(e2208,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e2209,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e2208,e2209).

#pos(e2210,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e2211,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e2210,e2211).

#pos(e2212,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2213,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2212,e2213).

#pos(e2214,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2215,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2214,e2215).

#pos(e2216,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2217,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2216,e2217).

#pos(e2218,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2219,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2218,e2219).

#pos(e2220,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e2221,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2220,e2221).

#pos(e2222,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2223,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e2222,e2223).

#pos(e2224,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2225,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e2224,e2225).

#pos(e2226,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2227,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e2226,e2227).

#pos(e2228,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2229,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e2228,e2229).

#pos(e2230,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2231,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2230,e2231).

#pos(e2232,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2233,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2232,e2233).

#pos(e2234,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2235,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2234,e2235).

#pos(e2236,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2237,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2236,e2237).

#pos(e2238,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2239,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e2238,e2239).

#pos(e2240,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2241,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e2240,e2241).

#pos(e2242,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2243,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e2242,e2243).

#pos(e2244,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2245,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2244,e2245).

#pos(e2246,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2247,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2246,e2247).

#pos(e2248,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2249,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2248,e2249).

#pos(e2250,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2251,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2250,e2251).

#pos(e2252,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#pos(e2253,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e2252,e2253).

#pos(e2254,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,0)). does(a,remove(4,5)). 
}).
#pos(e2255,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2254,e2255).

#pos(e2256,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2257,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,5)). 
}).
#brave_ordering(e2256,e2257).

#pos(e2258,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2259,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2258,e2259).

#pos(e2260,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2261,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2260,e2261).

#pos(e2262,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2263,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2262,e2263).

#pos(e2264,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e2265,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2264,e2265).

#pos(e2266,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e2267,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2266,e2267).

#pos(e2268,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e2269,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2268,e2269).

#pos(e2270,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e2271,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2270,e2271).

#pos(e2272,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2273,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2272,e2273).

#pos(e2274,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2275,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2274,e2275).

#pos(e2276,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2277,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2276,e2277).

#pos(e2278,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2279,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2278,e2279).

#pos(e2280,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2281,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2280,e2281).

#pos(e2282,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2283,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2282,e2283).

#pos(e2284,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2285,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2284,e2285).

#pos(e2286,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e2287,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2286,e2287).

#pos(e2288,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2289,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e2288,e2289).

#pos(e2290,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2291,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2290,e2291).

#pos(e2292,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2293,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2292,e2293).

#pos(e2294,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2295,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e2294,e2295).

#pos(e2296,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2297,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e2296,e2297).

#pos(e2298,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2299,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e2298,e2299).

#pos(e2300,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e2301,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2300,e2301).

#pos(e2302,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e2303,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e2302,e2303).

#pos(e2304,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#pos(e2305,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2304,e2305).

#pos(e2306,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2307,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2306,e2307).

#pos(e2308,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2309,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2308,e2309).

#pos(e2310,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2311,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2310,e2311).

#pos(e2312,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2313,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2312,e2313).

#pos(e2314,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2315,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2314,e2315).

#pos(e2316,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2317,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2316,e2317).

#pos(e2318,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2319,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2318,e2319).

#pos(e2320,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2321,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2320,e2321).

#pos(e2322,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e2323,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2322,e2323).

#pos(e2324,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2325,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2324,e2325).

#pos(e2326,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2327,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2326,e2327).

#pos(e2328,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2329,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2328,e2329).

#pos(e2330,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e2331,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2330,e2331).

#pos(e2332,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e2333,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e2332,e2333).

#pos(e2334,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e2335,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2334,e2335).

#pos(e2336,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e2337,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2336,e2337).

#pos(e2338,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e2339,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2338,e2339).

#pos(e2340,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2341,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2340,e2341).

#pos(e2342,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2343,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2342,e2343).

#pos(e2344,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2345,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2344,e2345).

#pos(e2346,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2347,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2346,e2347).

#pos(e2348,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e2349,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e2348,e2349).

#pos(e2350,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e2351,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#brave_ordering(e2350,e2351).

#pos(e2352,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e2353,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e2352,e2353).

#pos(e2354,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#pos(e2355,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e2354,e2355).

#pos(e2356,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e2357,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2356,e2357).

#pos(e2358,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2359,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e2358,e2359).

#pos(e2360,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e2361,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2360,e2361).

#pos(e2362,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2363,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2362,e2363).

#pos(e2364,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2365,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2364,e2365).

#pos(e2366,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2367,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2366,e2367).

#pos(e2368,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e2369,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e2368,e2369).

#pos(e2370,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,5)). 
}).
#pos(e2371,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2370,e2371).

#pos(e2372,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2373,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2372,e2373).

#pos(e2374,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2375,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2374,e2375).

#pos(e2376,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2377,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2376,e2377).

#pos(e2378,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e2379,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2378,e2379).

#pos(e2380,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2381,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e2380,e2381).

#pos(e2382,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2383,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e2382,e2383).

#pos(e2384,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2385,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2384,e2385).

#pos(e2386,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2387,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e2386,e2387).

#pos(e2388,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2389,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2388,e2389).

#pos(e2390,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2391,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2390,e2391).

#pos(e2392,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e2393,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2392,e2393).

#pos(e2394,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2395,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2394,e2395).

#pos(e2396,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2397,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2396,e2397).

#pos(e2398,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2399,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2398,e2399).

#pos(e2400,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e2401,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2400,e2401).

#pos(e2402,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e2403,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2402,e2403).

#pos(e2404,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2405,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2404,e2405).

#pos(e2406,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2407,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2406,e2407).

#pos(e2408,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2409,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2408,e2409).

#pos(e2410,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2411,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2410,e2411).

#pos(e2412,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e2413,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2412,e2413).

#pos(e2414,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e2415,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e2414,e2415).

#pos(e2416,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e2417,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2416,e2417).

#pos(e2418,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e2419,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e2418,e2419).

#pos(e2420,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e2421,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2420,e2421).

#pos(e2422,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e2423,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2422,e2423).

#pos(e2424,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2425,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2424,e2425).

#pos(e2426,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2427,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2426,e2427).

#pos(e2428,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2429,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2428,e2429).

#pos(e2430,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2431,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2430,e2431).

#pos(e2432,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2433,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2432,e2433).

#pos(e2434,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2435,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2434,e2435).

#pos(e2436,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2437,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2436,e2437).

#pos(e2438,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e2439,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e2438,e2439).

#pos(e2440,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e2441,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e2440,e2441).

#pos(e2442,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e2443,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2442,e2443).

#pos(e2444,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e2445,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2444,e2445).

#pos(e2446,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e2447,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2446,e2447).

#pos(e2448,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e2449,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e2448,e2449).

#pos(e2450,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e2451,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,1)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2450,e2451).

#pos(e2452,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2453,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2452,e2453).

#pos(e2454,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2455,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2454,e2455).

#pos(e2456,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2457,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2456,e2457).

#pos(e2458,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2459,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2458,e2459).

#pos(e2460,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2461,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2460,e2461).

#pos(e2462,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2463,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2462,e2463).

#pos(e2464,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2465,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2464,e2465).

#pos(e2466,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2467,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2466,e2467).

#pos(e2468,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2469,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2468,e2469).

#pos(e2470,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e2471,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2470,e2471).

#pos(e2472,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2473,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2472,e2473).

#pos(e2474,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2475,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2474,e2475).

#pos(e2476,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2477,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2476,e2477).

#pos(e2478,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2479,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e2478,e2479).

#pos(e2480,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2481,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2480,e2481).

#pos(e2482,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2483,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2482,e2483).

#pos(e2484,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2485,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,4)). 
}).
#brave_ordering(e2484,e2485).

#pos(e2486,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2487,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2486,e2487).

#pos(e2488,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2489,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2488,e2489).

#pos(e2490,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2491,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e2490,e2491).

#pos(e2492,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2493,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,5)). 
}).
#brave_ordering(e2492,e2493).

#pos(e2494,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2495,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2494,e2495).

#pos(e2496,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2497,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2496,e2497).

#pos(e2498,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2499,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2498,e2499).

#pos(e2500,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2501,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2500,e2501).

#pos(e2502,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e2503,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2502,e2503).

#pos(e2504,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e2505,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2504,e2505).

#pos(e2506,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e2507,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2506,e2507).

#pos(e2508,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e2509,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2508,e2509).

#pos(e2510,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e2511,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e2510,e2511).

#pos(e2512,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,5)). 
}).
#pos(e2513,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,3)). 
}).
#brave_ordering(e2512,e2513).

#pos(e2514,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,5)). 
}).
#pos(e2515,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2514,e2515).

#pos(e2516,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,5)). 
}).
#pos(e2517,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e2516,e2517).

#pos(e2518,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,5)). 
}).
#pos(e2519,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2518,e2519).

#pos(e2520,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2521,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2520,e2521).

#pos(e2522,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#pos(e2523,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e2522,e2523).

#pos(e2524,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#pos(e2525,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2524,e2525).

#pos(e2526,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2527,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2526,e2527).

#pos(e2528,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2529,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2528,e2529).

#pos(e2530,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2531,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2530,e2531).

#pos(e2532,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2533,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2532,e2533).

#pos(e2534,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2535,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2534,e2535).

#pos(e2536,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2537,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2536,e2537).

#pos(e2538,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2539,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e2538,e2539).

#pos(e2540,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2541,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2540,e2541).

#pos(e2542,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2543,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2542,e2543).

#pos(e2544,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e2545,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2544,e2545).

#pos(e2546,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2547,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2546,e2547).

#pos(e2548,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2549,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2548,e2549).

#pos(e2550,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2551,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2550,e2551).

#pos(e2552,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2553,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e2552,e2553).

#pos(e2554,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2555,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2554,e2555).

#pos(e2556,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2557,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2556,e2557).

#pos(e2558,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2559,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2558,e2559).

#pos(e2560,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2561,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2560,e2561).

#pos(e2562,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2563,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2562,e2563).

#pos(e2564,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2565,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2564,e2565).

#pos(e2566,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2567,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2566,e2567).

#pos(e2568,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2569,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e2568,e2569).

#pos(e2570,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2571,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e2570,e2571).

#pos(e2572,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2573,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e2572,e2573).

#pos(e2574,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e2575,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2574,e2575).

#pos(e2576,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2577,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e2576,e2577).

#pos(e2578,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2579,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2578,e2579).

#pos(e2580,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2581,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2580,e2581).

#pos(e2582,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2583,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2582,e2583).

#pos(e2584,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2585,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2584,e2585).

#pos(e2586,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2587,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2586,e2587).

#pos(e2588,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2589,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2588,e2589).

#pos(e2590,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e2591,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2590,e2591).

#pos(e2592,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e2593,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2592,e2593).

#pos(e2594,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2595,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e2594,e2595).

#pos(e2596,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e2597,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2596,e2597).

#pos(e2598,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2599,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2598,e2599).

#pos(e2600,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2601,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2600,e2601).

#pos(e2602,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2603,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2602,e2603).

#pos(e2604,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2605,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2604,e2605).

#pos(e2606,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2607,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2606,e2607).

#pos(e2608,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2609,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2608,e2609).

#pos(e2610,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2611,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2610,e2611).

#pos(e2612,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e2613,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e2612,e2613).

#pos(e2614,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e2615,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e2614,e2615).

#pos(e2616,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e2617,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e2616,e2617).

#pos(e2618,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2619,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e2618,e2619).

#pos(e2620,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2621,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2620,e2621).

#pos(e2622,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2623,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2622,e2623).

#pos(e2624,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2625,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2624,e2625).

#pos(e2626,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2627,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2626,e2627).

#pos(e2628,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2629,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2628,e2629).

#pos(e2630,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2631,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2630,e2631).

#pos(e2632,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2633,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2632,e2633).

#pos(e2634,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2635,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2634,e2635).

#pos(e2636,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e2637,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2636,e2637).

#pos(e2638,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e2639,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e2638,e2639).

#pos(e2640,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#pos(e2641,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e2640,e2641).

#pos(e2642,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#pos(e2643,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2642,e2643).

#pos(e2644,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2645,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2644,e2645).

#pos(e2646,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e2647,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e2646,e2647).

#pos(e2648,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e2649,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2648,e2649).

#pos(e2650,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2651,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2650,e2651).

#pos(e2652,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2653,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2652,e2653).

#pos(e2654,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2655,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2654,e2655).

#pos(e2656,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2657,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2656,e2657).

#pos(e2658,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2659,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2658,e2659).

#pos(e2660,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e2661,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2660,e2661).

#pos(e2662,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2663,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2662,e2663).

#pos(e2664,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2665,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2664,e2665).

#pos(e2666,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2667,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e2666,e2667).

#pos(e2668,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2669,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2668,e2669).

#pos(e2670,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2671,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2670,e2671).

#pos(e2672,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2673,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2672,e2673).

#pos(e2674,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2675,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2674,e2675).

#pos(e2676,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2677,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2676,e2677).

#pos(e2678,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2679,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2678,e2679).

#pos(e2680,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2681,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2680,e2681).

#pos(e2682,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2683,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2682,e2683).

#pos(e2684,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2685,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2684,e2685).

#pos(e2686,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,1)). does(b,remove(4,3)). 
}).
#pos(e2687,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2686,e2687).

#pos(e2688,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e2689,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2688,e2689).

#pos(e2690,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2691,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2690,e2691).

#pos(e2692,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2693,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2692,e2693).

#pos(e2694,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2695,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2694,e2695).

#pos(e2696,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2697,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2696,e2697).

#pos(e2698,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2699,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2698,e2699).

#pos(e2700,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2701,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2700,e2701).

#pos(e2702,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2703,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e2702,e2703).

#pos(e2704,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2705,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2704,e2705).

#pos(e2706,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2707,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e2706,e2707).

#pos(e2708,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2709,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2708,e2709).

#pos(e2710,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2711,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2710,e2711).

#pos(e2712,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2713,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2712,e2713).

#pos(e2714,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2715,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2714,e2715).

#pos(e2716,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2717,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2716,e2717).

#pos(e2718,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2719,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2718,e2719).

#pos(e2720,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2721,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e2720,e2721).

#pos(e2722,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2723,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2722,e2723).

#pos(e2724,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2725,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2724,e2725).

#pos(e2726,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e2727,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e2726,e2727).

#pos(e2728,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2729,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2728,e2729).

#pos(e2730,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2731,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2730,e2731).

#pos(e2732,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e2733,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e2732,e2733).

#pos(e2734,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2735,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2734,e2735).

#pos(e2736,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2737,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2736,e2737).

#pos(e2738,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2739,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2738,e2739).

#pos(e2740,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2741,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2740,e2741).

#pos(e2742,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e2743,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e2742,e2743).

#pos(e2744,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e2745,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2744,e2745).

#pos(e2746,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e2747,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2746,e2747).

#pos(e2748,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e2749,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e2748,e2749).

#pos(e2750,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e2751,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#brave_ordering(e2750,e2751).

#pos(e2752,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e2753,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e2752,e2753).

#pos(e2754,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e2755,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(2,1)). 
}).
#brave_ordering(e2754,e2755).

#pos(e2756,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e2757,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(2,2)). 
}).
#brave_ordering(e2756,e2757).

#pos(e2758,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#pos(e2759,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e2758,e2759).

#pos(e2760,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e2761,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e2760,e2761).

#pos(e2762,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2763,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2762,e2763).

#pos(e2764,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2765,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2764,e2765).

#pos(e2766,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2767,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2766,e2767).

#pos(e2768,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2769,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e2768,e2769).

#pos(e2770,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2771,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2770,e2771).

#pos(e2772,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2773,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2772,e2773).

#pos(e2774,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2775,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2774,e2775).

#pos(e2776,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2777,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2776,e2777).

#pos(e2778,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2779,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2778,e2779).

#pos(e2780,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e2781,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2780,e2781).

#pos(e2782,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2783,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(3,1)). 
}).
#brave_ordering(e2782,e2783).

#pos(e2784,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2785,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e2784,e2785).

#pos(e2786,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2787,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e2786,e2787).

#pos(e2788,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#pos(e2789,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e2788,e2789).

#pos(e2790,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2791,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2790,e2791).

#pos(e2792,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2793,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e2792,e2793).

#pos(e2794,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2795,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2794,e2795).

#pos(e2796,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e2797,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2796,e2797).

#pos(e2798,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2799,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2798,e2799).

#pos(e2800,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2801,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2800,e2801).

#pos(e2802,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2803,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2802,e2803).

#pos(e2804,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2805,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e2804,e2805).

#pos(e2806,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2807,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e2806,e2807).

#pos(e2808,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2809,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e2808,e2809).

#pos(e2810,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e2811,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2810,e2811).

#pos(e2812,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,5)). 
}).
#pos(e2813,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,5)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2812,e2813).

#pos(e2814,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2815,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e2814,e2815).

#pos(e2816,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2817,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2816,e2817).

#pos(e2818,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2819,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e2818,e2819).

#pos(e2820,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2821,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2820,e2821).

#pos(e2822,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2823,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,0)). does(b,remove(4,5)). 
}).
#brave_ordering(e2822,e2823).

#pos(e2824,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2825,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2824,e2825).

#pos(e2826,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e2827,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,4)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e2826,e2827).

#pos(e2828,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e2829,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e2828,e2829).

#pos(e2830,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e2831,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e2830,e2831).

#pos(e2832,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e2833,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,1)). true(has(4,4)). does(b,remove(2,1)). 
}).
#brave_ordering(e2832,e2833).

#pos(e2834,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2835,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2834,e2835).

#pos(e2836,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2837,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2836,e2837).

#pos(e2838,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2839,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2838,e2839).

#pos(e2840,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2841,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e2840,e2841).

#pos(e2842,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e2843,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2842,e2843).

#pos(e2844,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2845,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2844,e2845).

#pos(e2846,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2847,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2846,e2847).

#pos(e2848,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2849,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2848,e2849).

#pos(e2850,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2851,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2850,e2851).

#pos(e2852,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e2853,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e2852,e2853).

#pos(e2854,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,5)). 
}).
#pos(e2855,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2854,e2855).

#pos(e2856,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2857,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,5)). 
}).
#brave_ordering(e2856,e2857).

#pos(e2858,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2859,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2858,e2859).

#pos(e2860,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2861,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e2860,e2861).

#pos(e2862,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2863,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2862,e2863).

#pos(e2864,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,4)). 
}).
#pos(e2865,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2864,e2865).

#pos(e2866,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2867,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2866,e2867).

#pos(e2868,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2869,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2868,e2869).

#pos(e2870,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2871,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2870,e2871).

#pos(e2872,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2873,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e2872,e2873).

#pos(e2874,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e2875,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e2874,e2875).

#pos(e2876,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2877,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2876,e2877).

#pos(e2878,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2879,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2878,e2879).

#pos(e2880,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2881,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2880,e2881).

#pos(e2882,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e2883,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e2882,e2883).

#pos(e2884,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2885,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2884,e2885).

#pos(e2886,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2887,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e2886,e2887).

#pos(e2888,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2889,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2888,e2889).

#pos(e2890,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2891,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2890,e2891).

#pos(e2892,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2893,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2892,e2893).

#pos(e2894,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2895,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2894,e2895).

#pos(e2896,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2897,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2896,e2897).

#pos(e2898,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2899,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2898,e2899).

#pos(e2900,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2901,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(2,2)). 
}).
#brave_ordering(e2900,e2901).

#pos(e2902,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2903,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e2902,e2903).

#pos(e2904,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2905,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e2904,e2905).

#pos(e2906,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#pos(e2907,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e2906,e2907).

#pos(e2908,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2909,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2908,e2909).

#pos(e2910,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e2911,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e2910,e2911).

#pos(e2912,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e2913,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2912,e2913).

#pos(e2914,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2915,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2914,e2915).

#pos(e2916,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2917,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2916,e2917).

#pos(e2918,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2919,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2918,e2919).

#pos(e2920,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,4)). 
}).
#pos(e2921,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2920,e2921).

#pos(e2922,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2923,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2922,e2923).

#pos(e2924,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2925,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2924,e2925).

#pos(e2926,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e2927,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2926,e2927).

#pos(e2928,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e2929,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2928,e2929).

#pos(e2930,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,2)). 
}).
#pos(e2931,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(2,2)). 
}).
#brave_ordering(e2930,e2931).

#pos(e2932,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,2)). 
}).
#pos(e2933,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,3)). 
}).
#brave_ordering(e2932,e2933).

#pos(e2934,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,2)). 
}).
#pos(e2935,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e2934,e2935).

#pos(e2936,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,2)). 
}).
#pos(e2937,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,4)). does(a,remove(4,4)). 
}).
#brave_ordering(e2936,e2937).

#pos(e2938,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2939,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2938,e2939).

#pos(e2940,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2941,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e2940,e2941).

#pos(e2942,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e2943,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e2942,e2943).

#pos(e2944,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e2945,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e2944,e2945).

#pos(e2946,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2947,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2946,e2947).

#pos(e2948,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2949,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e2948,e2949).

#pos(e2950,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e2951,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e2950,e2951).

#pos(e2952,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2953,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2952,e2953).

#pos(e2954,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2955,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e2954,e2955).

#pos(e2956,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e2957,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2956,e2957).

#pos(e2958,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2959,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2958,e2959).

#pos(e2960,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2961,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2960,e2961).

#pos(e2962,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e2963,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e2962,e2963).

#pos(e2964,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e2965,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2964,e2965).

#pos(e2966,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e2967,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e2966,e2967).

#pos(e2968,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e2969,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e2968,e2969).

#pos(e2970,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e2971,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e2970,e2971).

#pos(e2972,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2973,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2972,e2973).

#pos(e2974,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e2975,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e2974,e2975).

#pos(e2976,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e2977,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e2976,e2977).

#pos(e2978,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e2979,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e2978,e2979).

#pos(e2980,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2981,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(2,2)). 
}).
#brave_ordering(e2980,e2981).

#pos(e2982,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2983,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e2982,e2983).

#pos(e2984,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2985,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e2984,e2985).

#pos(e2986,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e2987,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e2986,e2987).

#pos(e2988,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,5)). 
}).
#pos(e2989,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,5)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2988,e2989).

#pos(e2990,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e2991,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e2990,e2991).

#pos(e2992,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e2993,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e2992,e2993).

#pos(e2994,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2995,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e2994,e2995).

#pos(e2996,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e2997,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e2996,e2997).

#pos(e2998,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e2999,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e2998,e2999).

#pos(e3000,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3001,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3000,e3001).

#pos(e3002,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3003,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e3002,e3003).

#pos(e3004,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3005,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3004,e3005).

#pos(e3006,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3007,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3006,e3007).

#pos(e3008,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3009,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,5)). 
}).
#brave_ordering(e3008,e3009).

#pos(e3010,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3011,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3010,e3011).

#pos(e3012,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3013,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3012,e3013).

#pos(e3014,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3015,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3014,e3015).

#pos(e3016,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3017,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3016,e3017).

#pos(e3018,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3019,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e3018,e3019).

#pos(e3020,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3021,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e3020,e3021).

#pos(e3022,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3023,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e3022,e3023).

#pos(e3024,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3025,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3024,e3025).

#pos(e3026,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3027,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3026,e3027).

#pos(e3028,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3029,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3028,e3029).

#pos(e3030,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3031,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3030,e3031).

#pos(e3032,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e3033,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3032,e3033).

#pos(e3034,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3035,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e3034,e3035).

#pos(e3036,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3037,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e3036,e3037).

#pos(e3038,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3039,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e3038,e3039).

#pos(e3040,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3041,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e3040,e3041).

#pos(e3042,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3043,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3042,e3043).

#pos(e3044,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3045,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3044,e3045).

#pos(e3046,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3047,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3046,e3047).

#pos(e3048,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e3049,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e3048,e3049).

#pos(e3050,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e3051,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e3050,e3051).

#pos(e3052,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3053,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3052,e3053).

#pos(e3054,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3055,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3054,e3055).

#pos(e3056,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3057,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3056,e3057).

#pos(e3058,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3059,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3058,e3059).

#pos(e3060,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,5)). 
}).
#pos(e3061,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,5)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3060,e3061).

#pos(e3062,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e3063,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3062,e3063).

#pos(e3064,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e3065,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3064,e3065).

#pos(e3066,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e3067,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3066,e3067).

#pos(e3068,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e3069,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3068,e3069).

#pos(e3070,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e3071,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,5)). true(has(3,1)). true(has(2,0)). does(a,remove(4,5)). 
}).
#brave_ordering(e3070,e3071).

#pos(e3072,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3073,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3072,e3073).

#pos(e3074,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3075,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3074,e3075).

#pos(e3076,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3077,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3076,e3077).

#pos(e3078,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3079,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3078,e3079).

#pos(e3080,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3081,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3080,e3081).

#pos(e3082,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3083,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3082,e3083).

#pos(e3084,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3085,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3084,e3085).

#pos(e3086,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3087,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e3086,e3087).

#pos(e3088,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3089,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e3088,e3089).

#pos(e3090,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e3091,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e3090,e3091).

#pos(e3092,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e3093,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3092,e3093).

#pos(e3094,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3095,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,4)). 
}).
#brave_ordering(e3094,e3095).

#pos(e3096,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3097,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e3096,e3097).

#pos(e3098,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3099,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e3098,e3099).

#pos(e3100,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,3)). 
}).
#pos(e3101,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,4)). does(b,remove(4,2)). 
}).
#brave_ordering(e3100,e3101).

#pos(e3102,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3103,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3102,e3103).

#pos(e3104,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3105,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3104,e3105).

#pos(e3106,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3107,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3106,e3107).

#pos(e3108,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3109,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3108,e3109).

#pos(e3110,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3111,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3110,e3111).

#pos(e3112,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3113,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3112,e3113).

#pos(e3114,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3115,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e3114,e3115).

#pos(e3116,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3117,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3116,e3117).

#pos(e3118,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3119,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3118,e3119).

#pos(e3120,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3121,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3120,e3121).

#pos(e3122,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3123,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3122,e3123).

#pos(e3124,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3125,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3124,e3125).

#pos(e3126,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3127,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3126,e3127).

#pos(e3128,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3129,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3128,e3129).

#pos(e3130,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e3131,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,2)). 
}).
#brave_ordering(e3130,e3131).

#pos(e3132,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e3133,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e3132,e3133).

#pos(e3134,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e3135,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e3134,e3135).

#pos(e3136,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e3137,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,3)). 
}).
#brave_ordering(e3136,e3137).

#pos(e3138,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e3139,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,1)). 
}).
#brave_ordering(e3138,e3139).

#pos(e3140,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e3141,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,2)). 
}).
#brave_ordering(e3140,e3141).

#pos(e3142,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(4,4)). 
}).
#pos(e3143,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,4)). does(a,remove(2,1)). 
}).
#brave_ordering(e3142,e3143).

#pos(e3144,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,5)). 
}).
#pos(e3145,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3144,e3145).

#pos(e3146,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,5)). 
}).
#pos(e3147,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3146,e3147).

#pos(e3148,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,5)). 
}).
#pos(e3149,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,5)). true(has(1,0)). true(has(2,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e3148,e3149).

#pos(e3150,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e3151,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3150,e3151).

#pos(e3152,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3153,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3152,e3153).

#pos(e3154,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3155,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3154,e3155).

#pos(e3156,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3157,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3156,e3157).

#pos(e3158,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e3159,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3158,e3159).

#pos(e3160,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e3161,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3160,e3161).

#pos(e3162,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3163,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3162,e3163).

#pos(e3164,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3165,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3164,e3165).

#pos(e3166,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e3167,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e3166,e3167).

#pos(e3168,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e3169,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3168,e3169).

#pos(e3170,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#pos(e3171,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e3170,e3171).

#pos(e3172,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#pos(e3173,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e3172,e3173).

#pos(e3174,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3175,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3174,e3175).

#pos(e3176,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3177,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3176,e3177).

#pos(e3178,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3179,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3178,e3179).

#pos(e3180,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3181,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3180,e3181).

#pos(e3182,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3183,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3182,e3183).

#pos(e3184,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3185,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3184,e3185).

#pos(e3186,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3187,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3186,e3187).

#pos(e3188,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3189,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3188,e3189).

#pos(e3190,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3191,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3190,e3191).

#pos(e3192,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3193,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3192,e3193).

#pos(e3194,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3195,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3194,e3195).

#pos(e3196,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3197,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3196,e3197).

#pos(e3198,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3199,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3198,e3199).

#pos(e3200,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3201,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3200,e3201).

#pos(e3202,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3203,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3202,e3203).

#pos(e3204,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3205,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3204,e3205).

#pos(e3206,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3207,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3206,e3207).

#pos(e3208,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3209,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3208,e3209).

#pos(e3210,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,1)). does(a,remove(4,3)). 
}).
#pos(e3211,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3210,e3211).

#pos(e3212,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3213,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3212,e3213).

#pos(e3214,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e3215,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,1)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3214,e3215).

#pos(e3216,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e3217,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3216,e3217).

#pos(e3218,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e3219,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3218,e3219).

#pos(e3220,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3221,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3220,e3221).

#pos(e3222,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e3223,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3222,e3223).

#pos(e3224,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e3225,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3224,e3225).

#pos(e3226,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,1)). does(a,remove(2,2)). 
}).
#pos(e3227,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3226,e3227).

#pos(e3228,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e3229,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(4,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3228,e3229).

#pos(e3230,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,0)). does(a,remove(2,1)). 
}).
#pos(e3231,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e3230,e3231).

#pos(e3232,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,0)). does(a,remove(2,1)). 
}).
#pos(e3233,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,1)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3232,e3233).

#pos(e3234,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3235,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e3234,e3235).

#pos(e3236,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3237,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3236,e3237).

#pos(e3238,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3239,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3238,e3239).

#pos(e3240,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3241,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e3240,e3241).

#pos(e3242,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3243,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,5)). 
}).
#brave_ordering(e3242,e3243).

#pos(e3244,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3245,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,5)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3244,e3245).

#pos(e3246,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e3247,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3246,e3247).

#pos(e3248,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e3249,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e3248,e3249).

#pos(e3250,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e3251,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3250,e3251).

#pos(e3252,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,3)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e3253,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,3)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3252,e3253).

#pos(e3254,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3255,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3254,e3255).

#pos(e3256,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3257,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3256,e3257).

#pos(e3258,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e3259,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3258,e3259).

#pos(e3260,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e3261,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3260,e3261).

#pos(e3262,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3263,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3262,e3263).

#pos(e3264,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3265,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,3)). 
}).
#brave_ordering(e3264,e3265).

#pos(e3266,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3267,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3266,e3267).

#pos(e3268,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3269,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3268,e3269).

#pos(e3270,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3271,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3270,e3271).

#pos(e3272,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e3273,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e3272,e3273).

#pos(e3274,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#pos(e3275,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3274,e3275).

#pos(e3276,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3277,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3276,e3277).

#pos(e3278,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3279,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3278,e3279).

#pos(e3280,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3281,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e3280,e3281).

#pos(e3282,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3283,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3282,e3283).

#pos(e3284,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3285,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3284,e3285).

#pos(e3286,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3287,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3286,e3287).

#pos(e3288,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e3289,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3288,e3289).

#pos(e3290,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e3291,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3290,e3291).

#pos(e3292,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e3293,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e3292,e3293).

#pos(e3294,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,1)). does(a,remove(3,3)). 
}).
#pos(e3295,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(3,3)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3294,e3295).

#pos(e3296,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3297,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3296,e3297).

#pos(e3298,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e3299,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3298,e3299).

#pos(e3300,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3301,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3300,e3301).

#pos(e3302,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3303,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3302,e3303).

#pos(e3304,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e3305,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e3304,e3305).

#pos(e3306,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e3307,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3306,e3307).

#pos(e3308,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3309,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3308,e3309).

#pos(e3310,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3311,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e3310,e3311).

#pos(e3312,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3313,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3312,e3313).

#pos(e3314,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3315,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3314,e3315).

#pos(e3316,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e3317,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3316,e3317).

#pos(e3318,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e3319,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,2)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3318,e3319).

#pos(e3320,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3321,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3320,e3321).

#pos(e3322,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e3323,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3322,e3323).

#pos(e3324,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3325,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3324,e3325).

#pos(e3326,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3327,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3326,e3327).

#pos(e3328,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3329,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3328,e3329).

#pos(e3330,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3331,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3330,e3331).

#pos(e3332,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3333,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3332,e3333).

#pos(e3334,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3335,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3334,e3335).

#pos(e3336,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3337,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3336,e3337).

#pos(e3338,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3339,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3338,e3339).

#pos(e3340,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3341,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3340,e3341).

#pos(e3342,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3343,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3342,e3343).

#pos(e3344,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e3345,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e3344,e3345).

#pos(e3346,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e3347,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3346,e3347).

#pos(e3348,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,2)). does(a,remove(2,1)). 
}).
#pos(e3349,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e3348,e3349).

#pos(e3350,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,2)). does(a,remove(2,1)). 
}).
#pos(e3351,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3350,e3351).

#pos(e3352,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e3353,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,3)). true(has(4,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e3352,e3353).

#pos(e3354,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3355,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3354,e3355).

#pos(e3356,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3357,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3356,e3357).

#pos(e3358,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3359,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e3358,e3359).

#pos(e3360,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#pos(e3361,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3360,e3361).

#pos(e3362,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3363,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3362,e3363).

#pos(e3364,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3365,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3364,e3365).

#pos(e3366,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3367,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3366,e3367).

#pos(e3368,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3369,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3368,e3369).

#pos(e3370,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3371,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,3)). 
}).
#brave_ordering(e3370,e3371).

#pos(e3372,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e3373,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3372,e3373).

#pos(e3374,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e3375,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3374,e3375).

#pos(e3376,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3377,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3376,e3377).

#pos(e3378,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e3379,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3378,e3379).

#pos(e3380,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e3381,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e3380,e3381).

#pos(e3382,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3383,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e3382,e3383).

#pos(e3384,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3385,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3384,e3385).

#pos(e3386,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e3387,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3386,e3387).

#pos(e3388,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e3389,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3388,e3389).

#pos(e3390,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e3391,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e3390,e3391).

#pos(e3392,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e3393,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3392,e3393).

#pos(e3394,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e3395,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e3394,e3395).

#pos(e3396,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(3,3)). 
}).
#pos(e3397,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3396,e3397).

#pos(e3398,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e3399,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3398,e3399).

#pos(e3400,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,1)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e3401,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,1)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e3400,e3401).

#pos(e3402,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,1)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e3403,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,1)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3402,e3403).

#pos(e3404,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e3405,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3404,e3405).

#pos(e3406,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e3407,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3406,e3407).

#pos(e3408,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e3409,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3408,e3409).

#pos(e3410,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3411,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e3410,e3411).

#pos(e3412,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3413,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3412,e3413).

#pos(e3414,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3415,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3414,e3415).

#pos(e3416,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3417,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3416,e3417).

#pos(e3418,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3419,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3418,e3419).

#pos(e3420,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e3421,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3420,e3421).

#pos(e3422,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e3423,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e3422,e3423).

#pos(e3424,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(b,remove(4,1)). 
}).
#pos(e3425,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3424,e3425).

#pos(e3426,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e3427,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3426,e3427).

#pos(e3428,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e3429,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3428,e3429).

#pos(e3430,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e3431,{}, {}, {
 true(control(b)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3430,e3431).

#pos(e3432,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3433,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3432,e3433).

#pos(e3434,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3435,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3434,e3435).

#pos(e3436,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3437,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3436,e3437).

#pos(e3438,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3439,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3438,e3439).

#pos(e3440,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3441,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3440,e3441).

#pos(e3442,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3443,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e3442,e3443).

#pos(e3444,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3445,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,5)). 
}).
#brave_ordering(e3444,e3445).

#pos(e3446,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e3447,{}, {}, {
 true(control(b)). true(has(4,5)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3446,e3447).

#pos(e3448,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3449,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3448,e3449).

#pos(e3450,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3451,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3450,e3451).

#pos(e3452,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3453,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3452,e3453).

#pos(e3454,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3455,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3454,e3455).

#pos(e3456,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3457,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3456,e3457).

#pos(e3458,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3459,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3458,e3459).

#pos(e3460,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3461,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3460,e3461).

#pos(e3462,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3463,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3462,e3463).

#pos(e3464,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3465,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(2,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3464,e3465).

#pos(e3466,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e3467,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,1)). true(has(4,3)). does(b,remove(2,1)). 
}).
#brave_ordering(e3466,e3467).

#pos(e3468,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e3469,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3468,e3469).

#pos(e3470,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e3471,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3470,e3471).

#pos(e3472,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e3473,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3472,e3473).

#pos(e3474,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3475,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3474,e3475).

#pos(e3476,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3477,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3476,e3477).

#pos(e3478,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3479,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3478,e3479).

#pos(e3480,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3481,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3480,e3481).

#pos(e3482,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e3483,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3482,e3483).

#pos(e3484,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3485,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3484,e3485).

#pos(e3486,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3487,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3486,e3487).

#pos(e3488,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3489,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e3488,e3489).

#pos(e3490,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e3491,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3490,e3491).

#pos(e3492,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e3493,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e3492,e3493).

#pos(e3494,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e3495,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3494,e3495).

#pos(e3496,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e3497,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3496,e3497).

#pos(e3498,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3499,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3498,e3499).

#pos(e3500,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3501,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3500,e3501).

#pos(e3502,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3503,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3502,e3503).

#pos(e3504,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3505,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3504,e3505).

#pos(e3506,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3507,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3506,e3507).

#pos(e3508,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3509,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3508,e3509).

#pos(e3510,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3511,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3510,e3511).

#pos(e3512,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3513,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,2)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3512,e3513).

#pos(e3514,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3515,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3514,e3515).

#pos(e3516,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3517,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3516,e3517).

#pos(e3518,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3519,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3518,e3519).

#pos(e3520,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3521,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3520,e3521).

#pos(e3522,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3523,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3522,e3523).

#pos(e3524,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3525,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3524,e3525).

#pos(e3526,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3527,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3526,e3527).

#pos(e3528,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3529,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3528,e3529).

#pos(e3530,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3531,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3530,e3531).

#pos(e3532,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3533,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3532,e3533).

#pos(e3534,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3535,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3534,e3535).

#pos(e3536,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3537,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3536,e3537).

#pos(e3538,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3539,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e3538,e3539).

#pos(e3540,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3541,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3540,e3541).

#pos(e3542,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e3543,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3542,e3543).

#pos(e3544,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e3545,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3544,e3545).

#pos(e3546,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3547,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3546,e3547).

#pos(e3548,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3549,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3548,e3549).

#pos(e3550,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e3551,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3550,e3551).

#pos(e3552,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3553,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3552,e3553).

#pos(e3554,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3555,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3554,e3555).

#pos(e3556,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3557,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3556,e3557).

#pos(e3558,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3559,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3558,e3559).

#pos(e3560,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3561,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3560,e3561).

#pos(e3562,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3563,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3562,e3563).

#pos(e3564,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3565,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3564,e3565).

#pos(e3566,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e3567,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3566,e3567).

#pos(e3568,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3569,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3568,e3569).

#pos(e3570,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3571,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3570,e3571).

#pos(e3572,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3573,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3572,e3573).

#pos(e3574,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3575,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3574,e3575).

#pos(e3576,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3577,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3576,e3577).

#pos(e3578,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(4,1)). 
}).
#pos(e3579,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,2)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3578,e3579).

#pos(e3580,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3581,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3580,e3581).

#pos(e3582,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(3,1)). 
}).
#pos(e3583,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e3582,e3583).

#pos(e3584,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3585,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3584,e3585).

#pos(e3586,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3587,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3586,e3587).

#pos(e3588,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3589,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3588,e3589).

#pos(e3590,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3591,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3590,e3591).

#pos(e3592,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3593,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3592,e3593).

#pos(e3594,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3595,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3594,e3595).

#pos(e3596,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3597,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3596,e3597).

#pos(e3598,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3599,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3598,e3599).

#pos(e3600,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3601,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3600,e3601).

#pos(e3602,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,1)). does(b,remove(4,3)). 
}).
#pos(e3603,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3602,e3603).

#pos(e3604,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3605,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3604,e3605).

#pos(e3606,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3607,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3606,e3607).

#pos(e3608,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3609,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3608,e3609).

#pos(e3610,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3611,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3610,e3611).

#pos(e3612,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3613,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3612,e3613).

#pos(e3614,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e3615,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3614,e3615).

#pos(e3616,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e3617,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3616,e3617).

#pos(e3618,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e3619,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e3618,e3619).

#pos(e3620,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e3621,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3620,e3621).

#pos(e3622,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,2)). 
}).
#pos(e3623,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3622,e3623).

#pos(e3624,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3625,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3624,e3625).

#pos(e3626,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e3627,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3626,e3627).

#pos(e3628,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#pos(e3629,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3628,e3629).

#pos(e3630,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3631,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3630,e3631).

#pos(e3632,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3633,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e3632,e3633).

#pos(e3634,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3635,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3634,e3635).

#pos(e3636,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,2)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3637,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3636,e3637).

#pos(e3638,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(4,3)). true(has(1,0)). does(b,remove(4,3)). 
}).
#pos(e3639,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(4,3)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3638,e3639).

#pos(e3640,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(4,3)). true(has(1,0)). does(b,remove(4,3)). 
}).
#pos(e3641,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(4,3)). true(has(1,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3640,e3641).

#pos(e3642,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3643,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3642,e3643).

#pos(e3644,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3645,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e3644,e3645).

#pos(e3646,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3647,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3646,e3647).

#pos(e3648,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3649,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3648,e3649).

#pos(e3650,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3651,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3650,e3651).

#pos(e3652,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e3653,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e3652,e3653).

#pos(e3654,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e3655,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3654,e3655).

#pos(e3656,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3657,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3656,e3657).

#pos(e3658,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3659,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3658,e3659).

#pos(e3660,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3661,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3660,e3661).

#pos(e3662,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3663,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3662,e3663).

#pos(e3664,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3665,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3664,e3665).

#pos(e3666,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3667,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3666,e3667).

#pos(e3668,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3669,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e3668,e3669).

#pos(e3670,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3671,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3670,e3671).

#pos(e3672,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3673,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3672,e3673).

#pos(e3674,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,3)). true(has(1,1)). true(has(2,0)). does(b,remove(1,1)). 
}).
#pos(e3675,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,3)). true(has(1,1)). true(has(2,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e3674,e3675).

#pos(e3676,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(2,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e3677,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(2,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3676,e3677).

#pos(e3678,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3679,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e3678,e3679).

#pos(e3680,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3681,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,1)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3680,e3681).

#pos(e3682,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3683,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3682,e3683).

#pos(e3684,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3685,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3684,e3685).

#pos(e3686,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3687,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3686,e3687).

#pos(e3688,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3689,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3688,e3689).

#pos(e3690,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3691,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3690,e3691).

#pos(e3692,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3693,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3692,e3693).

#pos(e3694,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3695,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3694,e3695).

#pos(e3696,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(4,3)). 
}).
#pos(e3697,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3696,e3697).

#pos(e3698,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(4,3)). 
}).
#pos(e3699,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3698,e3699).

#pos(e3700,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(4,3)). 
}).
#pos(e3701,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(4,3)). true(has(1,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3700,e3701).

#pos(e3702,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3703,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,3)). 
}).
#brave_ordering(e3702,e3703).

#pos(e3704,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3705,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e3704,e3705).

#pos(e3706,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,2)). 
}).
#pos(e3707,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(4,3)). true(has(3,1)). true(has(2,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3706,e3707).

#pos(e3708,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3709,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3708,e3709).

#pos(e3710,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3711,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e3710,e3711).

#pos(e3712,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3713,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3712,e3713).

#pos(e3714,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3715,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3714,e3715).

#pos(e3716,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e3717,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3716,e3717).

#pos(e3718,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e3719,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3718,e3719).

#pos(e3720,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3721,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3720,e3721).

#pos(e3722,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3723,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3722,e3723).

#pos(e3724,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3725,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3724,e3725).

#pos(e3726,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3727,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3726,e3727).

#pos(e3728,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3729,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3728,e3729).

#pos(e3730,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3731,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3730,e3731).

#pos(e3732,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3733,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3732,e3733).

#pos(e3734,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3735,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3734,e3735).

#pos(e3736,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3737,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3736,e3737).

#pos(e3738,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3739,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3738,e3739).

#pos(e3740,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3741,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3740,e3741).

#pos(e3742,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3743,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3742,e3743).

#pos(e3744,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3745,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3744,e3745).

#pos(e3746,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3747,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3746,e3747).

#pos(e3748,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3749,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3748,e3749).

#pos(e3750,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3751,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3750,e3751).

#pos(e3752,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3753,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3752,e3753).

#pos(e3754,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3755,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3754,e3755).

#pos(e3756,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3757,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3756,e3757).

#pos(e3758,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3759,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3758,e3759).

#pos(e3760,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3761,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3760,e3761).

#pos(e3762,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3763,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e3762,e3763).

#pos(e3764,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3765,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3764,e3765).

#pos(e3766,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3767,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3766,e3767).

#pos(e3768,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e3769,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3768,e3769).

#pos(e3770,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e3771,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e3770,e3771).

#pos(e3772,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e3773,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3772,e3773).

#pos(e3774,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3775,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3774,e3775).

#pos(e3776,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e3777,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3776,e3777).

#pos(e3778,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e3779,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3778,e3779).

#pos(e3780,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e3781,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e3780,e3781).

#pos(e3782,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(4,3)). true(has(1,0)). does(a,remove(2,1)). 
}).
#pos(e3783,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(4,3)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e3782,e3783).

#pos(e3784,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3785,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3784,e3785).

#pos(e3786,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3787,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e3786,e3787).

#pos(e3788,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3789,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3788,e3789).

#pos(e3790,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3791,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3790,e3791).

#pos(e3792,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3793,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3792,e3793).

#pos(e3794,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,1)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e3795,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,1)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3794,e3795).

#pos(e3796,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,1)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e3797,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,1)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3796,e3797).

#pos(e3798,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3799,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e3798,e3799).

#pos(e3800,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e3801,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e3800,e3801).

#pos(e3802,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e3803,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3802,e3803).

#pos(e3804,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3805,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3804,e3805).

#pos(e3806,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(4,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e3807,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(4,2)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3806,e3807).

#pos(e3808,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(4,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e3809,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(4,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3808,e3809).

#pos(e3810,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3811,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3810,e3811).

#pos(e3812,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3813,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3812,e3813).

#pos(e3814,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3815,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,1)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3814,e3815).

#pos(e3816,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,1)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3817,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,1)). true(has(4,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e3816,e3817).

#pos(e3818,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3819,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3818,e3819).

#pos(e3820,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3821,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3820,e3821).

#pos(e3822,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e3823,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e3822,e3823).

#pos(e3824,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3825,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3824,e3825).

#pos(e3826,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3827,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3826,e3827).

#pos(e3828,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3829,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3828,e3829).

#pos(e3830,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3831,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(3,1)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e3830,e3831).

#pos(e3832,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e3833,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3832,e3833).

#pos(e3834,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e3835,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3834,e3835).

#pos(e3836,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e3837,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(4,3)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3836,e3837).

#pos(e3838,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3839,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e3838,e3839).

#pos(e3840,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3841,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e3840,e3841).

#pos(e3842,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3843,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3842,e3843).

#pos(e3844,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e3845,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3844,e3845).

#pos(e3846,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(4,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e3847,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(4,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e3846,e3847).

#pos(e3848,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(4,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e3849,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(4,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3848,e3849).

#pos(e3850,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3851,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3850,e3851).

#pos(e3852,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3853,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3852,e3853).

#pos(e3854,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e3855,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e3854,e3855).

#pos(e3856,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e3857,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,3)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e3856,e3857).

#pos(e3858,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3859,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3858,e3859).

#pos(e3860,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3861,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3860,e3861).

#pos(e3862,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3863,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3862,e3863).

#pos(e3864,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3865,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3864,e3865).

#pos(e3866,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3867,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3866,e3867).

#pos(e3868,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3869,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3868,e3869).

#pos(e3870,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e3871,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3870,e3871).

#pos(e3872,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3873,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3872,e3873).

#pos(e3874,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e3875,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3874,e3875).

#pos(e3876,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3877,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e3876,e3877).

#pos(e3878,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3879,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e3878,e3879).

#pos(e3880,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e3881,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3880,e3881).

#pos(e3882,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e3883,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,3)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3882,e3883).

#pos(e3884,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3885,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3884,e3885).

#pos(e3886,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3887,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3886,e3887).

#pos(e3888,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3889,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3888,e3889).

#pos(e3890,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3891,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3890,e3891).

#pos(e3892,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3893,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3892,e3893).

#pos(e3894,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3895,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3894,e3895).

#pos(e3896,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e3897,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e3896,e3897).

#pos(e3898,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e3899,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3898,e3899).

#pos(e3900,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e3901,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3900,e3901).

#pos(e3902,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e3903,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(3,2)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3902,e3903).

#pos(e3904,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,2)). does(a,remove(1,1)). 
}).
#pos(e3905,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3904,e3905).

#pos(e3906,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,2)). does(a,remove(1,1)). 
}).
#pos(e3907,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,3)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e3906,e3907).

#pos(e3908,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,1)). 
}).
#pos(e3909,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,2)). 
}).
#brave_ordering(e3908,e3909).

#pos(e3910,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,1)). 
}).
#pos(e3911,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(1,1)). 
}).
#brave_ordering(e3910,e3911).

#pos(e3912,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(2,1)). 
}).
#pos(e3913,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,3)). does(a,remove(3,2)). 
}).
#brave_ordering(e3912,e3913).

#pos(e3914,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(a,remove(4,4)). 
}).
#pos(e3915,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e3914,e3915).

#pos(e3916,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3917,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3916,e3917).

#pos(e3918,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e3919,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e3918,e3919).

#pos(e3920,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(2,1)). 
}).
#pos(e3921,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e3920,e3921).

#pos(e3922,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,2)). 
}).
#pos(e3923,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3922,e3923).

#pos(e3924,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e3925,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3924,e3925).

#pos(e3926,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e3927,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e3926,e3927).

#pos(e3928,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e3929,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). true(has(4,3)). does(a,remove(4,2)). 
}).
#brave_ordering(e3928,e3929).

#pos(e3930,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e3931,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3930,e3931).

#pos(e3932,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3933,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e3932,e3933).

#pos(e3934,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e3935,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e3934,e3935).

#pos(e3936,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,2)). 
}).
#pos(e3937,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e3936,e3937).

#pos(e3938,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3939,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3938,e3939).

#pos(e3940,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3941,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e3940,e3941).

#pos(e3942,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3943,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e3942,e3943).

#pos(e3944,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#pos(e3945,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e3944,e3945).

#pos(e3946,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3947,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3946,e3947).

#pos(e3948,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e3949,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3948,e3949).

#pos(e3950,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3951,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3950,e3951).

#pos(e3952,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3953,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e3952,e3953).

#pos(e3954,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e3955,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,3)). 
}).
#brave_ordering(e3954,e3955).

#pos(e3956,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e3957,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e3956,e3957).

#pos(e3958,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3959,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3958,e3959).

#pos(e3960,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e3961,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e3960,e3961).

#pos(e3962,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e3963,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e3962,e3963).

#pos(e3964,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3965,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,2)). true(has(4,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3964,e3965).

#pos(e3966,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e3967,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,2)). true(has(4,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e3966,e3967).

#pos(e3968,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e3969,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3968,e3969).

#pos(e3970,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e3971,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e3970,e3971).

#pos(e3972,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#pos(e3973,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). true(has(4,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e3972,e3973).

#pos(e3974,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e3975,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3974,e3975).

#pos(e3976,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3977,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e3976,e3977).

#pos(e3978,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e3979,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e3978,e3979).

#pos(e3980,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(b,remove(3,3)). 
}).
#pos(e3981,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,3)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e3980,e3981).

#pos(e3982,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3983,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3982,e3983).

#pos(e3984,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3985,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e3984,e3985).

#pos(e3986,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e3987,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e3986,e3987).

#pos(e3988,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e3989,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3988,e3989).

#pos(e3990,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3991,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e3990,e3991).

#pos(e3992,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e3993,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e3992,e3993).

#pos(e3994,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,1)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e3995,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(4,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e3994,e3995).

#pos(e3996,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,3)). 
}).
#pos(e3997,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e3996,e3997).

#pos(e3998,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e3999,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(4,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e3998,e3999).

#pos(e4000,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4001,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4000,e4001).

#pos(e4002,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e4003,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e4002,e4003).

#pos(e4004,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e4005,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e4004,e4005).

#pos(e4006,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4007,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4006,e4007).

#pos(e4008,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4009,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(3,3)). 
}).
#brave_ordering(e4008,e4009).

#pos(e4010,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4011,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4010,e4011).

#pos(e4012,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4013,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4012,e4013).

#pos(e4014,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4015,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4014,e4015).

#pos(e4016,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4017,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e4016,e4017).

#pos(e4018,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4019,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(1,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4018,e4019).

#pos(e4020,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4021,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,3)). true(has(1,0)). true(has(4,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e4020,e4021).

#pos(e4022,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e4023,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4022,e4023).

#pos(e4024,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e4025,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4024,e4025).

#pos(e4026,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4027,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4026,e4027).

#pos(e4028,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4029,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,1)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4028,e4029).

#pos(e4030,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4031,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4030,e4031).

#pos(e4032,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4033,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4032,e4033).

#pos(e4034,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4035,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4034,e4035).

#pos(e4036,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4037,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e4036,e4037).

#pos(e4038,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e4039,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e4038,e4039).

#pos(e4040,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(a,remove(4,1)). 
}).
#pos(e4041,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(1,0)). true(has(3,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e4040,e4041).

#pos(e4042,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4043,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e4042,e4043).

#pos(e4044,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4045,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e4044,e4045).

#pos(e4046,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4047,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4046,e4047).

#pos(e4048,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4049,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4048,e4049).

#pos(e4050,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e4051,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4050,e4051).

#pos(e4052,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e4053,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4052,e4053).

#pos(e4054,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4055,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4054,e4055).

#pos(e4056,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4057,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,1)). true(has(4,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4056,e4057).

#pos(e4058,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4059,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4058,e4059).

#pos(e4060,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(4,0)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e4061,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(4,0)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4060,e4061).

#pos(e4062,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(4,0)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e4063,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(4,0)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4062,e4063).

#pos(e4064,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e4065,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4064,e4065).

#pos(e4066,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4067,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e4066,e4067).

#pos(e4068,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4069,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4068,e4069).

#pos(e4070,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e4071,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4070,e4071).

#pos(e4072,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4073,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4072,e4073).

#pos(e4074,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4075,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4074,e4075).

#pos(e4076,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e4077,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4076,e4077).

#pos(e4078,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4079,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e4078,e4079).

#pos(e4080,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4081,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e4080,e4081).

#pos(e4082,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4083,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e4082,e4083).

#pos(e4084,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4085,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4084,e4085).

#pos(e4086,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,4)). true(has(1,0)). true(has(2,0)). does(a,remove(4,4)). 
}).
#pos(e4087,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(4,4)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4086,e4087).

#pos(e4088,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4089,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4088,e4089).

#pos(e4090,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4091,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4090,e4091).

#pos(e4092,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4093,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4092,e4093).

#pos(e4094,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4095,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e4094,e4095).

#pos(e4096,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4097,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4096,e4097).

#pos(e4098,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4099,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4098,e4099).

#pos(e4100,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4101,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4100,e4101).

#pos(e4102,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4103,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4102,e4103).

#pos(e4104,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4105,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4104,e4105).

#pos(e4106,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4107,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4106,e4107).

#pos(e4108,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4109,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e4108,e4109).

#pos(e4110,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4111,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4110,e4111).

#pos(e4112,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4113,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4112,e4113).

#pos(e4114,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4115,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4114,e4115).

#pos(e4116,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e4117,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,4)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4116,e4117).

#pos(e4118,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4119,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e4118,e4119).

#pos(e4120,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4121,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4120,e4121).

#pos(e4122,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4123,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4122,e4123).

#pos(e4124,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4125,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4124,e4125).

#pos(e4126,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4127,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4126,e4127).

#pos(e4128,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4129,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4128,e4129).

#pos(e4130,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4131,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(4,2)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4130,e4131).

#pos(e4132,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4133,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4132,e4133).

#pos(e4134,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4135,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4134,e4135).

#pos(e4136,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4137,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4136,e4137).

#pos(e4138,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4139,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e4138,e4139).

#pos(e4140,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4141,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e4140,e4141).

#pos(e4142,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4143,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e4142,e4143).

#pos(e4144,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#pos(e4145,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,0)). true(has(4,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e4144,e4145).

#pos(e4146,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e4147,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4146,e4147).

#pos(e4148,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,1)). does(b,remove(4,4)). 
}).
#pos(e4149,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,4)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4148,e4149).

#pos(e4150,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4151,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4150,e4151).

#pos(e4152,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4153,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4152,e4153).

#pos(e4154,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4155,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4154,e4155).

#pos(e4156,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4157,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4156,e4157).

#pos(e4158,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e4159,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,1)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4158,e4159).

#pos(e4160,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4161,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4160,e4161).

#pos(e4162,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e4163,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4162,e4163).

#pos(e4164,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e4165,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4164,e4165).

#pos(e4166,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e4167,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4166,e4167).

#pos(e4168,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e4169,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4168,e4169).

#pos(e4170,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e4171,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4170,e4171).

#pos(e4172,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4173,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4172,e4173).

#pos(e4174,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4175,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4174,e4175).

#pos(e4176,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,3)). 
}).
#pos(e4177,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(4,3)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4176,e4177).

#pos(e4178,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4179,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4178,e4179).

#pos(e4180,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4181,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4180,e4181).

#pos(e4182,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4183,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e4182,e4183).

#pos(e4184,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4185,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4184,e4185).

#pos(e4186,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4187,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4186,e4187).

#pos(e4188,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4189,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4188,e4189).

#pos(e4190,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4191,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4190,e4191).

#pos(e4192,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4193,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4192,e4193).

#pos(e4194,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4195,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4194,e4195).

#pos(e4196,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4197,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e4196,e4197).

#pos(e4198,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4199,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4198,e4199).

#pos(e4200,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4201,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4200,e4201).

#pos(e4202,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e4203,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,1)). true(has(1,0)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4202,e4203).

#pos(e4204,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4205,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4204,e4205).

#pos(e4206,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4207,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4206,e4207).

#pos(e4208,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4209,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4208,e4209).

#pos(e4210,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4211,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4210,e4211).

#pos(e4212,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4213,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4212,e4213).

#pos(e4214,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4215,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4214,e4215).

#pos(e4216,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4217,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4216,e4217).

#pos(e4218,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4219,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,1)). does(b,remove(4,3)). 
}).
#brave_ordering(e4218,e4219).

#pos(e4220,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4221,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4220,e4221).

#pos(e4222,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e4223,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4222,e4223).

#pos(e4224,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(3,1)). 
}).
#pos(e4225,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). true(has(4,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4224,e4225).

#pos(e4226,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4227,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4226,e4227).

#pos(e4228,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4229,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4228,e4229).

#pos(e4230,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4231,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,3)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4230,e4231).

#pos(e4232,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4233,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4232,e4233).

#pos(e4234,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4235,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4234,e4235).

#pos(e4236,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4237,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e4236,e4237).

#pos(e4238,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4239,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4238,e4239).

#pos(e4240,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4241,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4240,e4241).

#pos(e4242,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4243,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4242,e4243).

#pos(e4244,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4245,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4244,e4245).

#pos(e4246,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4247,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e4246,e4247).

#pos(e4248,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4249,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4248,e4249).

#pos(e4250,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e4251,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4250,e4251).

#pos(e4252,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e4253,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4252,e4253).

#pos(e4254,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4255,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4254,e4255).

#pos(e4256,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#pos(e4257,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4256,e4257).

#pos(e4258,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e4259,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(3,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4258,e4259).

#pos(e4260,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4261,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4260,e4261).

#pos(e4262,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4263,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e4262,e4263).

#pos(e4264,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4265,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4264,e4265).

#pos(e4266,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e4267,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4266,e4267).

#pos(e4268,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,2)). does(a,remove(2,1)). 
}).
#pos(e4269,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e4268,e4269).

#pos(e4270,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4271,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4270,e4271).

#pos(e4272,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4273,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4272,e4273).

#pos(e4274,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4275,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,2)). true(has(1,0)). true(has(4,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4274,e4275).

#pos(e4276,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4277,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e4276,e4277).

#pos(e4278,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4279,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4278,e4279).

#pos(e4280,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4281,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4280,e4281).

#pos(e4282,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4283,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4282,e4283).

#pos(e4284,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4285,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(3,2)). true(has(1,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e4284,e4285).

#pos(e4286,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e4287,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(4,2)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4286,e4287).

#pos(e4288,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4289,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4288,e4289).

#pos(e4290,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4291,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4290,e4291).

#pos(e4292,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4293,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4292,e4293).

#pos(e4294,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4295,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4294,e4295).

#pos(e4296,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4297,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e4296,e4297).

#pos(e4298,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4299,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4298,e4299).

#pos(e4300,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#pos(e4301,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4300,e4301).

#pos(e4302,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e4303,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4302,e4303).

#pos(e4304,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#pos(e4305,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,2)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4304,e4305).

#pos(e4306,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,1)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4307,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,1)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4306,e4307).

#pos(e4308,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,1)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4309,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,1)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4308,e4309).

#pos(e4310,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4311,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4310,e4311).

#pos(e4312,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4313,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4312,e4313).

#pos(e4314,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,1)). 
}).
#pos(e4315,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(3,1)). true(has(1,0)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4314,e4315).

#pos(e4316,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4317,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4316,e4317).

#pos(e4318,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,2)). true(has(4,3)). does(a,remove(4,1)). 
}).
#pos(e4319,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,2)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e4318,e4319).

#pos(e4320,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4321,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4320,e4321).

#pos(e4322,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(4,2)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e4323,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(4,2)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4322,e4323).

#pos(e4324,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(4,2)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e4325,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(4,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4324,e4325).

#pos(e4326,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4327,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4326,e4327).

#pos(e4328,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4329,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e4328,e4329).

#pos(e4330,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,3)). does(b,remove(4,3)). 
}).
#pos(e4331,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,1)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e4330,e4331).

#pos(e4332,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e4333,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4332,e4333).

#pos(e4334,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e4335,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e4334,e4335).

#pos(e4336,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4337,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4336,e4337).

#pos(e4338,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4339,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4338,e4339).

#pos(e4340,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4341,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4340,e4341).

#pos(e4342,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4343,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4342,e4343).

#pos(e4344,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4345,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4344,e4345).

#pos(e4346,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4347,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4346,e4347).

#pos(e4348,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4349,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4348,e4349).

#pos(e4350,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4351,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(3,1)). 
}).
#brave_ordering(e4350,e4351).

#pos(e4352,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4353,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e4352,e4353).

#pos(e4354,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4355,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e4354,e4355).

#pos(e4356,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,4)). 
}).
#pos(e4357,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,4)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e4356,e4357).

#pos(e4358,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4359,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4358,e4359).

#pos(e4360,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4361,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4360,e4361).

#pos(e4362,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4363,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4362,e4363).

#pos(e4364,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,3)). 
}).
#pos(e4365,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,4)). true(has(3,1)). true(has(2,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e4364,e4365).

#pos(e4366,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,4)). true(has(2,1)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e4367,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,4)). true(has(2,1)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4366,e4367).

#pos(e4368,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,4)). true(has(2,1)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e4369,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(4,4)). true(has(2,1)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4368,e4369).

#pos(e4370,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e4371,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4370,e4371).

#pos(e4372,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,3)). 
}).
#pos(e4373,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,4)). 
}).
#brave_ordering(e4372,e4373).

#pos(e4374,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4375,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4374,e4375).

#pos(e4376,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4377,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4376,e4377).

#pos(e4378,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4379,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4378,e4379).

#pos(e4380,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4381,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4380,e4381).

#pos(e4382,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4383,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(4,2)). true(has(3,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4382,e4383).

#pos(e4384,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4385,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4384,e4385).

#pos(e4386,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4387,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,1)). true(has(2,1)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e4386,e4387).

#pos(e4388,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e4389,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e4388,e4389).

#pos(e4390,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e4391,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,1)). true(has(4,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4390,e4391).

#pos(e4392,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4393,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4392,e4393).

#pos(e4394,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4395,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4394,e4395).

#pos(e4396,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4397,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4396,e4397).

#pos(e4398,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4399,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4398,e4399).

#pos(e4400,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e4401,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4400,e4401).

#pos(e4402,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e4403,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4402,e4403).

#pos(e4404,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e4405,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4404,e4405).

#pos(e4406,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e4407,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4406,e4407).

#pos(e4408,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e4409,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4408,e4409).

#pos(e4410,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e4411,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e4410,e4411).

#pos(e4412,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,2)). 
}).
#pos(e4413,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,1)). does(b,remove(4,4)). 
}).
#brave_ordering(e4412,e4413).

#pos(e4414,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4415,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4414,e4415).

#pos(e4416,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4417,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4416,e4417).

#pos(e4418,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#pos(e4419,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4418,e4419).

#pos(e4420,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4421,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4420,e4421).

#pos(e4422,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4423,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e4422,e4423).

#pos(e4424,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4425,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4424,e4425).

#pos(e4426,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(b,remove(4,2)). 
}).
#pos(e4427,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(2,0)). true(has(1,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4426,e4427).

#pos(e4428,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4429,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e4428,e4429).

#pos(e4430,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4431,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4430,e4431).

#pos(e4432,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(4,2)). true(has(1,0)). does(b,remove(4,2)). 
}).
#pos(e4433,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(4,2)). true(has(1,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4432,e4433).

#pos(e4434,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4435,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4434,e4435).

#pos(e4436,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4437,{}, {}, {
 true(control(a)). true(has(4,3)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4436,e4437).

#pos(e4438,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4439,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(1,1)). 
}).
#brave_ordering(e4438,e4439).

#pos(e4440,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4441,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,1)). 
}).
#brave_ordering(e4440,e4441).

#pos(e4442,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,2)). 
}).
#pos(e4443,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,0)). true(has(4,3)). does(b,remove(4,3)). 
}).
#brave_ordering(e4442,e4443).

#pos(e4444,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,4)). true(has(2,0)). true(has(1,0)). does(b,remove(4,4)). 
}).
#pos(e4445,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(4,4)). true(has(2,0)). true(has(1,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e4444,e4445).

#pos(e4446,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4447,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4446,e4447).

#pos(e4448,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4449,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4448,e4449).

#pos(e4450,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4451,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4450,e4451).

#pos(e4452,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4453,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,0)). does(a,remove(4,4)). 
}).
#brave_ordering(e4452,e4453).

#pos(e4454,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4455,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4454,e4455).

#pos(e4456,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4457,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4456,e4457).

#pos(e4458,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4459,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4458,e4459).

#pos(e4460,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4461,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4460,e4461).

#pos(e4462,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4463,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4462,e4463).

#pos(e4464,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4465,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4464,e4465).

#pos(e4466,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4467,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4466,e4467).

#pos(e4468,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4469,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(3,1)). 
}).
#brave_ordering(e4468,e4469).

#pos(e4470,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4471,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,1)). 
}).
#brave_ordering(e4470,e4471).

#pos(e4472,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,2)). 
}).
#pos(e4473,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,0)). true(has(4,3)). does(a,remove(4,3)). 
}).
#brave_ordering(e4472,e4473).

#pos(e4474,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,4)). 
}).
#pos(e4475,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,4)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4474,e4475).

#pos(e4476,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e4477,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,4)). 
}).
#brave_ordering(e4476,e4477).

#pos(e4478,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e4479,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4478,e4479).

#pos(e4480,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e4481,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#brave_ordering(e4480,e4481).

#pos(e4482,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e4483,{}, {}, {
 true(control(b)). true(has(4,4)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4482,e4483).

#pos(e4484,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4485,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4484,e4485).

#pos(e4486,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4487,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,0)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e4486,e4487).

#pos(e4488,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,4)). 
}).
#pos(e4489,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e4488,e4489).

#pos(e4490,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(4,4)). 
}).
#pos(e4491,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,4)). true(has(1,1)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4490,e4491).

#pos(e4492,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4493,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4492,e4493).

#pos(e4494,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4495,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4494,e4495).

#pos(e4496,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#pos(e4497,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4496,e4497).

#pos(e4498,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4499,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4498,e4499).

#pos(e4500,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,2)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e4501,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,1)). true(has(3,2)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4500,e4501).

#pos(e4502,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4503,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4502,e4503).

#pos(e4504,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4505,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4504,e4505).

#pos(e4506,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4507,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4506,e4507).

#pos(e4508,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4509,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4508,e4509).

#pos(e4510,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,3)). 
}).
#pos(e4511,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,3)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4510,e4511).

#pos(e4512,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4513,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4512,e4513).

#pos(e4514,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4515,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4514,e4515).

#pos(e4516,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4517,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4516,e4517).

#pos(e4518,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4519,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4518,e4519).

#pos(e4520,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e4521,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4520,e4521).

#pos(e4522,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e4523,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e4522,e4523).

#pos(e4524,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(4,1)). 
}).
#pos(e4525,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4524,e4525).

#pos(e4526,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(a,remove(3,2)). 
}).
#pos(e4527,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4526,e4527).

#pos(e4528,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e4529,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4528,e4529).

#pos(e4530,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e4531,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4530,e4531).

#pos(e4532,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,1)). does(b,remove(3,2)). 
}).
#pos(e4533,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(2,0)). true(has(4,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4532,e4533).

#pos(e4534,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4535,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4534,e4535).

#pos(e4536,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4537,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4536,e4537).

#pos(e4538,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,1)). 
}).
#pos(e4539,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,1)). true(has(4,2)). does(b,remove(4,2)). 
}).
#brave_ordering(e4538,e4539).

#pos(e4540,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,2)). 
}).
#pos(e4541,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(3,0)). true(has(4,2)). does(a,remove(4,1)). 
}).
#brave_ordering(e4540,e4541).

#pos(e4542,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4543,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4542,e4543).

#pos(e4544,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#pos(e4545,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,3)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4544,e4545).

#pos(e4546,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4547,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(4,3)). 
}).
#brave_ordering(e4546,e4547).

#pos(e4548,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4549,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4548,e4549).

#pos(e4550,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4551,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(4,3)). true(has(3,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4550,e4551).

#pos(e4552,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,1)). does(b,remove(4,3)). 
}).
#pos(e4553,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e4552,e4553).

#pos(e4554,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,2)). 
}).
#pos(e4555,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,0)). true(has(4,2)). does(b,remove(4,1)). 
}).
#brave_ordering(e4554,e4555).

#pos(e4556,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4557,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,3)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4556,e4557).

#pos(e4558,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,3)). true(has(1,0)). does(a,remove(4,3)). 
}).
#pos(e4559,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(4,3)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4558,e4559).

#pos(e4560,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4561,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e4560,e4561).

#pos(e4562,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4563,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4562,e4563).

#pos(e4564,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4565,{}, {}, {
 true(control(b)). true(has(4,3)). true(has(1,1)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4564,e4565).

#pos(e4566,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4567,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,3)). 
}).
#brave_ordering(e4566,e4567).

#pos(e4568,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4569,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4568,e4569).

#pos(e4570,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4571,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4570,e4571).

#pos(e4572,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4573,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4572,e4573).

#pos(e4574,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4575,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,4)). true(has(2,0)). does(b,remove(4,4)). 
}).
#brave_ordering(e4574,e4575).

#pos(e4576,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4577,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4576,e4577).

#pos(e4578,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4579,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4578,e4579).

#pos(e4580,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4581,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4580,e4581).

#pos(e4582,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4583,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#brave_ordering(e4582,e4583).

#pos(e4584,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#pos(e4585,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4584,e4585).

#pos(e4586,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e4587,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(3,0)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4586,e4587).

#pos(e4588,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e4589,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4588,e4589).

#pos(e4590,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#pos(e4591,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4590,e4591).

#pos(e4592,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e4593,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,1)). 
}).
#brave_ordering(e4592,e4593).

#pos(e4594,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(4,2)). 
}).
#pos(e4595,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,0)). true(has(4,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4594,e4595).

#pos(e4596,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4597,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(2,0)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4596,e4597).

#pos(e4598,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,2)). 
}).
#pos(e4599,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,2)). true(has(2,0)). true(has(3,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4598,e4599).

#pos(e4600,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4601,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4600,e4601).

#pos(e4602,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4603,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,2)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4602,e4603).

#pos(e4604,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,2)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#pos(e4605,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,2)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4604,e4605).

#pos(e4606,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,2)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#pos(e4607,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,2)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4606,e4607).

#pos(e4608,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4609,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,0)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4608,e4609).

#pos(e4610,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4611,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,2)). 
}).
#brave_ordering(e4610,e4611).

#pos(e4612,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#pos(e4613,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4612,e4613).

#pos(e4614,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4615,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,1)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4614,e4615).

#pos(e4616,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,1)). true(has(1,0)). does(a,remove(4,2)). 
}).
#pos(e4617,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4616,e4617).

#pos(e4618,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4619,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,2)). 
}).
#brave_ordering(e4618,e4619).

#pos(e4620,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(b,remove(4,1)). 
}).
#pos(e4621,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e4620,e4621).

#pos(e4622,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,2)). 
}).
#pos(e4623,{}, {}, {
 true(control(b)). true(has(4,2)). true(has(1,0)). true(has(3,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4622,e4623).

#pos(e4624,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4625,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,0)). true(has(1,0)). does(a,remove(4,2)). 
}).
#brave_ordering(e4624,e4625).

#pos(e4626,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4627,{}, {}, {
 true(control(a)). true(has(4,2)). true(has(2,1)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4626,e4627).

#pos(e4628,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4629,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4628,e4629).

#pos(e4630,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,0)). does(b,remove(4,2)). 
}).
#pos(e4631,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(1,1)). true(has(4,2)). true(has(3,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4630,e4631).

#pos(e4632,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e4633,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,1)). true(has(4,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e4632,e4633).

#pos(e4634,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,1)). true(has(4,2)). does(b,remove(2,1)). 
}).
#pos(e4635,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,2)). true(has(1,1)). true(has(4,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e4634,e4635).

#pos(e4636,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4637,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4636,e4637).

#pos(e4638,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4639,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4638,e4639).

#pos(e4640,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4641,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4640,e4641).

#pos(e4642,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e4643,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4642,e4643).

#pos(e4644,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(3,2)). 
}).
#pos(e4645,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,2)). true(has(2,0)). true(has(4,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4644,e4645).

#pos(e4646,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#pos(e4647,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4646,e4647).

#pos(e4648,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4649,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4648,e4649).

#pos(e4650,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4651,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4650,e4651).

#pos(e4652,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4653,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4652,e4653).

#pos(e4654,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4655,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4654,e4655).

#pos(e4656,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,1)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4657,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,1)). true(has(3,2)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e4656,e4657).

#pos(e4658,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,1)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4659,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(1,1)). true(has(3,2)). true(has(2,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4658,e4659).

#pos(e4660,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4661,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4660,e4661).

#pos(e4662,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4663,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4662,e4663).

#pos(e4664,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4665,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(4,1)). 
}).
#brave_ordering(e4664,e4665).

#pos(e4666,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4667,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4666,e4667).

#pos(e4668,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4669,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,1)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4668,e4669).

#pos(e4670,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4671,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4670,e4671).

#pos(e4672,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4673,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4672,e4673).

#pos(e4674,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4675,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,1)). true(has(2,0)). does(b,remove(4,1)). 
}).
#brave_ordering(e4674,e4675).

#pos(e4676,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,2)). 
}).
#pos(e4677,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). true(has(4,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4676,e4677).

#pos(e4678,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4679,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4678,e4679).

#pos(e4680,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4681,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4680,e4681).

#pos(e4682,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4683,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e4682,e4683).

#pos(e4684,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4685,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(3,2)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e4684,e4685).

#pos(e4686,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(3,2)). true(has(1,0)). does(a,remove(4,1)). 
}).
#pos(e4687,{}, {}, {
 true(control(a)). true(has(4,1)). true(has(2,2)). true(has(3,2)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4686,e4687).

#pos(e4688,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(4,3)). 
}).
#pos(e4689,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(4,2)). 
}).
#brave_ordering(e4688,e4689).

#pos(e4690,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(4,3)). 
}).
#pos(e4691,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e4690,e4691).

#pos(e4692,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(4,3)). 
}).
#pos(e4693,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e4692,e4693).

#pos(e4694,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(4,3)). 
}).
#pos(e4695,{}, {}, {
 true(control(a)). true(has(4,4)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e4694,e4695).

#pos(e4696,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(4,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e4697,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(4,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4696,e4697).

#pos(e4698,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e4699,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4698,e4699).

#pos(e4700,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e4701,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e4700,e4701).

#pos(e4702,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(4,0)). true(has(3,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e4703,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(4,0)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4702,e4703).

#pos(e4704,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4705,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4704,e4705).

#pos(e4706,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e4707,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4706,e4707).

#pos(e4708,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e4709,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(4,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e4708,e4709).

#pos(e4710,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#pos(e4711,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#brave_ordering(e4710,e4711).

#pos(e4712,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e4713,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4712,e4713).

#pos(e4714,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e4715,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4714,e4715).

#pos(e4716,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e4717,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4716,e4717).

#pos(e4718,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e4719,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e4718,e4719).

#pos(e4720,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e4721,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(4,0)). true(has(2,1)). does(a,remove(3,3)). 
}).
#brave_ordering(e4720,e4721).

#pos(e4722,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e4723,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4722,e4723).

#pos(e4724,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4725,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4724,e4725).

#pos(e4726,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e4727,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4726,e4727).

#pos(e4728,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#pos(e4729,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#brave_ordering(e4728,e4729).

#pos(e4730,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e4731,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4730,e4731).

#pos(e4732,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e4733,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e4732,e4733).

#pos(e4734,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,1)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4735,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(3,3)). true(has(1,1)). true(has(2,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4734,e4735).

#pos(e4736,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4737,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4736,e4737).

#pos(e4738,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e4739,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4738,e4739).

#pos(e4740,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e4741,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e4740,e4741).

#pos(e4742,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4743,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4742,e4743).

#pos(e4744,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e4745,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4744,e4745).

#pos(e4746,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e4747,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(2,2)). true(has(1,1)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e4746,e4747).

#pos(e4748,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#pos(e4749,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(3,1)). 
}).
#brave_ordering(e4748,e4749).

#pos(e4750,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#pos(e4751,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(1,1)). 
}).
#brave_ordering(e4750,e4751).

#pos(e4752,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(4,4)). 
}).
#pos(e4753,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,1)). true(has(4,4)). does(b,remove(4,1)). 
}).
#brave_ordering(e4752,e4753).

#pos(e4754,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#pos(e4755,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4754,e4755).

#pos(e4756,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e4757,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4756,e4757).

#pos(e4758,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(3,1)). 
}).
#pos(e4759,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). true(has(4,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4758,e4759).

#pos(e4760,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,0)). true(has(3,3)). true(has(1,0)). does(b,remove(3,3)). 
}).
#pos(e4761,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(4,0)). true(has(3,3)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4760,e4761).

#pos(e4762,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4763,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e4762,e4763).

#pos(e4764,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4765,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4764,e4765).

#pos(e4766,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4767,{}, {}, {
 true(control(a)). true(has(1,1)). true(has(3,3)). true(has(4,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4766,e4767).

#pos(e4768,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4769,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4768,e4769).

#pos(e4770,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4771,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4770,e4771).

#pos(e4772,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4773,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4772,e4773).

#pos(e4774,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e4775,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4774,e4775).

#pos(e4776,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e4777,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4776,e4777).

#pos(e4778,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e4779,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4778,e4779).

#pos(e4780,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4781,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,3)). 
}).
#brave_ordering(e4780,e4781).

#pos(e4782,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4783,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4782,e4783).

#pos(e4784,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4785,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4784,e4785).

#pos(e4786,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(3,3)). true(has(2,1)). does(a,remove(3,3)). 
}).
#pos(e4787,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(3,3)). true(has(2,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4786,e4787).

#pos(e4788,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4789,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4788,e4789).

#pos(e4790,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4791,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4790,e4791).

#pos(e4792,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4793,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4792,e4793).

#pos(e4794,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e4795,{}, {}, {
 true(control(b)). true(has(4,0)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4794,e4795).

#pos(e4796,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e4797,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4796,e4797).

#pos(e4798,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#pos(e4799,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4798,e4799).

#pos(e4800,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4801,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,3)). 
}).
#brave_ordering(e4800,e4801).

#pos(e4802,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4803,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e4802,e4803).

#pos(e4804,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e4805,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(4,0)). true(has(1,0)). true(has(2,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4804,e4805).

#pos(e4806,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e4807,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(4,0)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4806,e4807).

#pos(e4808,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4809,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e4808,e4809).

#pos(e4810,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e4811,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,0)). true(has(3,2)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4810,e4811).

#pos(e4812,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4813,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4812,e4813).

#pos(e4814,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4815,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(3,3)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4814,e4815).

#pos(e4816,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e4817,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e4816,e4817).

#pos(e4818,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e4819,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e4818,e4819).

#pos(e4820,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e4821,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e4820,e4821).

#pos(e4822,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#pos(e4823,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4822,e4823).

#pos(e4824,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4825,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e4824,e4825).

#pos(e4826,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e4827,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,1)). true(has(4,0)). true(has(2,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e4826,e4827).

#pos(e4828,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e4829,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(4,0)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4828,e4829).

#pos(e4830,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4831,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e4830,e4831).

#pos(e4832,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e4833,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4832,e4833).

#pos(e4834,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e4835,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(4,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e4834,e4835).

#pos(e4836,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(1,1)). 
}).
#pos(e4837,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e4836,e4837).

#pos(e4838,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(1,1)). 
}).
#pos(e4839,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(a,remove(2,1)). 
}).
#brave_ordering(e4838,e4839).

#pos(e4840,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e4841,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e4840,e4841).

#pos(e4842,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,1)). does(b,remove(2,1)). 
}).
#pos(e4843,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e4842,e4843).

#pos(e4844,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,1)). does(b,remove(2,1)). 
}).
#pos(e4845,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(4,0)). true(has(1,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e4844,e4845).

#pos(e4846,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e4847,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e4846,e4847).

#pos(e4848,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(a,remove(2,2)). 
}).
#pos(e4849,{}, {}, {
 true(control(a)). true(has(4,0)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e4848,e4849).

#pos(e4850,{}, {}, {
 true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,5)). true(control(a)). does(a,remove(4,5)). 
}).
#pos(e4851,{}, {}, {
 true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,5)). true(control(a)). does(a,remove(4,1)). 
}).
#brave_ordering(e4850,e4851).

#pos(e4852,{}, {}, {
 true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,5)). true(control(a)). does(a,remove(4,5)). 
}).
#pos(e4853,{}, {}, {
 true(has(1,1)). true(has(2,2)). true(has(3,3)). true(has(4,5)). true(control(a)). does(a,remove(1,1)). 
}).
#brave_ordering(e4852,e4853).