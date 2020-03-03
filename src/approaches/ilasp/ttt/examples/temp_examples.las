
#pos(e0,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#pos(e1,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,3))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,3))). 
}).
#pos(e3,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e5,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(1,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(free(cell(1,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,3))). 
}).
#pos(e7,{}, {}, {
 true(free(cell(1,3))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(3,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e9,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,2))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,2))). 
}).
#pos(e11,{}, {}, {
 true(free(cell(2,3))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(1,2))). true(has(b,cell(1,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e13,{}, {}, {
 true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(1,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(3,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e15,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(3,2))). true(has(b,cell(1,1))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,2))). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(2,2))). 
}).
#pos(e17,{}, {}, {
 true(free(cell(1,2))). true(free(cell(3,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(1,1))). does(b,mark(cell(3,2))). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e19,{}, {}, {
 true(free(cell(2,3))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,3))). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,3))). 
}).
#pos(e21,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,3))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#pos(e23,{}, {}, {
 true(free(cell(1,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,2))). true(has(a,cell(2,1))). true(has(b,cell(1,1))). true(has(b,cell(2,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(1,3))). 
}).
#pos(e25,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(2,3))). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,2))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#pos(e27,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,3))). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#pos(e29,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(control(a)). true(has(b,cell(1,1))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,3))). 
}).
#pos(e31,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,2))). true(free(cell(2,2))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,1))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). true(has(b,cell(2,3))). does(b,mark(cell(1,2))). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e33,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e35,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(1,1))). 
}).
#pos(e37,{}, {}, {
 true(free(cell(2,2))). true(free(cell(2,3))). true(free(cell(3,2))). true(free(cell(1,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). does(a,mark(cell(2,2))). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#pos(e39,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(1,3))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(3,2))). true(has(b,cell(1,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(2,2))). 
}).
#pos(e41,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,2))). true(has(b,cell(3,2))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e43,{}, {}, {
 true(free(cell(1,3))). true(free(cell(2,2))). true(free(cell(3,2))). true(control(a)). true(has(b,cell(1,1))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e45,{}, {}, {
 true(free(cell(1,1))). true(free(cell(1,3))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(2,2))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,3))). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e47,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,3))). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(1,1))). 
}).
#pos(e49,{}, {}, {
 true(free(cell(1,3))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(2,2))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(1,1))). 
}).
#pos(e51,{}, {}, {
 true(free(cell(1,1))). true(free(cell(2,2))). true(control(b)). true(has(a,cell(3,2))). true(has(a,cell(2,3))). true(has(a,cell(2,1))). true(has(b,cell(1,2))). true(has(b,cell(1,3))). true(has(b,cell(3,3))). true(has(a,cell(3,1))). does(b,mark(cell(2,2))). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(2,2))). 
}).
#pos(e53,{}, {}, {
 true(free(cell(2,2))). true(free(cell(3,2))). true(free(cell(1,1))). true(control(a)). true(has(b,cell(1,3))). true(has(b,cell(1,2))). true(has(a,cell(3,1))). true(has(b,cell(3,3))). true(has(a,cell(2,1))). true(has(a,cell(2,3))). does(a,mark(cell(3,2))). 
}).
#brave_ordering(e52,e53).