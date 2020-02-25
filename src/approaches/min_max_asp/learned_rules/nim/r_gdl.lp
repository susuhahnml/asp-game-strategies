best_do(Va,remove(V2,2)):-true(control(Va)),true(has(V2,2)),true(has(V1,0)),true(has(V3,0)),Va!=V3,Va!=V1,Va!=V2,V3!=V1,V3!=V2,V1!=V2.
best_do(Vb,remove(V2,1)):-true(control(Vb)),true(has(V3,1)),true(has(V2,2)),true(has(V1,0)),V3!=Vb,V3!=V1,V3!=V2,Vb!=V1,Vb!=V2,V1!=V2.
best_do(Vb,remove(V2,1)):-true(control(Vb)),true(has(V3,1)),true(has(V2,2)),true(has(V1,0)),V3!=Vb,V3!=V1,V3!=V2,Vb!=V1,Vb!=V2,V1!=V2.
best_do(Va,remove(V2,2)):-true(has(V1,1)),true(has(V2,2)),true(has(V3,1)),true(control(Va)),Va!=V3,Va!=V1,Va!=V2,V3!=V1,V3!=V2,V1!=V2.
best_do(Va,remove(V2,2)):-true(has(V1,1)),true(has(V2,2)),true(has(V3,1)),true(control(Va)),Va!=V3,Va!=V1,Va!=V2,V3!=V1,V3!=V2,V1!=V2.