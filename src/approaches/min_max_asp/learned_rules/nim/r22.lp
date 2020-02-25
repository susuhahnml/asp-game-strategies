best_do(Vb,remove(V3,2),T):-holds(control(Vb),T),holds(has(V3,2),T),holds(has(V1,0),T),holds(has(V2,0),T),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Va,remove(V3,1),T):-holds(control(Va),T),holds(has(V2,1),T),holds(has(V3,2),T),holds(has(V1,0),T),Va!=V1,Va!=V2,Va!=V3,V1!=V2,V1!=V3,V2!=V3.
best_do(Va,remove(V3,1),T):-holds(control(Va),T),holds(has(V2,1),T),holds(has(V3,2),T),holds(has(V1,0),T),Va!=V1,Va!=V2,Va!=V3,V1!=V2,V1!=V3,V2!=V3.
best_do(Vb,remove(V3,2),T):-holds(control(Vb),T),holds(has(V3,2),T),holds(has(V1,1),T),holds(has(V2,1),T),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Vb,remove(V3,2),T):-holds(control(Vb),T),holds(has(V3,2),T),holds(has(V1,1),T),holds(has(V2,1),T),V1!=Vb,V1!=V2,V1!=V3,Vb!=V2,Vb!=V3,V2!=V3.
best_do(Va,remove(V1,1),T):-holds(has(V1,1),T),holds(has(V2,2),T),holds(has(V3,2),T),holds(control(Va),T),V1!=Va,V1!=V2,V1!=V3,Va!=V2,Va!=V3,V2!=V3.
best_do(Va,remove(V1,1),T):-holds(has(V1,1),T),holds(has(V2,2),T),holds(has(V3,2),T),holds(control(Va),T),V1!=Va,V1!=V2,V1!=V3,Va!=V2,Va!=V3,V2!=V3.