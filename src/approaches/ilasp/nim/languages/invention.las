
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

%%%%%%%%%%%%%%%%%% Language bias

#modeh(bin_pile(var(n),var(pile),var(bin))).
#modeb(1,binary(var(num),var(n),var(bin)),(positive)).
#modeb(1,next(has(var(pile),var(num))),(positive)).
#modeb(3,bin_pile(var(n),var(pile),var(bin)),(positive)).
#modeh(total_bin_piles(var(n),var(bin)+var(bin)+var(bin)),(non_recursive)).
#modeb(2,var(pile)<var(pile),(symmetric,anti_reflexive)).
#maxv(7).

#modeo(1,total_bin_piles(var(n),var(t))).
#modeo(1,odd(var(t))).
#weight(-1).
#weight(1).

%%%%%%%%%% Reduce search space
#bias(":- head(total_bin_piles(X, _, _)), body(bin_pile(Y, _, _)), X != Y.").
#bias(":- head(bin_pile(X, _, _)), body(bin_pile(Y, _, _)), X != Y.").
#bias(":- body(bin_pile(X, _, _)), body(bin_pile(Y, _, _)), X != Y.").

%Remove equivalences
#bias(":- head(total_bin_piles(_, bin_exp(_, X, bin_exp(_, Y, Z)))), X > Y.").
#bias(":- head(total_bin_piles(_, bin_exp(_, X, bin_exp(_, Y, Z)))), Y > Z.").

%Remove several ocurrences of anonymus variables
#bias(":- body(bin_pile(_, _, anon(_))).").
#bias(":- body(bin_pile(_, anon(_), _)).").
#bias(":- body(bin_pile(anon(_), _, _)).").
#bias(":- body(binary(_, _, anon(_))).").
#bias(":- body(binary(_, anon(_), _)).").
#bias(":- body(binary(anon(_), _, _)).").
#bias(":- body(total_bin_piles(anon(_), _)).").
#bias(":- body(total_bin_piles(_, anon(_))).").

%%%%%%%%%%% Expected hypothesis
% :~ total_bin_piles(V0,V1), not odd(V1).[-1@2, 1, V0, V1]
% bin_pile(V1,V3,V2) :- binary(V0,V1,V2), next(has(V3,V0)).
% total_bin_piles(V0,V2+V4+V6) :- bin_pile(V0,V1,V2), bin_pile(V0,V3,V4), bin_pile(V0,V5,V6), V1 < V3, V3 < V5.