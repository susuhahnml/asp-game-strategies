% Define predicates to learn real strategy
binary(0,0,0,0).
binary(1,0,0,1).
binary(2,0,1,0).
binary(3,0,1,1).
binary(4,1,0,0).
binary(5,1,0,1).
binary(6,1,1,0).
binary(7,1,1,1).

% Expected strategy
% b1(P1,B1):-next(has(P1,N1)), binary(N1,B4,B2,B1).
% b2(P1,B2):-next(has(P1,N1)), binary(N1,B4,B2,B1).
% b4(P1,B4):-next(has(P1,N1)), binary(N1,B4,B2,B1).

% b1(P2,B1):-next(has(P2,N1)), binary(N1,B4,B2,B1).
% b2(P2,B2):-next(has(P2,N1)), binary(N1,B4,B2,B1).
% b4(P2,B4):-next(has(P2,N1)), binary(N1,B4,B2,B1).

% b1(P3,B1):-next(has(P3,N1)), binary(N1,B4,B2,B1).
% b2(P3,B2):-next(has(P3,N1)), binary(N1,B4,B2,B1).
% b4(P3,B4):-next(has(P3,N1)), binary(N1,B4,B2,B1).

% tb1(B11+B12+B13) :- b1(P1,B11), b1(P2,B12), b1(P3,B13), P1<P2, P2<P3.
% tb2(B21+B22+B23) :- b2(P1,B21), b2(P2,B22), b2(P3,B23), P1<P2, P2<P3.
% tb4(B41+B42+B43) :- b4(P1,B41), b4(P2,B42), b4(P3,B43), P1<P2, P2<P3.

% odd_b1 :- tb1(T), T\2!=0.
% odd_b2 :- tb2(T), T\2!=0.
% odd_b4 :- tb4(T), T\2!=0.

% :~ odd_b1.[1@1,1]
% :~ odd_b2.[1@1,2]
% :~ odd_b4.[1@1,4]

%

% Expected strategy
b(1,P1,B1):-next(has(P1,N1)), binary(N1,B3,B2,B1).
b(2,P1,B2):-next(has(P1,N1)), binary(N1,B3,B2,B1).
b(3,P1,B3):-next(has(P1,N1)), binary(N1,B3,B2,B1).

b(1,P2,B1):-next(has(P2,N1)), binary(N1,B3,B2,B1).
b(2,P2,B2):-next(has(P2,N1)), binary(N1,B3,B2,B1).
b(3,P2,B3):-next(has(P2,N1)), binary(N1,B3,B2,B1).

b(1,P3,B1):-next(has(P3,N1)), binary(N1,B3,B2,B1).
b(2,P3,B2):-next(has(P3,N1)), binary(N1,B3,B2,B1).
b(3,P3,B3):-next(has(P3,N1)), binary(N1,B3,B2,B1).

tb(N,B11+B12+B13) :- b(N,P1,B11), b(N,P2,B12), b(N,P3,B13), P1<P2, P2<P3.

odd(N) :- tb(N,T), T\2!=0.

:~ odd(V).[1@1,1,V]

%------------------------------- LANGUAGE BIAS --------------------------------------
% #constant(pos,1).
% #constant(pos,2).
% #constant(pos,3).

% #modeh(b(const(pos),var(pile),var(bin))).
% #modeb(1,binary(var(num),var(bin),var(bin),var(bin))).
% #modeb(3,b(var(n),var(pile),var(bin))).
% #modeh(tb(var(n),var(bin)+var(bin)+var(bin))).
% #modeb(2,var(pile)<var(pile),(symmetric,anti_reflexive)).
% #modeh(odd(var(n))).

% #modeo(1,odd(var(n))).

% #weight(-1).
% #weight(1).
% #maxv(7).
% #maxhl(2).
