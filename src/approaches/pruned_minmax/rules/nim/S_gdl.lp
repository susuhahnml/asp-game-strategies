{does(P,A):best_do(P,A),legal(P,A)}=1:-not terminal,{best_do(P,A)}>0,true(control(P)).
best_do(Vb,remove(V3,2)):-true(control(Vb)),true(has(V4,0)),true(has(V3,3)),true(has(V1,0)),true(has(V2,1)),V4!=V1,V4!=Vb,V4!=V3,V4!=V2,V1!=Vb,V1!=V3,V1!=V2,Vb!=V3,Vb!=V2,V3!=V2.
best_do(Va,remove(V3,3)):-true(control(Va)),true(has(V3,3)),true(has(V4,0)),true(has(V1,1)),true(has(V2,1)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Vb,remove(V2,2)):-true(control(Vb)),true(has(V3,0)),true(has(V4,0)),true(has(V2,2)),true(has(V1,0)),V4!=V1,V4!=Vb,V4!=V3,V4!=V2,V1!=Vb,V1!=V3,V1!=V2,Vb!=V3,Vb!=V2,V3!=V2.
best_do(Va,remove(V2,1)):-true(control(Va)),true(has(V1,1)),true(has(V2,2)),true(has(V4,0)),true(has(V3,0)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Va,remove(V2,1)):-true(control(Va)),true(has(V1,1)),true(has(V2,2)),true(has(V4,0)),true(has(V3,0)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Vb,remove(V3,2)):-true(control(Vb)),true(has(V4,0)),true(has(V1,1)),true(has(V2,1)),true(has(V3,2)),V4!=V1,V4!=Vb,V4!=V3,V4!=V2,V1!=Vb,V1!=V3,V1!=V2,Vb!=V3,Vb!=V2,V3!=V2.
best_do(Va,remove(V1,1)):-true(control(Va)),true(has(V1,1)),true(has(V2,2)),true(has(V4,0)),true(has(V3,2)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Va,remove(V1,1)):-true(control(Va)),true(has(V1,1)),true(has(V2,2)),true(has(V4,0)),true(has(V3,2)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Vb,remove(V3,3)):-true(control(Vb)),true(has(V4,0)),true(has(V3,3)),true(has(V1,0)),true(has(V2,0)),V4!=V1,V4!=Vb,V4!=V3,V4!=V2,V1!=Vb,V1!=V3,V1!=V2,Vb!=V3,Vb!=V2,V3!=V2.
best_do(Va,remove(V3,1)):-true(control(Va)),true(has(V2,2)),true(has(V3,3)),true(has(V4,0)),true(has(V1,0)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.
best_do(Va,remove(V3,1)):-true(control(Va)),true(has(V2,2)),true(has(V3,3)),true(has(V4,0)),true(has(V1,0)),Va!=V4,Va!=V1,Va!=V3,Va!=V2,V4!=V1,V4!=V3,V4!=V2,V1!=V3,V1!=V2,V3!=V2.