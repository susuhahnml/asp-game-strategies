0 {a, b, c, d, e, f, g, h, i, j, k, l} 1.

#pos(p1, {a}, {}).
#pos(p2, {b}, {}).
#pos(p3, {c}, {}).
#pos(p4, {d}, {}).
#pos(p5, {e}, {}).
#pos(p6, {f}, {}).
#pos(p7, {g}, {}).
#pos(p8, {h}, {}).
#pos(p9, {i}, {}).
#pos(p10, {j}, {}).
#pos(p11, {k}, {}).
#pos(p12, {l}, {}).
#brave_ordering(p1,p2).
#brave_ordering(p2,p3).
#brave_ordering(p3,p4).
#brave_ordering(p4,p5).
#brave_ordering(p5,p6).
#brave_ordering(p6,p7).

#constant(let,a).
#constant(let,b).
#constant(let,c).
#constant(let,d).
#constant(let,e).
#constant(let,f).
#constant(let,g).
#constant(let,h).
#constant(let,i).
#constant(let,j).
#constant(let,k).
#constant(let,l).


#modeo(1,const(let),(positive)).
#weight(1).
#weight(2).
#weight(3).
#weight(4).
#weight(5).
#weight(6).
#maxp(9).