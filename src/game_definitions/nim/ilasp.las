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
goal(X,-1):- true(has(p1,0)), true(has(p2,0)), true(has(p3,0)), true(control(X)).
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
%:~ totals(V0,V1,V2), V0\2 != 0.[1@1, 1587, V0, V1, V2]
%:~ totals(V0,V1,V2), V1\2 != 0.[1@1, 1591, V0, V1, V2]
%:~ totals(V0,V1,V2), V2\2 != 0.[1@1, 1595, V0, V1, V2]
%:~ totals(0,0,1).[-1@2, 26]
%:~ totals(0,0,3).[-1@2, 34]

%------------------------------- LANGUAGE BIAS --------------------------------------

#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(amount,3).

#modeo(1,totals(var(total),var(total),var(total)),(positive)).
%#modeo(1,totals(const(amount),const(amount),const(amount)),(positive)).
#modeo(1,var(total)\2!=0).
#weight(-1).
#weight(1).
#weight(2).
#maxp(2).

%------------------------------- EXAMPLES --------------------------------------

#pos(e0,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e5,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e7,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e9,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e11,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e13,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e15,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e17,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e19,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e21,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e23,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e25,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e27,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e29,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e31,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e33,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e35,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e37,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e39,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e41,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e43,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e45,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e47,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e49,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e51,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e53,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e55,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e57,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e59,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e61,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e63,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e65,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e67,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e69,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e71,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e73,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e72,e73).

#pos(e74,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e75,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e74,e75).

#pos(e76,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e77,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e76,e77).

#pos(e78,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e79,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e78,e79).

#pos(e80,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e81,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e80,e81).

#pos(e82,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e83,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e82,e83).

#pos(e84,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e85,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e84,e85).

#pos(e86,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e87,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e86,e87).

#pos(e88,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e89,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e88,e89).

#pos(e90,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e91,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e90,e91).

#pos(e92,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e93,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e92,e93).

#pos(e94,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e95,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e94,e95).

#pos(e96,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e97,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e96,e97).

#pos(e98,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e99,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e98,e99).

#pos(e100,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e101,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e100,e101).

#pos(e102,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e103,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e102,e103).

#pos(e104,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e105,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e104,e105).

#pos(e106,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e107,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e106,e107).

#pos(e108,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e109,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e108,e109).

#pos(e110,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e111,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e110,e111).

#pos(e112,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e113,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e112,e113).

#pos(e114,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e115,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e114,e115).

#pos(e116,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e117,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e116,e117).

#pos(e118,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e119,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e118,e119).

#pos(e120,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e121,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e120,e121).

#pos(e122,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e123,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e122,e123).

#pos(e124,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e125,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e124,e125).

#pos(e126,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e127,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e126,e127).

#pos(e128,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e129,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e128,e129).

#pos(e130,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e131,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e130,e131).

#pos(e132,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e133,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e132,e133).

#pos(e134,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e135,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e134,e135).

#pos(e136,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e137,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e136,e137).

#pos(e138,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e139,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e138,e139).

#pos(e140,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e141,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e140,e141).

#pos(e142,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e143,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e142,e143).

#pos(e144,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e145,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e144,e145).

#pos(e146,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e147,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e146,e147).

#pos(e148,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e149,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e148,e149).

#pos(e150,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e151,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e150,e151).

#pos(e152,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e153,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e152,e153).

#pos(e154,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e155,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e154,e155).

#pos(e156,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e157,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e156,e157).

#pos(e158,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e159,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e158,e159).

#pos(e160,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e161,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e160,e161).

#pos(e162,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e163,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e162,e163).

#pos(e164,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e165,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e164,e165).

#pos(e166,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e167,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e166,e167).

#pos(e168,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e169,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e168,e169).

#pos(e170,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e171,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e170,e171).

#pos(e172,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e173,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e172,e173).

#pos(e174,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e175,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e174,e175).

#pos(e176,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e177,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e176,e177).

#pos(e178,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e179,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e178,e179).

#pos(e180,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e181,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e180,e181).

#pos(e182,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e183,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e182,e183).

#pos(e184,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e185,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e184,e185).

#pos(e186,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e187,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e186,e187).

#pos(e188,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e189,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e188,e189).

#pos(e190,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e191,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e190,e191).

#pos(e192,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e193,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e192,e193).

#pos(e194,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e195,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e194,e195).

#pos(e196,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e197,{ does(a,remove(1,6)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e196,e197).

#pos(e198,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e199,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e198,e199).

#pos(e200,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e201,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e200,e201).

#pos(e202,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e203,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e202,e203).

#pos(e204,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e205,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e204,e205).

#pos(e206,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e207,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e206,e207).

#pos(e208,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e209,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e208,e209).

#pos(e210,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e211,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e210,e211).

#pos(e212,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e213,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e212,e213).

#pos(e214,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e215,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e214,e215).

#pos(e216,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e217,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e216,e217).

#pos(e218,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e219,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e218,e219).

#pos(e220,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e221,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e220,e221).

#pos(e222,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e223,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e222,e223).

#pos(e224,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e225,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e224,e225).

#pos(e226,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e227,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e226,e227).

#pos(e228,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e229,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e228,e229).

#pos(e230,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e231,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e230,e231).

#pos(e232,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e233,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e232,e233).

#pos(e234,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e235,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e234,e235).

#pos(e236,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e237,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e236,e237).

#pos(e238,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e239,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e238,e239).

#pos(e240,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e241,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e240,e241).

#pos(e242,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e243,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e242,e243).

#pos(e244,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e245,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e244,e245).

#pos(e246,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e247,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e246,e247).

#pos(e248,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e249,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e248,e249).

#pos(e250,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e251,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e250,e251).

#pos(e252,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e253,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e252,e253).

#pos(e254,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e255,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e254,e255).

#pos(e256,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e257,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e256,e257).

#pos(e258,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e259,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e258,e259).

#pos(e260,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e261,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e260,e261).

#pos(e262,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e263,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e262,e263).

#pos(e264,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e265,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e264,e265).

#pos(e266,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e267,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e266,e267).

#pos(e268,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e269,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e268,e269).

#pos(e270,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e271,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e270,e271).

#pos(e272,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e273,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e272,e273).

#pos(e274,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e275,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e274,e275).

#pos(e276,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e277,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e276,e277).

#pos(e278,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e279,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e278,e279).

#pos(e280,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e281,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e280,e281).

#pos(e282,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e283,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e282,e283).

#pos(e284,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e285,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e284,e285).

#pos(e286,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e287,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e286,e287).

#pos(e288,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e289,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e288,e289).

#pos(e290,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e291,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e290,e291).

#pos(e292,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e293,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e292,e293).

#pos(e294,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e295,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e294,e295).

#pos(e296,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e297,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e296,e297).

#pos(e298,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e299,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e298,e299).

#pos(e300,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e301,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e300,e301).

#pos(e302,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e303,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e302,e303).

#pos(e304,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e305,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e304,e305).

#pos(e306,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e307,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e306,e307).

#pos(e308,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e309,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e308,e309).

#pos(e310,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e311,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e310,e311).

#pos(e312,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e313,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e312,e313).

#pos(e314,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e315,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e314,e315).

#pos(e316,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e317,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e316,e317).

#pos(e318,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e319,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e318,e319).

#pos(e320,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e321,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e320,e321).

#pos(e322,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e323,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e322,e323).

#pos(e324,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e325,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e324,e325).

#pos(e326,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e327,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e326,e327).

#pos(e328,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e329,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e328,e329).

#pos(e330,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e331,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e330,e331).

#pos(e332,{ does(a,remove(1,6)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e333,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e332,e333).

#pos(e334,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e335,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e334,e335).

#pos(e336,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e337,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e336,e337).

#pos(e338,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e339,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e338,e339).

#pos(e340,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e341,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e340,e341).

#pos(e342,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e343,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e342,e343).

#pos(e344,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e345,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e344,e345).

#pos(e346,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e347,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e346,e347).

#pos(e348,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e349,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e348,e349).

#pos(e350,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e351,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e350,e351).

#pos(e352,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e353,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e352,e353).

#pos(e354,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e355,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e354,e355).

#pos(e356,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e357,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e356,e357).

#pos(e358,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e359,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e358,e359).

#pos(e360,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e361,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e360,e361).

#pos(e362,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e363,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e362,e363).

#pos(e364,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e365,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e364,e365).

#pos(e366,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e367,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e366,e367).

#pos(e368,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e369,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e368,e369).

#pos(e370,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#pos(e371,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#brave_ordering(e370,e371).

#pos(e372,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#pos(e373,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#brave_ordering(e372,e373).

#pos(e374,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#pos(e375,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#brave_ordering(e374,e375).

#pos(e376,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#pos(e377,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,6)). true(has(2,1)). 
}).
#brave_ordering(e376,e377).

#pos(e378,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e379,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e378,e379).

#pos(e380,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e381,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e380,e381).

#pos(e382,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e383,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e382,e383).

#pos(e384,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e385,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e384,e385).

#pos(e386,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e387,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e386,e387).

#pos(e388,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e389,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e388,e389).

#pos(e390,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e391,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e390,e391).

#pos(e392,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e393,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e392,e393).

#pos(e394,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e395,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e394,e395).

#pos(e396,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e397,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e396,e397).

#pos(e398,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e399,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e398,e399).

#pos(e400,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e401,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e400,e401).

#pos(e402,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e403,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e402,e403).

#pos(e404,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e405,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e404,e405).

#pos(e406,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e407,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e406,e407).

#pos(e408,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e409,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e408,e409).

#pos(e410,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e411,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e410,e411).

#pos(e412,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e413,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e412,e413).

#pos(e414,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e415,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e414,e415).

#pos(e416,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e417,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e416,e417).

#pos(e418,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e419,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e418,e419).

#pos(e420,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e421,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e420,e421).

#pos(e422,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e423,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e422,e423).

#pos(e424,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e425,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e424,e425).

#pos(e426,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e427,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e426,e427).

#pos(e428,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e429,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e428,e429).

#pos(e430,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e431,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e430,e431).

#pos(e432,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e433,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e432,e433).

#pos(e434,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e435,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e434,e435).

#pos(e436,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e437,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e436,e437).

#pos(e438,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e439,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e438,e439).

#pos(e440,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e441,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e440,e441).

#pos(e442,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e443,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e442,e443).

#pos(e444,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e445,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e444,e445).

#pos(e446,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e447,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e446,e447).

#pos(e448,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e449,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e448,e449).

#pos(e450,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e451,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e450,e451).

#pos(e452,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e453,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e452,e453).

#pos(e454,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e455,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e454,e455).

#pos(e456,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e457,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e456,e457).

#pos(e458,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e459,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e458,e459).

#pos(e460,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e461,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e460,e461).

#pos(e462,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e463,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e462,e463).

#pos(e464,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e465,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e464,e465).

#pos(e466,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e467,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e466,e467).

#pos(e468,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e469,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e468,e469).

#pos(e470,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e471,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e470,e471).

#pos(e472,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e473,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e472,e473).

#pos(e474,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e475,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e474,e475).

#pos(e476,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e477,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e476,e477).

#pos(e478,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e479,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e478,e479).

#pos(e480,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e481,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e480,e481).

#pos(e482,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e483,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e482,e483).

#pos(e484,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e485,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e484,e485).

#pos(e486,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e487,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e486,e487).

#pos(e488,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e489,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e488,e489).

#pos(e490,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e491,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e490,e491).

#pos(e492,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e493,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e492,e493).

#pos(e494,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e495,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e494,e495).

#pos(e496,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e497,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e496,e497).

#pos(e498,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e499,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e498,e499).

#pos(e500,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e501,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e500,e501).

#pos(e502,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e503,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e502,e503).

#pos(e504,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e505,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e504,e505).

#pos(e506,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e507,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e506,e507).

#pos(e508,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e509,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e508,e509).

#pos(e510,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e511,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e510,e511).

#pos(e512,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e513,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e512,e513).

#pos(e514,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e515,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e514,e515).

#pos(e516,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e517,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e516,e517).

#pos(e518,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,5)). 
}).
#pos(e519,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,5)). 
}).
#brave_ordering(e518,e519).

#pos(e520,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e521,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e520,e521).

#pos(e522,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e523,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e522,e523).

#pos(e524,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e525,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e524,e525).

#pos(e526,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e527,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e526,e527).

#pos(e528,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e529,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e528,e529).

#pos(e530,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e531,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e530,e531).

#pos(e532,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e533,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e532,e533).

#pos(e534,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e535,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e534,e535).

#pos(e536,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e537,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e536,e537).

#pos(e538,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e539,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e538,e539).

#pos(e540,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e541,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e540,e541).

#pos(e542,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e543,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e542,e543).

#pos(e544,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e545,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e544,e545).

#pos(e546,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e547,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e546,e547).

#pos(e548,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e549,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e548,e549).

#pos(e550,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e551,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e550,e551).

#pos(e552,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e553,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e552,e553).

#pos(e554,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e555,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e554,e555).

#pos(e556,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e557,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e556,e557).

#pos(e558,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e559,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e558,e559).

#pos(e560,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e561,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e560,e561).

#pos(e562,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e563,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e562,e563).

#pos(e564,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e565,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e564,e565).

#pos(e566,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e567,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e566,e567).

#pos(e568,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e569,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e568,e569).

#pos(e570,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e571,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e570,e571).

#pos(e572,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e573,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e572,e573).

#pos(e574,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e575,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e574,e575).

#pos(e576,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e577,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e576,e577).

#pos(e578,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e579,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e578,e579).

#pos(e580,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e581,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e580,e581).

#pos(e582,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e583,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e582,e583).

#pos(e584,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e585,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e584,e585).

#pos(e586,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e587,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e586,e587).

#pos(e588,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e589,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e588,e589).

#pos(e590,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e591,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e590,e591).

#pos(e592,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e593,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e592,e593).

#pos(e594,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e595,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e594,e595).

#pos(e596,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e597,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e596,e597).

#pos(e598,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e599,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e598,e599).

#pos(e600,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e601,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e600,e601).

#pos(e602,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e603,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e602,e603).

#pos(e604,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e605,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e604,e605).

#pos(e606,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e607,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e606,e607).

#pos(e608,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e609,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e608,e609).

#pos(e610,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e611,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e610,e611).

#pos(e612,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e613,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e612,e613).

#pos(e614,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e615,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e614,e615).

#pos(e616,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e617,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e616,e617).

#pos(e618,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e619,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e618,e619).

#pos(e620,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e621,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e620,e621).

#pos(e622,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e623,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e622,e623).

#pos(e624,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e625,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e624,e625).

#pos(e626,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e627,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e626,e627).

#pos(e628,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e629,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e628,e629).

#pos(e630,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e631,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e630,e631).

#pos(e632,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e633,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e632,e633).

#pos(e634,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e635,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e634,e635).

#pos(e636,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e637,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e636,e637).

#pos(e638,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e639,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e638,e639).

#pos(e640,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e641,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e640,e641).

#pos(e642,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e643,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e642,e643).

#pos(e644,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#pos(e645,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,5)). 
}).
#brave_ordering(e644,e645).

#pos(e646,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e647,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e646,e647).

#pos(e648,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e649,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e648,e649).

#pos(e650,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e651,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e650,e651).

#pos(e652,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e653,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e652,e653).

#pos(e654,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e655,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e654,e655).

#pos(e656,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e657,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e656,e657).

#pos(e658,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e659,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e658,e659).

#pos(e660,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e661,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e660,e661).

#pos(e662,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e663,{ does(a,remove(1,6)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e662,e663).

#pos(e664,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e665,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e664,e665).

#pos(e666,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e667,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e666,e667).

#pos(e668,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e669,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e668,e669).

#pos(e670,{ does(a,remove(1,6)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e671,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,6)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e670,e671).

#pos(e672,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e673,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e672,e673).

#pos(e674,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e675,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e674,e675).

#pos(e676,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e677,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e676,e677).

#pos(e678,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e679,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e678,e679).

#pos(e680,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e681,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e680,e681).

#pos(e682,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e683,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e682,e683).

#pos(e684,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e685,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e684,e685).

#pos(e686,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e687,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e686,e687).

#pos(e688,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e689,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e688,e689).

#pos(e690,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e691,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e690,e691).

#pos(e692,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e693,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e692,e693).

#pos(e694,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e695,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e694,e695).

#pos(e696,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e697,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e696,e697).

#pos(e698,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e699,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e698,e699).

#pos(e700,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e701,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e700,e701).

#pos(e702,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e703,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e702,e703).

#pos(e704,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e705,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e704,e705).

#pos(e706,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e707,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e706,e707).

#pos(e708,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e709,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e708,e709).

#pos(e710,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e711,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e710,e711).

#pos(e712,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e713,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e712,e713).

#pos(e714,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e715,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e714,e715).

#pos(e716,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e717,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e716,e717).

#pos(e718,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e719,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e718,e719).

#pos(e720,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e721,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e720,e721).

#pos(e722,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e723,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e722,e723).

#pos(e724,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e725,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e724,e725).

#pos(e726,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e727,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e726,e727).

#pos(e728,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e729,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e728,e729).

#pos(e730,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e731,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e730,e731).

#pos(e732,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e733,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e732,e733).

#pos(e734,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e735,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e734,e735).

#pos(e736,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e737,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e736,e737).

#pos(e738,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e739,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e738,e739).

#pos(e740,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e741,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e740,e741).

#pos(e742,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#pos(e743,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#brave_ordering(e742,e743).

#pos(e744,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#pos(e745,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#brave_ordering(e744,e745).

#pos(e746,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e747,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e746,e747).

#pos(e748,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e749,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e748,e749).

#pos(e750,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e751,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e750,e751).

#pos(e752,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e753,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e752,e753).

#pos(e754,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e755,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e754,e755).

#pos(e756,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e757,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e756,e757).

#pos(e758,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e759,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e758,e759).

#pos(e760,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e761,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e760,e761).

#pos(e762,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e763,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e762,e763).

#pos(e764,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e765,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e764,e765).

#pos(e766,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e767,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e766,e767).

#pos(e768,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e769,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e768,e769).

#pos(e770,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e771,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e770,e771).

#pos(e772,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e773,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e772,e773).

#pos(e774,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e775,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e774,e775).

#pos(e776,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e777,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e776,e777).

#pos(e778,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e779,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e778,e779).

#pos(e780,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e781,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e780,e781).

#pos(e782,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e783,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e782,e783).

#pos(e784,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e785,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e784,e785).

#pos(e786,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e787,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e786,e787).

#pos(e788,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e789,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e788,e789).

#pos(e790,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e791,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e790,e791).

#pos(e792,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e793,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e792,e793).

#pos(e794,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e795,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e794,e795).

#pos(e796,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e797,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e796,e797).

#pos(e798,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e799,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e798,e799).

#pos(e800,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e801,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e800,e801).

#pos(e802,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e803,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e802,e803).

#pos(e804,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e805,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e804,e805).

#pos(e806,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e807,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e806,e807).

#pos(e808,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e809,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e808,e809).

#pos(e810,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e811,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e810,e811).

#pos(e812,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e813,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e812,e813).

#pos(e814,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e815,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e814,e815).

#pos(e816,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e817,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e816,e817).

#pos(e818,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e819,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e818,e819).

#pos(e820,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e821,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e820,e821).

#pos(e822,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e823,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e822,e823).

#pos(e824,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e825,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e824,e825).

#pos(e826,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e827,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e826,e827).

#pos(e828,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e829,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e828,e829).

#pos(e830,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e831,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e830,e831).

#pos(e832,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e833,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e832,e833).

#pos(e834,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e835,{ does(b,remove(1,6)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e834,e835).

#pos(e836,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e837,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e836,e837).

#pos(e838,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e839,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e838,e839).

#pos(e840,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e841,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e840,e841).

#pos(e842,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e843,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e842,e843).

#pos(e844,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e845,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e844,e845).

#pos(e846,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e847,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e846,e847).

#pos(e848,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e849,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e848,e849).

#pos(e850,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e851,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e850,e851).

#pos(e852,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e853,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e852,e853).

#pos(e854,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e855,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e854,e855).

#pos(e856,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e857,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e856,e857).

#pos(e858,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e859,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e858,e859).

#pos(e860,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e861,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e860,e861).

#pos(e862,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e863,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e862,e863).

#pos(e864,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e865,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e864,e865).

#pos(e866,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e867,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e866,e867).

#pos(e868,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e869,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e868,e869).

#pos(e870,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e871,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e870,e871).

#pos(e872,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e873,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e872,e873).

#pos(e874,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e875,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e874,e875).

#pos(e876,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e877,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e876,e877).

#pos(e878,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e879,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e878,e879).

#pos(e880,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e881,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e880,e881).

#pos(e882,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e883,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e882,e883).

#pos(e884,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e885,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e884,e885).

#pos(e886,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e887,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e886,e887).

#pos(e888,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e889,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e888,e889).

#pos(e890,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e891,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e890,e891).

#pos(e892,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e893,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e892,e893).

#pos(e894,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e895,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e894,e895).

#pos(e896,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e897,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e896,e897).

#pos(e898,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#pos(e899,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#brave_ordering(e898,e899).

#pos(e900,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#pos(e901,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#brave_ordering(e900,e901).

#pos(e902,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#pos(e903,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#brave_ordering(e902,e903).

#pos(e904,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#pos(e905,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#brave_ordering(e904,e905).

#pos(e906,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#pos(e907,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,2)). 
}).
#brave_ordering(e906,e907).

#pos(e908,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e909,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e908,e909).

#pos(e910,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e911,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e910,e911).

#pos(e912,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e913,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e912,e913).

#pos(e914,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e915,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e914,e915).

#pos(e916,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e917,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e916,e917).

#pos(e918,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e919,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e918,e919).

#pos(e920,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e921,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e920,e921).

#pos(e922,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e923,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e922,e923).

#pos(e924,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e925,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e924,e925).

#pos(e926,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e927,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e926,e927).

#pos(e928,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e929,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e928,e929).

#pos(e930,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e931,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e930,e931).

#pos(e932,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e933,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e932,e933).

#pos(e934,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e935,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e934,e935).

#pos(e936,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e937,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e936,e937).

#pos(e938,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e939,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e938,e939).

#pos(e940,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e941,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e940,e941).

#pos(e942,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e943,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e942,e943).

#pos(e944,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e945,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e944,e945).

#pos(e946,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e947,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e946,e947).

#pos(e948,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e949,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e948,e949).

#pos(e950,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e951,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e950,e951).

#pos(e952,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,4)). 
}).
#pos(e953,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,4)). 
}).
#brave_ordering(e952,e953).

#pos(e954,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,4)). 
}).
#pos(e955,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,4)). 
}).
#brave_ordering(e954,e955).

#pos(e956,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e957,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e956,e957).

#pos(e958,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e959,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e958,e959).

#pos(e960,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e961,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e960,e961).

#pos(e962,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e963,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e962,e963).

#pos(e964,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e965,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e964,e965).

#pos(e966,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e967,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e966,e967).

#pos(e968,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e969,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e968,e969).

#pos(e970,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e971,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e970,e971).

#pos(e972,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e973,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e972,e973).

#pos(e974,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e975,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e974,e975).

#pos(e976,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e977,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e976,e977).

#pos(e978,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e979,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e978,e979).

#pos(e980,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e981,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e980,e981).

#pos(e982,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e983,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e982,e983).

#pos(e984,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e985,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e984,e985).

#pos(e986,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e987,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e986,e987).

#pos(e988,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e989,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e988,e989).

#pos(e990,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e991,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e990,e991).

#pos(e992,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e993,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e992,e993).

#pos(e994,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e995,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e994,e995).

#pos(e996,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e997,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e996,e997).

#pos(e998,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e999,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e998,e999).

#pos(e1000,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e1001,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e1000,e1001).

#pos(e1002,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e1003,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e1002,e1003).

#pos(e1004,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1005,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1004,e1005).

#pos(e1006,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1007,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1006,e1007).

#pos(e1008,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1009,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1008,e1009).

#pos(e1010,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e1011,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e1010,e1011).

#pos(e1012,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e1013,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e1012,e1013).

#pos(e1014,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1015,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1014,e1015).

#pos(e1016,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1017,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1016,e1017).

#pos(e1018,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1019,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1018,e1019).

#pos(e1020,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1021,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1020,e1021).

#pos(e1022,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1023,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1022,e1023).

#pos(e1024,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1025,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1024,e1025).

#pos(e1026,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1027,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1026,e1027).

#pos(e1028,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1029,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1028,e1029).

#pos(e1030,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1031,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1030,e1031).

#pos(e1032,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1033,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1032,e1033).

#pos(e1034,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1035,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1034,e1035).

#pos(e1036,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1037,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1036,e1037).

#pos(e1038,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1039,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1038,e1039).

#pos(e1040,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1041,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1040,e1041).

#pos(e1042,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1043,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1042,e1043).

#pos(e1044,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1045,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1044,e1045).

#pos(e1046,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1047,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1046,e1047).

#pos(e1048,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1049,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1048,e1049).

#pos(e1050,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1051,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1050,e1051).

#pos(e1052,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1053,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1052,e1053).

#pos(e1054,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1055,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1054,e1055).

#pos(e1056,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1057,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1056,e1057).

#pos(e1058,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1059,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1058,e1059).

#pos(e1060,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1061,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1060,e1061).

#pos(e1062,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1063,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1062,e1063).

#pos(e1064,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1065,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1064,e1065).

#pos(e1066,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1067,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1066,e1067).

#pos(e1068,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1069,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1068,e1069).

#pos(e1070,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1071,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1070,e1071).

#pos(e1072,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1073,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1072,e1073).

#pos(e1074,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1075,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1074,e1075).

#pos(e1076,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1077,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1076,e1077).

#pos(e1078,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e1079,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e1078,e1079).

#pos(e1080,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1081,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1080,e1081).

#pos(e1082,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1083,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1082,e1083).

#pos(e1084,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1085,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1084,e1085).

#pos(e1086,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1087,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1086,e1087).

#pos(e1088,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1089,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1088,e1089).

#pos(e1090,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1091,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1090,e1091).

#pos(e1092,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1093,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1092,e1093).

#pos(e1094,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1095,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1094,e1095).

#pos(e1096,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1097,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1096,e1097).

#pos(e1098,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1099,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1098,e1099).

#pos(e1100,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e1101,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e1100,e1101).

#pos(e1102,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e1103,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e1102,e1103).

#pos(e1104,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e1105,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e1104,e1105).

#pos(e1106,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1107,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1106,e1107).

#pos(e1108,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1109,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1108,e1109).

#pos(e1110,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1111,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1110,e1111).

#pos(e1112,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1113,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1112,e1113).

#pos(e1114,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1115,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1114,e1115).

#pos(e1116,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1117,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1116,e1117).

#pos(e1118,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1119,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1118,e1119).

#pos(e1120,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1121,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1120,e1121).

#pos(e1122,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1123,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1122,e1123).

#pos(e1124,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1125,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1124,e1125).

#pos(e1126,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1127,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1126,e1127).

#pos(e1128,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1129,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1128,e1129).

#pos(e1130,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1131,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1130,e1131).

#pos(e1132,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1133,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1132,e1133).

#pos(e1134,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1135,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1134,e1135).

#pos(e1136,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1137,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1136,e1137).

#pos(e1138,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1139,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1138,e1139).

#pos(e1140,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1141,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1140,e1141).

#pos(e1142,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e1143,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e1142,e1143).

#pos(e1144,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1145,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1144,e1145).

#pos(e1146,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1147,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1146,e1147).

#pos(e1148,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1149,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1148,e1149).

#pos(e1150,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1151,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1150,e1151).

#pos(e1152,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1153,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1152,e1153).

#pos(e1154,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1155,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1154,e1155).

#pos(e1156,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1157,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1156,e1157).

#pos(e1158,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1159,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1158,e1159).

#pos(e1160,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1161,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1160,e1161).

#pos(e1162,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1163,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1162,e1163).

#pos(e1164,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1165,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1164,e1165).

#pos(e1166,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1167,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1166,e1167).

#pos(e1168,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1169,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1168,e1169).

#pos(e1170,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1171,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1170,e1171).

#pos(e1172,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1173,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1172,e1173).

#pos(e1174,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1175,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1174,e1175).

#pos(e1176,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1177,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1176,e1177).

#pos(e1178,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1179,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1178,e1179).

#pos(e1180,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1181,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1180,e1181).

#pos(e1182,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1183,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1182,e1183).

#pos(e1184,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1185,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1184,e1185).

#pos(e1186,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1187,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1186,e1187).

#pos(e1188,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1189,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1188,e1189).

#pos(e1190,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1191,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1190,e1191).

#pos(e1192,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1193,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1192,e1193).

#pos(e1194,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1195,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1194,e1195).

#pos(e1196,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1197,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1196,e1197).

#pos(e1198,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1199,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1198,e1199).

#pos(e1200,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1201,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1200,e1201).

#pos(e1202,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1203,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1202,e1203).

#pos(e1204,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1205,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1204,e1205).

#pos(e1206,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1207,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1206,e1207).

#pos(e1208,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1209,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1208,e1209).

#pos(e1210,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1211,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1210,e1211).

#pos(e1212,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1213,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1212,e1213).

#pos(e1214,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1215,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1214,e1215).

#pos(e1216,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1217,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1216,e1217).

#pos(e1218,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1219,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1218,e1219).

#pos(e1220,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1221,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1220,e1221).

#pos(e1222,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1223,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1222,e1223).

#pos(e1224,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1225,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1224,e1225).

#pos(e1226,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1227,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1226,e1227).

#pos(e1228,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1229,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1228,e1229).

#pos(e1230,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1231,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1230,e1231).

#pos(e1232,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1233,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1232,e1233).

#pos(e1234,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1235,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1234,e1235).

#pos(e1236,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1237,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1236,e1237).

#pos(e1238,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1239,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1238,e1239).

#pos(e1240,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1241,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1240,e1241).

#pos(e1242,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1243,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1242,e1243).

#pos(e1244,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1245,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1244,e1245).

#pos(e1246,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1247,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1246,e1247).

#pos(e1248,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1249,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1248,e1249).

#pos(e1250,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1251,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1250,e1251).

#pos(e1252,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1253,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1252,e1253).

#pos(e1254,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1255,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1254,e1255).

#pos(e1256,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1257,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1256,e1257).

#pos(e1258,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1259,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1258,e1259).

#pos(e1260,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1261,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1260,e1261).

#pos(e1262,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1263,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1262,e1263).

#pos(e1264,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1265,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1264,e1265).

#pos(e1266,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1267,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1266,e1267).

#pos(e1268,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1269,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1268,e1269).

#pos(e1270,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1271,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1270,e1271).

#pos(e1272,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1273,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1272,e1273).

#pos(e1274,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1275,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1274,e1275).

#pos(e1276,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1277,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1276,e1277).

#pos(e1278,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1279,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1278,e1279).

#pos(e1280,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1281,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1280,e1281).

#pos(e1282,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1283,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1282,e1283).

#pos(e1284,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1285,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1284,e1285).

#pos(e1286,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1287,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1286,e1287).

#pos(e1288,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1289,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1288,e1289).

#pos(e1290,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1291,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1290,e1291).

#pos(e1292,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1293,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1292,e1293).

#pos(e1294,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1295,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1294,e1295).

#pos(e1296,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1297,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1296,e1297).

#pos(e1298,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1299,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1298,e1299).

#pos(e1300,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1301,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1300,e1301).

#pos(e1302,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1303,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1302,e1303).

#pos(e1304,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1305,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1304,e1305).

#pos(e1306,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1307,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1306,e1307).

#pos(e1308,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1309,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1308,e1309).

#pos(e1310,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1311,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1310,e1311).

#pos(e1312,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1313,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1312,e1313).

#pos(e1314,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1315,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1314,e1315).

#pos(e1316,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1317,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1316,e1317).

#pos(e1318,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1319,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1318,e1319).

#pos(e1320,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1321,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1320,e1321).

#pos(e1322,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1323,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1322,e1323).

#pos(e1324,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1325,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1324,e1325).

#pos(e1326,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#pos(e1327,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#brave_ordering(e1326,e1327).

#pos(e1328,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#pos(e1329,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,2)). 
}).
#brave_ordering(e1328,e1329).

#pos(e1330,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1331,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1330,e1331).

#pos(e1332,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1333,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1332,e1333).

#pos(e1334,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1335,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1334,e1335).

#pos(e1336,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1337,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1336,e1337).

#pos(e1338,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1339,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1338,e1339).

#pos(e1340,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1341,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1340,e1341).

#pos(e1342,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1343,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1342,e1343).

#pos(e1344,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1345,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1344,e1345).

#pos(e1346,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1347,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1346,e1347).

#pos(e1348,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1349,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1348,e1349).

#pos(e1350,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1351,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1350,e1351).

#pos(e1352,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1353,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1352,e1353).

#pos(e1354,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1355,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1354,e1355).

#pos(e1356,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1357,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1356,e1357).

#pos(e1358,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1359,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1358,e1359).

#pos(e1360,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1361,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1360,e1361).

#pos(e1362,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1363,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1362,e1363).

#pos(e1364,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1365,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1364,e1365).

#pos(e1366,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1367,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1366,e1367).

#pos(e1368,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1369,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1368,e1369).

#pos(e1370,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1371,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1370,e1371).

#pos(e1372,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1373,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1372,e1373).

#pos(e1374,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1375,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1374,e1375).

#pos(e1376,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1377,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1376,e1377).

#pos(e1378,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1379,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1378,e1379).

#pos(e1380,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1381,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1380,e1381).

#pos(e1382,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1383,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1382,e1383).

#pos(e1384,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1385,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1384,e1385).

#pos(e1386,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1387,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1386,e1387).

#pos(e1388,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1389,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1388,e1389).

#pos(e1390,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1391,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1390,e1391).

#pos(e1392,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e1393,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e1392,e1393).

#pos(e1394,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e1395,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e1394,e1395).

#pos(e1396,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e1397,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e1396,e1397).

#pos(e1398,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e1399,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e1398,e1399).

#pos(e1400,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1401,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1400,e1401).

#pos(e1402,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1403,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1402,e1403).

#pos(e1404,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1405,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1404,e1405).

#pos(e1406,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1407,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1406,e1407).

#pos(e1408,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1409,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1408,e1409).

#pos(e1410,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1411,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1410,e1411).

#pos(e1412,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1413,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1412,e1413).

#pos(e1414,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1415,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1414,e1415).

#pos(e1416,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1417,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1416,e1417).

#pos(e1418,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1419,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1418,e1419).

#pos(e1420,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1421,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1420,e1421).

#pos(e1422,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1423,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1422,e1423).

#pos(e1424,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#pos(e1425,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#brave_ordering(e1424,e1425).

#pos(e1426,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#pos(e1427,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#brave_ordering(e1426,e1427).

#pos(e1428,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#pos(e1429,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#brave_ordering(e1428,e1429).

#pos(e1430,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#pos(e1431,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,5)). 
}).
#brave_ordering(e1430,e1431).

#pos(e1432,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1433,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1432,e1433).

#pos(e1434,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1435,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1434,e1435).

#pos(e1436,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1437,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1436,e1437).

#pos(e1438,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1439,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1438,e1439).

#pos(e1440,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1441,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1440,e1441).

#pos(e1442,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1443,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1442,e1443).

#pos(e1444,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1445,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1444,e1445).

#pos(e1446,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1447,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1446,e1447).

#pos(e1448,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1449,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1448,e1449).

#pos(e1450,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1451,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1450,e1451).

#pos(e1452,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1453,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1452,e1453).

#pos(e1454,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1455,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1454,e1455).

#pos(e1456,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1457,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1456,e1457).

#pos(e1458,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1459,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1458,e1459).

#pos(e1460,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1461,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1460,e1461).

#pos(e1462,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1463,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1462,e1463).

#pos(e1464,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1465,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1464,e1465).

#pos(e1466,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1467,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1466,e1467).

#pos(e1468,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1469,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1468,e1469).

#pos(e1470,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1471,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1470,e1471).

#pos(e1472,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1473,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1472,e1473).

#pos(e1474,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1475,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1474,e1475).

#pos(e1476,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1477,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1476,e1477).

#pos(e1478,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1479,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1478,e1479).

#pos(e1480,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1481,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1480,e1481).

#pos(e1482,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1483,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1482,e1483).

#pos(e1484,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1485,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1484,e1485).

#pos(e1486,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1487,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1486,e1487).

#pos(e1488,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1489,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1488,e1489).

#pos(e1490,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1491,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1490,e1491).

#pos(e1492,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1493,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1492,e1493).

#pos(e1494,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1495,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1494,e1495).

#pos(e1496,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1497,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1496,e1497).

#pos(e1498,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1499,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1498,e1499).

#pos(e1500,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1501,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1500,e1501).

#pos(e1502,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1503,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1502,e1503).

#pos(e1504,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1505,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1504,e1505).

#pos(e1506,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1507,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1506,e1507).

#pos(e1508,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1509,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1508,e1509).

#pos(e1510,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1511,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1510,e1511).

#pos(e1512,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1513,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1512,e1513).

#pos(e1514,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1515,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1514,e1515).

#pos(e1516,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1517,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1516,e1517).

#pos(e1518,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1519,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1518,e1519).

#pos(e1520,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1521,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1520,e1521).

#pos(e1522,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1523,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1522,e1523).

#pos(e1524,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1525,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1524,e1525).

#pos(e1526,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1527,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1526,e1527).

#pos(e1528,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1529,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1528,e1529).

#pos(e1530,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1531,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1530,e1531).

#pos(e1532,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1533,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1532,e1533).

#pos(e1534,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1535,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1534,e1535).

#pos(e1536,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1537,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1536,e1537).

#pos(e1538,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1539,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1538,e1539).

#pos(e1540,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1541,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1540,e1541).

#pos(e1542,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1543,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1542,e1543).

#pos(e1544,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1545,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1544,e1545).

#pos(e1546,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1547,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1546,e1547).

#pos(e1548,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1549,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1548,e1549).

#pos(e1550,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1551,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1550,e1551).

#pos(e1552,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1553,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1552,e1553).

#pos(e1554,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1555,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1554,e1555).

#pos(e1556,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1557,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1556,e1557).

#pos(e1558,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1559,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1558,e1559).

#pos(e1560,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1561,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1560,e1561).

#pos(e1562,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1563,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1562,e1563).

#pos(e1564,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1565,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1564,e1565).

#pos(e1566,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1567,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1566,e1567).

#pos(e1568,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1569,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1568,e1569).

#pos(e1570,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1571,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1570,e1571).

#pos(e1572,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1573,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1572,e1573).

#pos(e1574,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1575,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1574,e1575).

#pos(e1576,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1577,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1576,e1577).

#pos(e1578,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1579,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1578,e1579).

#pos(e1580,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1581,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1580,e1581).

#pos(e1582,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1583,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1582,e1583).

#pos(e1584,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1585,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1584,e1585).

#pos(e1586,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1587,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1586,e1587).

#pos(e1588,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1589,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1588,e1589).

#pos(e1590,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1591,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1590,e1591).

#pos(e1592,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1593,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1592,e1593).

#pos(e1594,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1595,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1594,e1595).

#pos(e1596,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1597,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1596,e1597).

#pos(e1598,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1599,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1598,e1599).

#pos(e1600,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1601,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1600,e1601).

#pos(e1602,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1603,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1602,e1603).

#pos(e1604,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1605,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1604,e1605).

#pos(e1606,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1607,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1606,e1607).

#pos(e1608,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1609,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1608,e1609).

#pos(e1610,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1611,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1610,e1611).

#pos(e1612,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1613,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1612,e1613).

#pos(e1614,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1615,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1614,e1615).

#pos(e1616,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1617,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1616,e1617).

#pos(e1618,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1619,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1618,e1619).

#pos(e1620,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1621,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1620,e1621).

#pos(e1622,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1623,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1622,e1623).

#pos(e1624,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1625,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1624,e1625).

#pos(e1626,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1627,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1626,e1627).

#pos(e1628,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1629,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1628,e1629).

#pos(e1630,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1631,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1630,e1631).

#pos(e1632,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1633,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1632,e1633).

#pos(e1634,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1635,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1634,e1635).

#pos(e1636,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1637,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1636,e1637).

#pos(e1638,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1639,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1638,e1639).

#pos(e1640,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1641,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1640,e1641).

#pos(e1642,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1643,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1642,e1643).

#pos(e1644,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1645,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1644,e1645).

#pos(e1646,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1647,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1646,e1647).

#pos(e1648,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1649,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1648,e1649).

#pos(e1650,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1651,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1650,e1651).

#pos(e1652,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1653,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1652,e1653).

#pos(e1654,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1655,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1654,e1655).

#pos(e1656,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1657,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1656,e1657).

#pos(e1658,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1659,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1658,e1659).

#pos(e1660,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1661,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1660,e1661).

#pos(e1662,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1663,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1662,e1663).

#pos(e1664,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1665,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1664,e1665).

#pos(e1666,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1667,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1666,e1667).

#pos(e1668,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1669,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1668,e1669).

#pos(e1670,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1671,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1670,e1671).

#pos(e1672,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1673,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1672,e1673).

#pos(e1674,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1675,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1674,e1675).

#pos(e1676,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1677,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1676,e1677).

#pos(e1678,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1679,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1678,e1679).

#pos(e1680,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1681,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1680,e1681).

#pos(e1682,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1683,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1682,e1683).

#pos(e1684,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1685,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1684,e1685).

#pos(e1686,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1687,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1686,e1687).

#pos(e1688,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1689,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1688,e1689).

#pos(e1690,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1691,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1690,e1691).

#pos(e1692,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1693,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1692,e1693).

#pos(e1694,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1695,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1694,e1695).

#pos(e1696,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1697,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1696,e1697).

#pos(e1698,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1699,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1698,e1699).

#pos(e1700,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1701,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1700,e1701).

#pos(e1702,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1703,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1702,e1703).

#pos(e1704,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1705,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1704,e1705).

#pos(e1706,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1707,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1706,e1707).

#pos(e1708,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1709,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1708,e1709).

#pos(e1710,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1711,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1710,e1711).

#pos(e1712,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1713,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1712,e1713).

#pos(e1714,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1715,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1714,e1715).

#pos(e1716,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1717,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1716,e1717).

#pos(e1718,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1719,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1718,e1719).

#pos(e1720,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1721,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1720,e1721).

#pos(e1722,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1723,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1722,e1723).

#pos(e1724,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1725,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1724,e1725).

#pos(e1726,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1727,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1726,e1727).

#pos(e1728,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1729,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1728,e1729).

#pos(e1730,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1731,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1730,e1731).

#pos(e1732,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1733,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1732,e1733).

#pos(e1734,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1735,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1734,e1735).

#pos(e1736,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1737,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1736,e1737).

#pos(e1738,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1739,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1738,e1739).

#pos(e1740,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1741,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1740,e1741).

#pos(e1742,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1743,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1742,e1743).

#pos(e1744,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1745,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1744,e1745).

#pos(e1746,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1747,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1746,e1747).

#pos(e1748,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1749,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1748,e1749).

#pos(e1750,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1751,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1750,e1751).

#pos(e1752,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1753,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1752,e1753).

#pos(e1754,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1755,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1754,e1755).

#pos(e1756,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1757,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1756,e1757).

#pos(e1758,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1759,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1758,e1759).

#pos(e1760,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1761,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1760,e1761).

#pos(e1762,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1763,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1762,e1763).

#pos(e1764,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1765,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1764,e1765).

#pos(e1766,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1767,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1766,e1767).

#pos(e1768,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1769,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1768,e1769).

#pos(e1770,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1771,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1770,e1771).

#pos(e1772,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1773,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1772,e1773).

#pos(e1774,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1775,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1774,e1775).

#pos(e1776,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1777,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1776,e1777).

#pos(e1778,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1779,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1778,e1779).

#pos(e1780,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1781,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1780,e1781).

#pos(e1782,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1783,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1782,e1783).

#pos(e1784,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1785,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1784,e1785).

#pos(e1786,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1787,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1786,e1787).

#pos(e1788,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1789,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1788,e1789).

#pos(e1790,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1791,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1790,e1791).

#pos(e1792,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1793,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1792,e1793).

#pos(e1794,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1795,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1794,e1795).

#pos(e1796,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1797,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1796,e1797).

#pos(e1798,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1799,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1798,e1799).

#pos(e1800,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1801,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1800,e1801).

#pos(e1802,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1803,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1802,e1803).

#pos(e1804,{ does(a,remove(1,3)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#pos(e1805,{ does(a,remove(1,5)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#brave_ordering(e1804,e1805).

#pos(e1806,{ does(a,remove(1,3)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#pos(e1807,{ does(a,remove(1,2)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#brave_ordering(e1806,e1807).

#pos(e1808,{ does(a,remove(1,3)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#pos(e1809,{ does(a,remove(1,1)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,0)). true(control(a)). 
}).
#brave_ordering(e1808,e1809).