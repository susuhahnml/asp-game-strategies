binary(0,1,0).binary(0,2,0).binary(0,4,0).

binary(1,1,1).binary(1,2,0).binary(1,4,0).

binary(2,1,0).binary(2,2,1).binary(2,4,0).

binary(3,1,1).binary(3,2,1).binary(3,4,0).

binary(4,1,0).binary(4,2,0).binary(4,4,1).

binary(5,1,1).binary(5,2,0).binary(5,4,1).

binary(6,1,0).binary(6,2,1).binary(6,4,1).

binary(7,1,1).binary(7,2,1).binary(7,4,1).

next_val(V1,V2,V3,V4) :- next(has(P1,V1)),next(has(P2,V2)),next(has(P3,V3)),next(has(P4,V4)),piles(P1,P2,P3,P4).


#constant(amount,0).
#constant(amount,1).
#constant(amount,2).
#constant(amount,3).
#constant(amount,4).
#constant(amount,5).
#constant(amount,6).
#constant(amount,7).
#modeo(1,next_val(const(amount),const(amount),const(amount),const(amount)),(positive)).
#weight(-1).
#weight(1).
#maxp(1).
#max_penalty(40)
