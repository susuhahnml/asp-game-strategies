best_do(Vb,remove(V3,2)):-true(control(Vb)),true(has(V3,2)),true(has(V1,0)),true(has(V2,0)),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Va,remove(V3,1)):-true(control(Va)),true(has(V2,1)),true(has(V3,2)),true(has(V1,0)),Va!=V1,Va!=V2,Va!=V3,V1!=V2,V1!=V3,V2!=V3.
best_do(Va,remove(V3,1)):-true(control(Va)),true(has(V2,1)),true(has(V3,2)),true(has(V1,0)),Va!=V1,Va!=V2,Va!=V3,V1!=V2,V1!=V3,V2!=V3.
best_do(Vb,remove(V3,2)):-true(control(Vb)),true(has(V3,2)),true(has(V1,1)),true(has(V2,1)),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Vb,remove(V3,2)):-true(control(Vb)),true(has(V3,2)),true(has(V1,1)),true(has(V2,1)),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Va,remove(V1,1)):-true(has(V1,1)),true(has(V2,2)),true(has(V3,2)),true(control(Va)),V1!=Va,V1!=V2,V1!=V3,Va!=V2,Va!=V3,V2!=V3.
best_do(Va,remove(V1,1)):-true(has(V1,1)),true(has(V2,2)),true(has(V3,2)),true(control(Va)),V1!=Va,V1!=V2,V1!=V3,Va!=V2,Va!=V3,V2!=V3.