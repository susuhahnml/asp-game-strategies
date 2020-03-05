nim_sum(V1,0,0) :- b(_,V1,_).
nim_sum(V1,V3+V2,V0) :- b(V0,V1,V2), nim_sum(V1,V3,V0-1).
b(V3,V1,V2) :- binary(V0,V1,V2), next(has(V3,V0)).
:~ nim_sum(V0,V1,3), V1\2 != 0.[1@1, 4, V0, V1]

% Define predicates to learn real strategy
binary(0,1,0).binary(0,2,0).binary(0,4,0).

binary(1,1,1).binary(1,2,0).binary(1,4,0).

binary(2,1,0).binary(2,2,1).binary(2,4,0).

binary(3,1,1).binary(3,2,1).binary(3,4,0).

binary(4,1,0).binary(4,2,0).binary(4,4,1).

binary(5,1,1).binary(5,2,0).binary(5,4,1).

binary(6,1,0).binary(6,2,1).binary(6,4,1).

binary(7,1,1).binary(7,2,1).binary(7,4,1).

% num(0..6).
% odd(X) :- num(X), X\2 != 0.

%%% Expected Hypothesis
% nim_sum(V1,0,0) :- b(_,V1,_).
% b(V3,V1,V2) :- binary(V0,V1,V2), next(has(V3,V0)).
% nim_sum(V0,V1+V3,V2) :- nim_sum(V0,V1,V2-1), b(V2,V0,V3).
% :~ nim_sum(V0,V1,4), odd(V1).[1@1, 4, V0, V1]

%%% Expected Hypothesis reduced without lines 63 and 64 and with 5 variables
% nim_sum(V1,0,0) :- binary(_,V1,_).
% nim_sum(V0,V1+V4,V2) :- nim_sum(V0,V1,V2-1), binary(V3,V0,V4), next(has(V2,V3)).
% :~ nim_sum(V0,V1,4), odd(V1).[1@1, 4, V0, V1]

%------------------------------  Language bias

% #modeo(1,odd(var(t))).

