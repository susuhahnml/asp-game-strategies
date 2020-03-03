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
#constant(pile,1).
#constant(pile,2).
#constant(pile,3).
#constant(pile,4).

#modeh(b1(var(n),var(bin))).
#modeh(b2(var(n),var(bin))).
#modeh(b3(var(n),var(bin))).
#modeh(b4(var(n),var(bin))).
#modeb(1,binary(var(num),var(n),var(bin)),(positive)).
#modeb(1,next(has(const(pile),var(num))),(positive)).
#modeb(1,b1(var(n),var(bin)),(positive)).
#modeb(1,b2(var(n),var(bin)),(positive)).
#modeb(1,b3(var(n),var(bin)),(positive)).
#modeb(1,b4(var(n),var(bin)),(positive)).
#modeh(total_piles(var(bin)+var(bin)+var(bin)+var(bin)),(non_recursive)).
% #modeb(3,var(pile)<var(pile),(symmetric,anti_reflexive)).
#maxv(6).

#modeo(1,total_piles(var(t))).
#modeo(1,odd(var(t))).
% #weight(-1).
#weight(1).

%%%%%%%%%% Reduce search space
% #bias(":- head(total_piles(X, _)), body(bin_pile(Y, _, _)), X != Y.").
#bias(":- head(b1(_, _)), body(b2(_, _)).").
#bias(":- head(b1(_, _)), body(b3(_, _)).").
#bias(":- head(b1(_, _)), body(b4(_, _)).").
#bias(":- head(b2(_, _)), body(b1(_, _)).").
#bias(":- head(b2(_, _)), body(b3(_, _)).").
#bias(":- head(b2(_, _)), body(b4(_, _)).").
#bias(":- head(b3(_, _)), body(b2(_, _)).").
#bias(":- head(b3(_, _)), body(b1(_, _)).").
#bias(":- head(b3(_, _)), body(b4(_, _)).").
#bias(":- head(b4(_, _)), body(b2(_, _)).").
#bias(":- head(b4(_, _)), body(b3(_, _)).").
#bias(":- head(b4(_, _)), body(b1(_, _)).").
#bias(":- body(b1(X, _)), body(b2(Y, _)), X != Y.").
#bias(":- body(b1(X, _)), body(b3(Y, _)), X != Y.").
#bias(":- body(b1(X, _)), body(b4(Y, _)), X != Y.").
#bias(":- body(b2(X, _)), body(b3(Y, _)), X != Y.").
#bias(":- body(b2(X, _)), body(b4(Y, _)), X != Y.").
#bias(":- body(b3(X, _)), body(b4(Y, _)), X != Y.").

%Remove equivalences
#bias(":- head(total_piles(bin_exp(_, X, bin_exp(_, Y, bin_exp(_, Z, W))))), X > Y.").
#bias(":- head(total_piles(bin_exp(_, X, bin_exp(_, Y, bin_exp(_, Z, W))))), Y > Z.").
#bias(":- head(total_piles(bin_exp(_, X, bin_exp(_, Y, bin_exp(_, Z, W))))), Z > W.").

%Remove several ocurrences of anonymus variables
#bias(":- body(b1(_, anon(_))).").
#bias(":- body(b1(anon(_), _)).").
#bias(":- body(b2(_, anon(_))).").
#bias(":- body(b2(anon(_), _)).").
#bias(":- body(b3(_, anon(_))).").
#bias(":- body(b3(anon(_), _)).").
#bias(":- body(b4(_, anon(_))).").
#bias(":- body(b4(anon(_), _)).").

#bias(":- body(binary(_, _, anon(_))).").
#bias(":- body(binary(_, anon(_), _)).").
#bias(":- body(binary(anon(_), _, _)).").
% #bias(":- body(total_piles(anon(_), _)).").
% #bias(":- body(total_piles(_, anon(_))).").
