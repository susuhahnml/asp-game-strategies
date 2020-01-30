% generate all dominoes
#const n = 3.
#const m_s = 7.
#const p_n = 3.


role(a). role(b).
% check all moves
does(remove(P,N)) :- P=1..p_n, N=1..n.
% check all fluents
true(has(P,M)):-P=1..p_n,M=0..m_s.
true(control(X)) :- role(X).

#show true/1.
#show does/1.

