#program base.
#const win_conf = 2.
#const grid_size = 2.
role(a).
role(b).
base(has(P,X,Y)) :- role(P); X=(1..grid_size); Y=(1..grid_size).
base(free(X,Y)) :- X=(1..grid_size); Y=(1..grid_size).
base(control(X)) :- role(X).
input(P,mark(X,Y)) :- X=(1..grid_size); Y=(1..grid_size); role(P).
legal(P,mark(X,Y),T) :- holds(control(P),T); holds(free(X,Y),T); not terminal(T); time(T).
0 <= { does(X,A,T) :  } <= 1 :- legal(X,A,T); not terminal(T); time(T).
#false :- does(X,Y,T); does(X,Z,T); Y<Z; time(T).
#false :- not does(X,_,T); holds(control(X),T); not terminal(T); time(T).
holds(control(b),(T+1)) :- holds(control(a),T); not terminal(T); time(T).
holds(control(a),(T+1)) :- holds(control(b),T); not terminal(T); time(T).
holds(has(P,X,Y),(T+1)) :- does(P,mark(X,Y),T); not terminal(T); time(T).
holds(has(P,X,Y),(T+1)) :- holds(has(P,X,Y),T); role(P); not terminal(T); time(T).
holds(free(X,Y),(T+1)) :- holds(free(X,Y),T); not does(_,mark(X,Y),T); not terminal(T); time(T).
goal(P,1,T) :- win_conf = #count { P,(X+M),Y : holds(has(P,(X+M),Y),T), M=(0..(win_conf-1)) }; holds(has(P,X,Y),T); role(P); time(T).
goal(P,1,T) :- win_conf = #count { P,X,(Y+M) : holds(has(P,X,(Y+M)),T), M=(0..(win_conf-1)) }; holds(has(P,X,Y),T); role(P); time(T).
goal(P,1,T) :- win_conf = #count { P,(X+M),(Y-M) : holds(has(P,(X+M),(Y-M)),T), M=(0..(win_conf-1)) }; holds(has(P,X,Y),T); role(P); time(T).
goal(P,1,T) :- win_conf = #count { P,(X+M),(Y+M) : holds(has(P,(X+M),(Y+M)),T), M=(0..(win_conf-1)) }; holds(has(P,X,Y),T); role(P); time(T).
goal(P,0,T) :- holds(control(P),T); not goal(P,1,T); not goal(P,-1,T); 0 = #count { X,Y : holds(free(X,Y),T) }; time(T).
goal(P,(-1*G),T) :- goal(P',G,T); role(P); P!=P'; time(T).
terminal(T) :- goal(_,_,T); time(T).
time((0..15)).