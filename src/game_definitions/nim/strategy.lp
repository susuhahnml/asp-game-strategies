bin(0,0,0,0)
bin(1,0,0,1)
bin(2,0,1,0)
bin(3,0,1,1)
bin(4,1,0,0)
bin(5,1,0,1)
bin(6,1,1,0)
bin(7,1,1,1)

totals(B14+B24+B34,B12+B22+B32,B11+B21+B31) :- next(has(P1,N1)), bin(N1,B14,B12,B11), next(has(P2,N2)), bin(N2,B24,B22,B21), next(has(P3,N3)), bin(N3,B34,B32,B31),P1!=P2,P2!=P3,P3!=P1.
:~totals(T4,T2,T1),T4\2!=0.[1@1]
:~totals(T4,T2,T1),T2\2!=0.[1@1]
:~totals(T4,T2,T1),T1\2!=0.[1@1]
:~ #sum{N,P:next(has(P,N))}==1.[-1@2]
