% generate two players
#const size=3.

role(a). role(b).
stack(l). stack(r).

% generate all dominoes
eye(0..size).
domino(N1,N2) :- eye(N1), eye(N2), N1<=N2.


% check all moves
input(P, plays(domino(N1,N2), S)) :- domino(N1,N2), stack(S), role(P).
input(P, pass):-role(P).
base(in_hand(X,domino(N1,N2))) :- domino(N1,N2), role(X).
base(stack(S,0..size)):- stack(S).
base(control(X)) :- role(X).


% check possible moves
legal(X, plays(domino(N1,N2), S)) :- true(in_hand(X, domino(N1,N2))), true(stack(S,N2)),true(control(X)), not terminal.

legal(X, plays(domino(N1,N2), S)) :- true(in_hand(X, domino(N1,N2))), true(stack(S,N1)),true(control(X)), not terminal.

legal(X, pass) :- not legal(X, plays(_,_)), role(X), true(control(X)), not terminal.

% choose move M
{does(X,M) : legal(X,M)} = 1 :- true(control(X)), not terminal.

% define transition
next(stack(S,N2)) :- does(X,plays(domino(N1,N2), S)), true(stack(S,N1)), not terminal.
next(stack(S,N1)) :- does(X,plays(domino(N1,N2), S)), true(stack(S,N2)), not terminal.
next(stack(S,N)) :- does(X,pass), true(stack(S,N)), not terminal.
next(stack(S1,N)) :- does(X,plays(domino(N1,N2), S2)), S1!=S2, true(stack(S1,N)), not terminal.
next(control(b)) :- true(control(a)), not terminal.
next(control(a)) :- true(control(b)), not terminal.
next(in_hand(X,D)) :- not does(X,plays(D, _)), true(in_hand(X,D)), not terminal.

% define terminal state
% finished tiles
goal(X,G) :- true(control(Y)),
             #count{1,D':true(in_hand(X,D'))} = 0, 
             G=#sum{N1+N2,N1,N2 : true(in_hand(Y, domino(N1,N2)))}, role(X), X!=Y.
% closed game
goal(X,G2) :- role(X), role(Y), true(control(Z)),
            #count{P,N1,N2:true(in_hand(P, domino(N1,N2))), true(stack(S,N2)),role(P)}=0,
            #count{P,N1,N2:true(in_hand(P, domino(N1,N2))), true(stack(S,N1)),role(P)}=0,
            G1=#sum{N1+N2,N1,N2 : true(in_hand(X, domino(N1,N2)))}, 
            G2=#sum{N1+N2,N1,N2 : true(in_hand(Y, domino(N1,N2)))}, 
            G1<G2.

goal(X,-1*G) :- goal(Y,G), role(X), X!=Y.
terminal :- goal(_,_).

% #show does/2.