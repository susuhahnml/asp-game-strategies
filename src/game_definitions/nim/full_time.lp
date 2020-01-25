%Configuration
#const remove_limit=3.
#const tree_depth=10.

removable(1..remove_limit).
time(0..tree_depth).
role(a).
role(b).

% Action selection

legal(X,remove(P,N),T) :- holds(has(P,M),T), removable(N), N<=M, P = #min{L:holds(has(L,M),T)}, holds(control(X),T), time(T), not holds(goal(_,_),T).


% legal(P,M,T):- P = #min{L:holds(has(L,M),T)},holds(has(P,M),T),removable(N),N<=M.

{does(X,A,T):legal(X,A,T)}=1 :- holds(control(X),T), time(T), not holds(goal(_,_),T).


% State transition
holds(control(b),T+1) :- holds(control(a),T), time(T), not holds(goal(_,_),T).
holds(control(a),T+1) :- holds(control(b),T), time(T), not holds(goal(_,_),T).
holds(has(P,N-M),T+1) :- does(_,remove(P,M),T), holds(has(P,N),T), time(T).
holds(has(P,N),T+1) :- not does(_,remove(P,_),T), holds(has(P,N),T), time(T), not holds(goal(_,_),T).

holds(goal(X,1),T+1):- #sum{M,P:holds(has(P,M),T+1)}=0, 
                    holds(control(X),T+1), 
                    time(T), 
                    not holds(goal(_,_),T).
holds(goal(Y,-1*G),T):- holds(goal(X,G),T), role(Y), Y!=X.


% holds(has(1,1),0).
% holds(has(2,1),0).
% holds(has(3,1),0).
% holds(control(a),0).

% #show does/3.