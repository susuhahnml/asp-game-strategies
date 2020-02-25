best_do(Va,remove(V2,2),T):-holds(control(Va),T),holds(has(V2,2),T),holds(has(V1,0),T),holds(has(V3,0),T),V2!=V1,V2!=Va,V2!=V3,V1!=Va,V1!=V3,Va!=V3.
best_do(Vb,remove(V2,1),T):-holds(control(Vb),T),holds(has(V3,1),T),holds(has(V2,2),T),holds(has(V1,0),T),Vb!=V2,Vb!=V1,Vb!=V3,V2!=V1,V2!=V3,V1!=V3.
best_do(Vb,remove(V2,1),T):-holds(control(Vb),T),holds(has(V3,1),T),holds(has(V2,2),T),holds(has(V1,0),T),Vb!=V2,Vb!=V1,Vb!=V3,V2!=V1,V2!=V3,V1!=V3.
best_do(Va,remove(V2,2),T):-holds(has(V1,1),T),holds(has(V2,2),T),holds(has(V3,1),T),holds(control(Va),T),V2!=Va,V2!=V1,V2!=V3,Va!=V1,Va!=V3,V1!=V3.
best_do(Va,remove(V2,2),T):-holds(has(V1,1),T),holds(has(V2,2),T),holds(has(V3,1),T),holds(control(Va),T),V2!=Va,V2!=V1,V2!=V3,Va!=V1,Va!=V3,V1!=V3.