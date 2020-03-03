piles(1,2,3,4).
#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(amount,3).
#constant(amount,4).
#constant(amount,5).
#constant(amount,6).
#constant(amount,7).
#modeb(4,next(has(var(pile),var(amount))),(positive)).
#modeb(1,piles(var(pile),var(pile),var(pile),var(pile)),(positive)).
#modeh(values(var(amount),var(amount),var(amount),var(amount))).
#modeo(1,values(const(amount),const(amount),const(amount),const(amount)),(positive)).

% #bias(":- body(next(has(P,_))),body(next(has(P,_))).").
#bias(":- body(piles(X,X,_,_)).").
#bias(":- body(piles(_,X,X,_)).").
#bias(":- body(piles(_,_,X,X)).").
#bias(":- body(piles(_,X,_,X)).").
#bias(":- body(piles(X,_,_,X)).").
#bias(":- body(piles(_,X,X,_)).").

#weight(-1).
#weight(1).
#weight(2).
#maxp(3).
#maxv(8).