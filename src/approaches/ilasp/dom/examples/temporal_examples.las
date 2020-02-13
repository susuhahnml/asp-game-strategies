
#pos(e0,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(0,2),r)). 
}).
#pos(e1,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(2,2),r)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(2,3),r)). 
}).
#pos(e3,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(1,1),l)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(0,2),l)). 
}).
#pos(e5,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(2,2),l)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(2,3),l)). 
}).
#pos(e7,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(1,1),r)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),r)). 
}).
#pos(e9,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(1,1),r)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),r)). 
}).
#pos(e11,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),l)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,0)). does(a,plays(domino(1,3),r)). 
}).
#pos(e13,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,0)). does(a,plays(domino(0,2),l)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,1)). does(b,plays(domino(0,1),r)). 
}).
#pos(e15,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,1)). does(b,plays(domino(1,1),r)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,1)). does(b,plays(domino(0,1),r)). 
}).
#pos(e17,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,1)). does(b,plays(domino(0,1),l)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(1,3),l)). 
}).
#pos(e19,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,1)). does(a,plays(domino(1,3),r)). 
}).
#pos(e21,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,1)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(0,2),r)). 
}).
#pos(e23,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(0,2),l)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(0,2),r)). 
}).
#pos(e25,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(stack(l,1)). true(stack(r,0)). does(a,plays(domino(1,3),l)). 
}).
#pos(e27,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(stack(l,1)). true(stack(r,0)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,1)). true(stack(r,0)). does(a,plays(domino(1,3),l)). 
}).
#pos(e29,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,1)). true(stack(r,0)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,1)). does(a,plays(domino(0,2),r)). 
}).
#pos(e31,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,1)). does(a,plays(domino(1,3),l)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,1)). does(a,plays(domino(0,2),r)). 
}).
#pos(e33,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(r,2)). true(stack(l,1)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,2)). does(a,plays(domino(2,2),r)). 
}).
#pos(e35,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,2)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,2)). does(a,plays(domino(2,2),r)). 
}).
#pos(e37,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,2)). does(a,plays(domino(0,2),l)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,1)). does(a,plays(domino(1,3),l)). 
}).
#pos(e39,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,1)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,3)). true(stack(l,0)). does(b,plays(domino(0,1),l)). 
}).
#pos(e41,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,3)). true(stack(l,0)). does(b,plays(domino(2,3),r)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(0,2),l)). 
}).
#pos(e43,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(2,2),l)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(2,3),l)). 
}).
#pos(e45,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(1,1),r)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(0,2),r)). 
}).
#pos(e47,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(2,2),r)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(2,3),r)). 
}).
#pos(e49,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(1,1),l)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),l)). 
}).
#pos(e51,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(1,1),l)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),l)). 
}).
#pos(e53,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),r)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,0)). does(a,plays(domino(1,3),l)). 
}).
#pos(e55,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,0)). does(a,plays(domino(0,2),r)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(1,3),l)). 
}).
#pos(e57,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(0,2),r)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),l)). 
}).
#pos(e59,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),r)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),l)). 
}).
#pos(e61,{}, {}, {
 true(control(b)). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(1,1),l)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,1)). does(a,plays(domino(1,3),r)). 
}).
#pos(e63,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(l,0)). true(stack(r,1)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(1,3),l)). 
}).
#pos(e65,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,1)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(0,2),l)). 
}).
#pos(e67,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(0,2),r)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(0,2),l)). 
}).
#pos(e69,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(stack(r,1)). true(stack(l,0)). does(a,plays(domino(1,3),r)). 
}).
#pos(e71,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(stack(r,1)). true(stack(l,0)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,1)). true(stack(l,0)). does(a,plays(domino(1,3),r)). 
}).
#pos(e73,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(1,1))). true(stack(r,1)). true(stack(l,0)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e72,e73).

#pos(e74,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,1)). does(a,plays(domino(0,2),l)). 
}).
#pos(e75,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,1)). does(a,plays(domino(1,3),r)). 
}).
#brave_ordering(e74,e75).

#pos(e76,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,1)). does(a,plays(domino(0,2),l)). 
}).
#pos(e77,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(stack(l,2)). true(stack(r,1)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e76,e77).

#pos(e78,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,2)). does(a,plays(domino(2,2),l)). 
}).
#pos(e79,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,2)). does(a,plays(domino(1,2),l)). 
}).
#brave_ordering(e78,e79).

#pos(e80,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,2)). does(a,plays(domino(2,2),l)). 
}).
#pos(e81,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(1,1))). true(stack(r,0)). true(stack(l,2)). does(a,plays(domino(0,2),r)). 
}).
#brave_ordering(e80,e81).

#pos(e82,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,1)). does(a,plays(domino(1,3),r)). 
}).
#pos(e83,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,1)). does(a,plays(domino(1,2),r)). 
}).
#brave_ordering(e82,e83).

#pos(e84,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(l,3)). true(stack(r,0)). does(b,plays(domino(0,1),r)). 
}).
#pos(e85,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(1,3))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(l,3)). true(stack(r,0)). does(b,plays(domino(2,3),l)). 
}).
#brave_ordering(e84,e85).

#pos(e86,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(0,2),r)). 
}).
#pos(e87,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,1)). true(stack(r,2)). does(a,plays(domino(2,2),r)). 
}).
#brave_ordering(e86,e87).

#pos(e88,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,2)). does(b,plays(domino(2,3),r)). 
}).
#pos(e89,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(l,0)). true(stack(r,2)). does(b,plays(domino(0,1),l)). 
}).
#brave_ordering(e88,e89).

#pos(e90,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(1,2),l)). 
}).
#pos(e91,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(l,2)). true(stack(r,0)). does(a,plays(domino(2,2),l)). 
}).
#brave_ordering(e90,e91).

#pos(e92,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(2,3),l)). 
}).
#pos(e93,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(stack(r,1)). true(stack(l,2)). does(b,plays(domino(0,1),r)). 
}).
#brave_ordering(e92,e93).

#pos(e94,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),l)). 
}).
#pos(e95,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),r)). 
}).
#brave_ordering(e94,e95).

#pos(e96,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,1),l)). 
}).
#pos(e97,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,1)). true(stack(l,0)). does(b,plays(domino(0,0),l)). 
}).
#brave_ordering(e96,e97).

#pos(e98,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,0)). does(a,plays(domino(0,3),l)). 
}).
#pos(e99,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(l,3)). true(stack(r,0)). does(a,plays(domino(0,2),r)). 
}).
#brave_ordering(e98,e99).

#pos(e100,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(0,2),l)). 
}).
#pos(e101,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,1)). true(stack(l,2)). does(a,plays(domino(2,2),l)). 
}).
#brave_ordering(e100,e101).

#pos(e102,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,2)). does(b,plays(domino(2,3),l)). 
}).
#pos(e103,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,2)). does(b,plays(domino(0,1),r)). 
}).
#brave_ordering(e102,e103).

#pos(e104,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(1,2),r)). 
}).
#pos(e105,{}, {}, {
 true(control(a)). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(b,domino(2,3))). true(stack(r,2)). true(stack(l,0)). does(a,plays(domino(2,2),r)). 
}).
#brave_ordering(e104,e105).

#pos(e106,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(2,3),r)). 
}).
#pos(e107,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(stack(l,1)). true(stack(r,2)). does(b,plays(domino(0,1),l)). 
}).
#brave_ordering(e106,e107).

#pos(e108,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),r)). 
}).
#pos(e109,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),l)). 
}).
#brave_ordering(e108,e109).

#pos(e110,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,1),r)). 
}).
#pos(e111,{}, {}, {
 true(control(b)). true(in_hand(b,domino(2,3))). true(in_hand(b,domino(0,1))). true(in_hand(b,domino(0,0))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(0,2))). true(stack(r,0)). true(stack(l,1)). does(b,plays(domino(0,0),r)). 
}).
#brave_ordering(e110,e111).

#pos(e112,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,0)). does(a,plays(domino(0,3),r)). 
}).
#pos(e113,{}, {}, {
 true(control(a)). true(in_hand(a,domino(0,2))). true(in_hand(a,domino(1,2))). true(in_hand(a,domino(2,2))). true(in_hand(a,domino(0,3))). true(in_hand(b,domino(0,0))). true(in_hand(b,domino(1,1))). true(in_hand(b,domino(2,3))). true(stack(r,3)). true(stack(l,0)). does(a,plays(domino(0,2),l)). 
}).
#brave_ordering(e112,e113).