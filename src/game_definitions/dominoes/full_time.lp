time(0..40).
#const size=3.

% generate two players
role(a). role(b).
stack(l). stack(r).

% generate all dominoes
eye(0..size).
domino(N1,N2) :- eye(N1), eye(N2), N1<=N2.

% check possible moves
legal(X, plays(domino(N1,N2), S),T) :- holds(in_hand(X, domino(N1,N2)),T), holds(stack(S,N2),T), time(T).

legal(X, plays(domino(N1,N2), S),T) :- holds(in_hand(X, domino(N1,N2)),T), holds(stack(S,N1),T), time(T).

legal(X, pass, T) :- not legal(X, plays(_,_),T), role(X), time(T).

% choose move M
{does(X,M,T) : legal(X,M,T)} = 1 :- holds(control(X),T), not holds(terminal,T), time(T), not holds(terminal,T).

% define transition
holds(stack(S,N2),T+1) :- does(X,plays(domino(N1,N2), S),T), holds(stack(S,N1),T).
holds(stack(S,N1),T+1) :- does(X,plays(domino(N1,N2), S),T), holds(stack(S,N2),T).
holds(stack(S,N),T+1) :- does(X,pass,T), holds(stack(S,N),T).
holds(stack(S1,N),T+1) :- does(X,plays(domino(N1,N2), S2),T), S1!=S2, holds(stack(S1,N),T).
holds(control(X2),T+1) :- holds(control(X1),T), role(X2), X2!=X1, time(T), not holds(terminal,T).
holds(in_hand(X,D),T+1) :- not does(X,plays(D, _),T), holds(in_hand(X,D),T), time(T), not holds(terminal,T).

% define terminal state
% finished tiles
holds(goal(X,G),T) :- {holds(in_hand(X,D),T)} = 0, 
                      G=#sum{N1+N2,N1,N2 : holds(in_hand(Y, domino(N1,N2)),T)}, 
                      role(Y), 
                      X!=Y, 
                      role(X),
                      time(T), not holds(terminal,T-1), holds(control(P),T).
% closed game
holds(goal(X,G2),T) :- legal(X, pass,T), 
                       legal(Y, pass,T), 
                       X!=Y, 
                       G1=#sum{N1+N2,N1,N2 : holds(in_hand(X, domino(N1,N2)),T)}, 
                       G2=#sum{N1+N2,N1,N2 : holds(in_hand(Y, domino(N1,N2)),T)}, 
                       G1<G2,
                       time(T), not holds(terminal,T-1),holds(control(P),T).

holds(goal(X,-1*G),T) :- holds(goal(Y,G),T), role(X), X!=Y.
holds(terminal,T) :- holds(goal(_,_),T).


% #show does/3.
% #show holds/2.
