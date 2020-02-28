
#pos(e0,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(free(cell(1,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e7,{}, {}, {
 true(free(cell(1,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e9,{}, {}, {
 true(free(cell(3,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(2,2))). 
}).
#pos(e11,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(a,cell(1,2))). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(1,3))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,3))). does(a,mark(cell(2,3))). 
}).
#pos(e13,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e15,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). does(a,mark(cell(2,3))). 
}).
#pos(e17,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e19,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e21,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). does(a,mark(cell(1,1))). 
}).
#pos(e23,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e25,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(b,cell(2,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,1))). 
}).
#pos(e27,{}, {}, {
 true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e29,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). does(a,mark(cell(1,1))). 
}).
#pos(e31,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(1,1))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e33,{}, {}, {
 true(free(cell(3,2))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(2,1))). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(2,2))). 
}).
#pos(e35,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(b,cell(1,2))). true(has(a,cell(1,3))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e34,e35).