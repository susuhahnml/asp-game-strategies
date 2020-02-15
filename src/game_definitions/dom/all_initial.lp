% generate all dominoes
#const size=3.

eye(0..size).
domino(N1,N2) :- eye(N1), eye(N2), N1<=N2.
stack(l). stack(r).
role(a). role(b).


% check all moves

{true(in_hand(P,domino(N1,N2))): role(P)}=1:- domino(N1,N2), N1+N2!=size*2.
:-#sum{1,D:true(in_hand(b,D))}!=((size+1)*(size+2)/4)-1.
true(stack(S,size)):- stack(S).
true(control(a)).

#show true/1.
% #show domino/2.