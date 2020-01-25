% generate two players
role(a). role(b).
stack(l). stack(r).

% generate all dominoes
eye(0..4).
domino(N1,N2) :- eye(N1), eye(N2), N1<=N2.

% check possible moves
legal(X, plays(domino(N1,N2), S)) :- true(in_hand(X, domino(N1,N2))), true(stack(S,N2)).

legal(X, plays(domino(N1,N2), S)) :- true(in_hand(X, domino(N1,N2))), true(stack(S,N1)).

legal(X, pass) :- not legal(X, plays(_,_)), role(X).

% choose move M
{does(X,M) : legal(X,M)} = 1 :- true(control(X)), not terminal.

% define transition
next(stack(S,N2)) :- does(X,plays(domino(N1,N2), S)), true(stack(S,N1)).
next(stack(S,N1)) :- does(X,plays(domino(N1,N2), S)), true(stack(S,N2)).
next(stack(S,N)) :- does(X,pass), true(stack(S,N)).
next(stack(S1,N)) :- does(X,plays(domino(N1,N2), S2)), S1!=S2, true(stack(S1,N)).
next(control(X)) :- not true(control(X)), role(X).
next(in_hand(X,D)) :- not does(X,plays(D, _)), true(in_hand(X,D)).

% define terminal state
% finished tiles
goal(X,G) :- {true(in_hand(X,D))} = 0, G=#sum{N1+N2,N1,N2 : true(in_hand(Y, domino(N1,N2)))}, role(Y), X!=Y, role(X).
% closed game
goal(X,G2) :- legal(X, pass), legal(Y, pass), X!=Y, G1=#sum{N1+N2,N1,N2 : true(in_hand(X, domino(N1,N2)))}, G2=#sum{N1+N2,N1,N2 : true(in_hand(Y, domino(N1,N2)))}, G1<G2.

goal(X,-1*G) :- goal(Y,G), role(X), X!=Y.
terminal :- goal(_,_).