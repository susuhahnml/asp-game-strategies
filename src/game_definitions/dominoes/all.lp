% generate all dominoes
#const size=3.
eye(0..size).
domino(N1,N2) :- eye(N1), eye(N2), N1<=N2.
stack(l). stack(r).
role(a). role(b).


% check all moves
does(plays(domino(N1,N2), S)) :- domino(N1,N2), stack(S).
does(pass).
true(in_hand(X,domino(N1,N2))) :- domino(N1,N2), role(X).
true(stack(S,0..size)):- stack(S).
true(control(X)) :- role(X).

#show true/1.
#show does/1.