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