
#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(player,a).
#constant(player,b).
#modeo(3,next(has(var(pile),const(amount))),(positive)).
#modeo(3,var(pile)!=var(pile),(symmetric,anti_reflexive)).
#weight(-1).
#weight(1).
#weight(2).
#maxp(3).
