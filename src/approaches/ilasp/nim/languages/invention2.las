binary(0,1,0).
binary(0,2,0).
binary(0,4,0).


binary(1,1,1).
binary(1,2,0).
binary(1,4,0).

binary(2,1,0).
binary(2,2,1).
binary(2,4,0).

binary(3,1,1).
binary(3,2,1).
binary(3,4,0).

binary(4,1,0).
binary(4,2,0).
binary(4,4,1).

binary(5,1,1).
binary(5,2,0).
binary(5,4,1).

binary(6,1,0).
binary(6,2,1).
binary(6,4,1).

binary(7,1,1).
binary(7,2,1).
binary(7,4,1).

%------------------------------- LANGUAGE BIAS --------------------------------------

#modeh(b(var(n),var(pile),var(bin))).
#modeb(1,binary(var(num),var(n),var(bin)),(positive)).
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


% Expected strategy
% b(N,P1,B) :- next(has(P1,N1)), binary(N1,N,B).

% tb(N,B11+B12+B13) :- b(N,P1,B11), b(N,P2,B12), b(N,P3,B13), P1<P2, P2<P3.
% % 6 ~ tb(V0,V4+V2+V6) :- b(V0,V1,V2), b(V0,V3,V4), b(V0,V5,V6), V1 < V5, V3 < V5.
% odd(N) :- tb(N,T), T\2!=0.
% % 3 ~ odd(V0) :- tb(V0,V1), V1\2 != 0.
% :~ odd(V).[1@1,1,V]
% % 1 ~ :~ odd(V0).[1@1, 108581, V0]