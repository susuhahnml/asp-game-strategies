%Configuration
#const remove_limit=3.
#const tree_depth=15.

removable(1..remove_limit).
time(0..tree_depth).
role(a).
role(b).

% Initial state
% holds(has(1,2),0).
% holds(has(2,0),0).
% holds(has(3,0),0).
% holds(control(a),0).

% Action selection
{does(X,remove(P,N),T):holds(has(P,M),T),removable(N),N<=M}=1 :- holds(control(X),T),
                                                                 time(T), 
                                                                 not holds(goal(_,_),T).

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
% goal(N) :- holds(goal(a,N),_).

% #maximize {N,T:holds(goal(a,N),T)}.
% #maximize{N:goal(N)}.
#show does/3.
#show holds/2.
% #show goal/1.

% :-holds(control(a),T),holds(has(V2,2),T),holds(has(V3,0),T),holds(has(V1,0),T),V3!=V2,V3!=V1,V2!=V1, does(a,A,T), A!=remove(V2,1).