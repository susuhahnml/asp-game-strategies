#program base.
#const win_conf = 3.
#const grid_size = 3.
role(a).
role(b).
cell(1,1).
cell(1,2).
cell(1,3).
cell(2,1).
cell(2,2).
cell(2,3).
cell(3,1).
cell(3,2).
cell(3,3).
dir(h).
dir(v).
dir(d1).
dir(d2).
in_line(h,cell(X,Y),cell(X,(Y+1))) :- cell(X,Y); cell(X,(Y+1)).
in_line(v,cell(X,Y),cell((X+1),Y)) :- cell(X,Y); cell((X+1),Y).
in_line(d1,cell(X,Y),cell((X+1),(Y+1))) :- cell(X,Y); cell((X+1),(Y+1)).
in_line(d2,cell(X,Y),cell((X+1),(Y-1))) :- cell(X,Y); cell((X+1),(Y-1)).
in_line(D,C1,C2) :- in_line(D,C2,C1).
base(has(P,cell(X,Y))) :- role(P); cell(X,Y).
base(free(cell(X,Y))) :- cell(X,Y).
base(control(X)) :- role(X).
input(P,mark(cell(X,Y))) :- cell(X,Y); role(P).
legal(P,mark(cell(X,Y)),T) :- holds(control(P),T); holds(free(cell(X,Y)),T); not terminal(T); time(T).
0 <= { does(X,A,T) :  } <= 1 :- legal(X,A,T); not terminal(T); time(T).
#false :- does(X,Y,T); does(X,Z,T); Y<Z; time(T).
#false :- not does(X,_,T); holds(control(X),T); not terminal(T); time(T).
holds(control(b),(T+1)) :- holds(control(a),T); not terminal(T); time(T).
holds(control(a),(T+1)) :- holds(control(b),T); not terminal(T); time(T).
holds(has(P,cell(X,Y)),(T+1)) :- does(P,mark(cell(X,Y)),T); not terminal(T); time(T).
holds(has(P,cell(X,Y)),(T+1)) :- holds(has(P,cell(X,Y)),T); role(P); not terminal(T); time(T).
holds(free(cell(X,Y)),(T+1)) :- holds(free(cell(X,Y)),T); not does(_,mark(cell(X,Y)),T); not terminal(T); time(T).
goal(P,1,T) :- holds(has(P,C1),T); holds(has(P,C2),T); holds(has(P,C3),T); C1!=C2; C2!=C3; C1!=C3; in_line(D,C1,C2); in_line(D,C2,C3); dir(D); time(T).
goal(P,0,T) :- holds(control(P),T); not goal(P,1,T); not goal(P,-1,T); not holds(free(cell(1,1)),T); not holds(free(cell(1,2)),T); not holds(free(cell(1,3)),T); not holds(free(cell(2,1)),T); not holds(free(cell(2,2)),T); not holds(free(cell(2,3)),T); not holds(free(cell(3,1)),T); not holds(free(cell(3,2)),T); not holds(free(cell(3,3)),T); time(T).
goal(P,(-1*G),T) :- goal(P',G,T); role(P); P!=P'; time(T).
terminal(T) :- goal(_,_,T); time(T).
time((0..15)).