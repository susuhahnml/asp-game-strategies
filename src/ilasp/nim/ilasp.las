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
goal(X,1):- true(has(p1,0)), true(has(p2,0)), true(has(p3,0)), true(control(X)).
terminal :- goal(_,_).

%------------------------- EXTRA INFORMATION TO PERFORM STRATEGY -----------------------------

% Define predicates to learn real strategy
binary(0,0,0,0).
binary(1,0,0,1).
binary(2,0,1,0).
binary(3,0,1,1).
binary(4,1,0,0).
binary(5,1,0,1).
binary(6,1,1,0).
binary(7,1,1,1).

totals(B14+B24+B34,B12+B22+B32,B11+B21+B31) :- next(has(P1,N1)), binary(N1,B14,B12,B11), next(has(P2,N2)), binary(N2,B24,B22,B21), next(has(P3,N3)), binary(N3,B34,B32,B31),P1!=P2,P2!=P3,P3!=P1.

%Expected strategy
% :~ totals(V0,V1,V2), V0\2 != 0.[1@1, 1587, V0, V1, V2]
% :~ totals(V0,V1,V2), V1\2 != 0.[1@1, 1591, V0, V1, V2]
% :~ totals(V0,V1,V2), V2\2 != 0.[1@1, 1595, V0, V1, V2]

%------------------------------- LANGUAGE BIAS --------------------------------------

#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(amount,3).

#modeo(1,totals(var(total),var(total),var(total)),(positive)).
% #modeo(1,totals(const(amount),const(amount),const(amount)),(positive)).
#modeo(1,var(total)\2!=0).
#weight(-1).
#weight(1).
#maxp(2).

%------------------------------- LANGUAGE BIAS OTHER OPTIONS --------------------------------------

% % #modeo(1,totals(var(total),var(total),var(total)),(positive)).
% %#modeo(1,totals(const(amount),const(amount),const(amount)),(positive)).
% #modeo(3,next(has(var(pile),var(number))),(positive)).
% #modeo(6,var(pile)!=var(pile),(symmetric,anti_reflexive)).
% % #modeo(3,(var(number)+var(number)+var(number))\2!=0).
% #weight(-1).
% #weight(1).
% #weight(2).
% #weight(3).
% #maxp(3).


% #constant(pile,p1).
% #constant(pile,p2).
% #constant(pile,p3).
% #constant(b,1).
% #constant(b,0).

% #modeo(3,next(has(var(pile),var(number))),(positive)).
% #modeo(3,binary(var(number),const(b),const(b),const(b)),(positive)).
% #modeo(3,sum(var(number),var(number),var(number))).
% #modeo(3,var(number)\2!=0).

% #weight(-1).
% #weight(1).
% #maxp(2).
% #maxv(5).

%------------------------------- EXAMPLES --------------------------------------



#pos(e0,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e1,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,2)). 
}).
#pos(e3,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,2)). 
}).
#pos(e5,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). does(a,remove(2,1)). 
}).
#pos(e7,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). does(a,remove(2,2)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). does(a,remove(2,1)). 
}).
#pos(e9,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). does(b,remove(2,2)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e13,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,2)). 
}).
#pos(e15,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,2)). 
}).
#pos(e17,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). does(b,remove(2,1)). 
}).
#pos(e19,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). does(b,remove(2,1)). 
}).
#pos(e21,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e23,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e25,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e27,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). does(a,remove(2,1)). 
}).
#pos(e29,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). does(a,remove(3,1)). 
}).
#pos(e31,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). does(a,remove(1,1)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). does(a,remove(3,1)). 
}).
#pos(e33,{}, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). does(a,remove(1,2)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). does(b,remove(2,3)). 
}).
#pos(e35,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). does(b,remove(2,1)). 
}).
#pos(e37,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). does(b,remove(2,1)). 
}).
#pos(e39,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(2,2)). 
}).
#pos(e41,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(2,2)). 
}).
#pos(e43,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(2,2)). 
}).
#pos(e45,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). does(a,remove(2,3)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). does(a,remove(2,3)). 
}).
#pos(e47,{}, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). does(a,remove(1,1)). 
}).
#pos(e49,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). does(a,remove(1,2)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). does(a,remove(1,1)). 
}).
#pos(e51,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(b,remove(1,1)). 
}).
#pos(e53,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). does(a,remove(1,2)). 
}).
#pos(e55,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). does(a,remove(1,2)). 
}).
#pos(e57,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,1)). 
}).
#pos(e59,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). does(b,remove(2,2)). 
}).
#pos(e61,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). does(b,remove(2,3)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). does(b,remove(2,3)). 
}).
#pos(e63,{}, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#pos(e65,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e67,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e69,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(1,2)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e71,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,0)). does(a,remove(2,3)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(has(1,3)). true(has(2,3)). true(has(3,1)). true(control(a)). does(a,remove(1,1)). 
}).
#pos(e73,{}, {}, {
 true(has(1,3)). true(has(2,3)). true(has(3,1)). true(control(a)). does(a,remove(1,2)). 
}).
#brave_ordering(e72,e73).