
#pos(e0,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e1,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e3,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). does(b,remove(1,1)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e5,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,0)). true(has(1,1)). does(a,remove(3,3)). 
}).
#pos(e7,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,0)). true(has(1,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(a,remove(1,1)). 
}).
#pos(e9,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(a,remove(1,2)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,0)). does(a,remove(3,2)). 
}).
#pos(e11,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,3)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,1)). 
}).
#pos(e13,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)). does(a,remove(1,2)). 
}).
#pos(e15,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)). does(a,remove(1,2)). 
}).
#pos(e17,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e19,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e21,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e23,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e25,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e27,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e29,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e31,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,1)). does(b,remove(2,2)). 
}).
#pos(e33,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,2)). 
}).
#pos(e35,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e37,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(3,3)). 
}).
#pos(e39,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(b,remove(2,1)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,1)). 
}).
#pos(e41,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,0)). true(has(3,2)). does(a,remove(3,2)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e43,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e45,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(3,2)). 
}).
#pos(e47,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e49,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e51,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e53,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e55,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#pos(e57,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e59,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). does(a,remove(2,2)). 
}).
#pos(e61,{}, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e63,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#pos(e65,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(a,remove(3,3)). 
}).
#pos(e67,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,3)). true(has(2,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e69,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e71,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,1)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(3,2)). 
}).
#pos(e73,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(2,1)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e72,e73).

#pos(e74,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e75,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e74,e75).

#pos(e76,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e77,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e76,e77).

#pos(e78,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e79,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e78,e79).

#pos(e80,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e81,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(2,2)). 
}).
#brave_ordering(e80,e81).

#pos(e82,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e83,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,2)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e82,e83).

#pos(e84,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e85,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,1)). does(a,remove(3,2)). 
}).
#brave_ordering(e84,e85).

#pos(e86,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,1)). does(a,remove(3,1)). 
}).
#pos(e87,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e86,e87).

#pos(e88,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e89,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e88,e89).

#pos(e90,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e91,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e90,e91).

#pos(e92,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e93,{}, {}, {
 true(control(b)). true(has(3,2)). true(has(2,1)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e92,e93).

#pos(e94,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,1)). 
}).
#pos(e95,{}, {}, {
 true(control(b)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e94,e95).

#pos(e96,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(b,remove(1,1)). 
}).
#pos(e97,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(b,remove(2,1)). 
}).
#brave_ordering(e96,e97).

#pos(e98,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(b,remove(1,1)). 
}).
#pos(e99,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,2)). does(b,remove(2,2)). 
}).
#brave_ordering(e98,e99).

#pos(e100,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(b,remove(2,1)). 
}).
#pos(e101,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,1)). does(b,remove(2,2)). 
}).
#brave_ordering(e100,e101).

#pos(e102,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). does(a,remove(2,1)). 
}).
#pos(e103,{}, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). does(a,remove(2,2)). 
}).
#brave_ordering(e102,e103).

#pos(e104,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e105,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(b,remove(1,1)). 
}).
#brave_ordering(e104,e105).

#pos(e106,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(b,remove(2,2)). 
}).
#pos(e107,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(2,2)). true(has(3,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e106,e107).

#pos(e108,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e109,{}, {}, {
 true(control(a)). true(has(1,0)). true(has(3,2)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e108,e109).

#pos(e110,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,2)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e111,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,2)). true(has(1,0)). does(b,remove(2,1)). 
}).
#brave_ordering(e110,e111).

#pos(e112,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,2)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e113,{}, {}, {
 true(control(b)). true(has(2,1)). true(has(3,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e112,e113).

#pos(e114,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,3)). 
}).
#pos(e115,{}, {}, {
 true(control(a)). true(has(3,3)). true(has(1,0)). true(has(2,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e114,e115).

#pos(e116,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,3)). true(has(2,1)). does(b,remove(3,2)). 
}).
#pos(e117,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,3)). true(has(2,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e116,e117).

#pos(e118,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,3)). true(has(2,0)). does(b,remove(3,3)). 
}).
#pos(e119,{}, {}, {
 true(control(b)). true(has(1,1)). true(has(3,3)). true(has(2,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e118,e119).

#pos(e120,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,2)). does(b,remove(1,1)). 
}).
#pos(e121,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(1,2)). true(has(2,2)). does(b,remove(1,2)). 
}).
#brave_ordering(e120,e121).

#pos(e122,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(a,remove(1,1)). 
}).
#pos(e123,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(a,remove(1,2)). 
}).
#brave_ordering(e122,e123).

#pos(e124,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,2)). 
}).
#pos(e125,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e124,e125).

#pos(e126,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,2)). 
}).
#pos(e127,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e126,e127).

#pos(e128,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e129,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,3)). true(has(1,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e128,e129).

#pos(e130,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(b,remove(1,1)). 
}).
#pos(e131,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e130,e131).

#pos(e132,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e133,{}, {}, {
 true(control(a)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e132,e133).

#pos(e134,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(b,remove(3,1)). 
}).
#pos(e135,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(3,2)). true(has(1,0)). does(b,remove(3,2)). 
}).
#brave_ordering(e134,e135).

#pos(e136,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)). does(a,remove(3,2)). 
}).
#pos(e137,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)). does(a,remove(3,1)). 
}).
#brave_ordering(e136,e137).

#pos(e138,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)). does(a,remove(3,2)). 
}).
#pos(e139,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e138,e139).

#pos(e140,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e141,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(3,3)). 
}).
#brave_ordering(e140,e141).

#pos(e142,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e143,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(1,2)). 
}).
#brave_ordering(e142,e143).

#pos(e144,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e145,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,3)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e144,e145).

#pos(e146,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,1)). 
}).
#pos(e147,{}, {}, {
 true(control(b)). true(has(2,0)). true(has(1,0)). true(has(3,2)). does(b,remove(3,2)). 
}).
#brave_ordering(e146,e147).

#pos(e148,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e149,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,0)). does(a,remove(3,1)). 
}).
#brave_ordering(e148,e149).

#pos(e150,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,0)). does(a,remove(3,2)). 
}).
#pos(e151,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,1)). true(has(2,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e150,e151).

#pos(e152,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,1)). 
}).
#pos(e153,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(2,0)). true(has(1,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e152,e153).

#pos(e154,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,1)). 
}).
#pos(e155,{}, {}, {
 true(control(a)). true(has(3,2)). true(has(1,0)). true(has(2,0)). does(a,remove(3,2)). 
}).
#brave_ordering(e154,e155).

#pos(e156,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,0)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e157,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,0)). true(has(1,0)). does(b,remove(3,3)). 
}).
#brave_ordering(e156,e157).

#pos(e158,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,0)). true(has(1,0)). does(b,remove(3,2)). 
}).
#pos(e159,{}, {}, {
 true(control(b)). true(has(3,3)). true(has(2,0)). true(has(1,0)). does(b,remove(3,1)). 
}).
#brave_ordering(e158,e159).

#pos(e160,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(1,0)). does(a,remove(3,3)). 
}).
#pos(e161,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(1,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e160,e161).

#pos(e162,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(1,1)). does(a,remove(3,2)). 
}).
#pos(e163,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(3,3)). true(has(1,1)). does(a,remove(1,1)). 
}).
#brave_ordering(e162,e163).

#pos(e164,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). does(a,remove(1,1)). 
}).
#pos(e165,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). does(a,remove(1,2)). 
}).
#brave_ordering(e164,e165).

#pos(e166,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,2)). 
}).
#pos(e167,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,1)). 
}).
#brave_ordering(e166,e167).

#pos(e168,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(1,2)). 
}).
#pos(e169,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,1)). does(b,remove(3,1)). 
}).
#brave_ordering(e168,e169).

#pos(e170,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,1)). does(a,remove(1,1)). 
}).
#pos(e171,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,1)). does(a,remove(1,2)). 
}).
#brave_ordering(e170,e171).

#pos(e172,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,1)). does(a,remove(1,1)). 
}).
#pos(e173,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,1)). does(a,remove(2,1)). 
}).
#brave_ordering(e172,e173).

#pos(e174,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,1)). 
}).
#pos(e175,{}, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). does(b,remove(1,2)). 
}).
#brave_ordering(e174,e175).

#pos(e176,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,0)). does(a,remove(1,2)). 
}).
#pos(e177,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,0)). does(a,remove(1,1)). 
}).
#brave_ordering(e176,e177).

#pos(e178,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,0)). does(a,remove(1,2)). 
}).
#pos(e179,{}, {}, {
 true(control(a)). true(has(2,1)). true(has(1,2)). true(has(3,0)). does(a,remove(2,1)). 
}).
#brave_ordering(e178,e179).

#pos(e180,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,3)). does(a,remove(2,2)). 
}).
#pos(e181,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,3)). does(a,remove(2,1)). 
}).
#brave_ordering(e180,e181).

#pos(e182,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,3)). does(a,remove(2,2)). 
}).
#pos(e183,{}, {}, {
 true(control(a)). true(has(1,2)). true(has(2,3)). true(has(3,3)). does(a,remove(2,3)). 
}).
#brave_ordering(e182,e183).