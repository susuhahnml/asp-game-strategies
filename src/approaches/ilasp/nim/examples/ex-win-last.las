
#pos(e0,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). does(b,remove(2,2)). 
}).
#pos(e1,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,2)). 
}).
#pos(e3,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e5,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#pos(e7,{}, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e9,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,2)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,1)). 
}).
#pos(e13,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,1)). 
}).
#pos(e15,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). does(a,remove(2,2)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(3,1)). 
}).
#pos(e17,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(1,2)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(3,1)). 
}).
#pos(e19,{}, {}, {
 true(has(1,2)). true(has(2,2)). true(has(3,1)). true(control(a)). does(a,remove(1,1)). 
}).
#brave_ordering(e18,e19).