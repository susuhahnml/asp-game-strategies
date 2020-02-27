#program base.
#const max_removable = 6.
#const max_sticks = 7.
#const num_piles = 4.
role(a).
role(b).
base(has(P,M)) :- P=(1..num_piles); M=(0..max_sticks).
base(control(X)) :- role(X).
input(X,remove(P,N)) :- P=(1..num_piles); N=(1..max_removable); role(X).
legal(X,remove(P,N),T) :- holds(has(P,M),T); P = #min { L : holds(has(L,M),T) }; N=(1..max_removable); N<=M; holds(control(X),T); not terminal(T); time(T).
0 <= { does(X,A,T) :  } <= 1 :- legal(X,A,T); not terminal(T); time(T).
#false :- does(X,Y,T); does(X,Z,T); Y<Z; time(T).
#false :- not does(X,_,T); holds(control(X),T); not terminal(T); time(T).
holds(control(b),(T+1)) :- holds(control(a),T); not terminal(T); time(T).
holds(control(a),(T+1)) :- holds(control(b),T); not terminal(T); time(T).
holds(has(P,(N-M)),(T+1)) :- does(_,remove(P,M),T); holds(has(P,N),T); not terminal(T); time(T).
holds(has(P,N),(T+1)) :- not does(_,remove(P,_),T); holds(has(P,N),T); not terminal(T); time(T).
goal(X,-1,T) :- 0 = #sum { N,M : holds(has(M,N),T) }; holds(control(X),T); time(T).
goal(X,(-1*G),T) :- goal(Y,G,T); role(X); X!=Y; time(T).
terminal(T) :- goal(_,_,T); time(T).
time((0..20)).