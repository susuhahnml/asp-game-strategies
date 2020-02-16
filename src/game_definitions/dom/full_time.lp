#program base.
#const size = 3.
role(a).
role(b).
stack(l).
stack(r).
eye((0..size)).
domino(N1,N2) :- eye(N1); eye(N2); N1<=N2.
input(P,plays(domino(N1,N2),S)) :- domino(N1,N2); stack(S); role(P).
input(P,pass) :- role(P).
base(in_hand(X,domino(N1,N2))) :- domino(N1,N2); role(X).
base(stack(S,(0..size))) :- stack(S).
base(control(X)) :- role(X).
legal(X,plays(domino(N1,N2),S),T) :- holds(in_hand(X,domino(N1,N2)),T); holds(stack(S,N2),T); holds(control(X),T); not terminal(T); time(T).
legal(X,plays(domino(N1,N2),S),T) :- holds(in_hand(X,domino(N1,N2)),T); holds(stack(S,N1),T); holds(control(X),T); not terminal(T); time(T).
legal(X,pass,T) :- not legal(X,plays(_,_),T); role(X); holds(control(X),T); not terminal(T); time(T).
1 = { does(X,M,T) : legal(X,M,T) } :- holds(control(X),T); not terminal(T); time(T).
holds(stack(S,N2),(T+1)) :- does(X,plays(domino(N1,N2),S),T); holds(stack(S,N1),T); not terminal(T); time(T).
holds(stack(S,N1),(T+1)) :- does(X,plays(domino(N1,N2),S),T); holds(stack(S,N2),T); not terminal(T); time(T).
holds(stack(S,N),(T+1)) :- does(X,pass,T); holds(stack(S,N),T); not terminal(T); time(T).
holds(stack(S1,N),(T+1)) :- does(X,plays(domino(N1,N2),S2),T); S1!=S2; holds(stack(S1,N),T); not terminal(T); time(T).
holds(control(b),(T+1)) :- holds(control(a),T); not terminal(T); time(T).
holds(control(a),(T+1)) :- holds(control(b),T); not terminal(T); time(T).
holds(in_hand(X,D),(T+1)) :- not does(X,plays(D,_),T); holds(in_hand(X,D),T); not terminal(T); time(T).
goal(X,G,T) :- holds(control(Y),T); 0 = #count { 1,D' : holds(in_hand(X,D'),T) }; G = #sum { (N1+N2),N1,N2 : holds(in_hand(Y,domino(N1,N2)),T) }; role(X); X!=Y; time(T).
goal(X,G2,T) :- role(X); role(Y); holds(control(Z),T); 0 = #count { P,N1,N2 : holds(in_hand(P,domino(N1,N2)),T), holds(stack(S,N2),T), role(P) }; 0 = #count { P,N1,N2 : holds(in_hand(P,domino(N1,N2)),T), holds(stack(S,N1),T), role(P) }; G1 = #sum { (N1+N2),N1,N2 : holds(in_hand(X,domino(N1,N2)),T) }; G2 = #sum { (N1+N2),N1,N2 : holds(in_hand(Y,domino(N1,N2)),T) }; G1<G2; time(T).
goal(X,(-1*G),T) :- goal(Y,G,T); role(X); X!=Y; time(T).
terminal(T) :- goal(_,_,T); time(T).
time((0..15)).