
#pos(e0,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(2,3))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(1,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(3,2))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(2,1))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(1,3))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#pos(e7,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,1))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). does(a,mark(cell(2,1))). 
}).
#brave_ordering(e6,e7).