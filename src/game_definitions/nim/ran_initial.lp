% Removable configuration
#const n = 3.
#const m_s = 7.
#const max_sum = 14.
#const min_sum = 4.
#const p_n = 3.

1{true(has(P,M)):M=0..m_s}1:-P=1..p_n.
:- #sum{M,P:true(has(P,M))}=S, S>max_sum.
:- #sum{M,P:true(has(P,M))}=S, S<min_sum.
true(control(a)).
#show true/1.
% #show domino/2.

