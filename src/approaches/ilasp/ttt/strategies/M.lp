:~ in_line(V0,V1,V2), next(free(V2)).[-1@1, 1, V0, V1, V2]
:~ next(has(V0,V1)), next(has(V0,V2)), next(has(V0,V3)), in_line(V1,V2,V3).[-1@2, 2, V0, V1, V2, V3]

% Expected hypothesis
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(has(P,V3)).[-1@1]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V2)), next(free(V3)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V1)), next(has(P,V3)), next(free(V2)), next(control(P)).[1@1]
% :~ in_line(V1,V2,V3), next(has(P,V3)), next(has(P,V2)), next(free(V1)), next(control(P)).[1@1]
