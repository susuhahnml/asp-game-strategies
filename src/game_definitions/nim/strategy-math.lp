#show next/1.
#show totals/3.
#show does/2.

binary(0,0,0,0).
binary(1,0,0,1).
binary(2,0,1,0).
binary(3,0,1,1).
binary(4,1,0,0).
binary(5,1,0,1).
binary(6,1,1,0).
binary(7,1,1,1).

totals(B14+B24+B34,B12+B22+B32,B11+B21+B31) :- next(has(P1,N1)), binary(N1,B14,B12,B11), next(has(P2,N2)), binary(N2,B24,B22,B21), next(has(P3,N3)), binary(N3,B34,B32,B31),P1!=P2,P2!=P3,P3!=P1.
:~ totals(V0,V0,V1), V1\2 != 0.[-1@2, 1, V0, V1]
:~ totals(V0,V1,V2), V0\2 != 0.[1@2, 2, V0, V1, V2]
:~ totals(V0,V1,V2), V1\2 != 0.[1@1, 3, V0, V1, V2]
:~ totals(V0,V1,V2), V2\2 != 0.[1@1, 4, V0, V1, V2]
