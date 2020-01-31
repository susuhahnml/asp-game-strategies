
#pos(e0,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e0,e1).

#pos(e2,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e3,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2,e3).

#pos(e4,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e5,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e4,e5).

#pos(e6,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e7,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e6,e7).

#pos(e8,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e9,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e8,e9).

#pos(e10,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e11,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e10,e11).

#pos(e12,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e13,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e12,e13).

#pos(e14,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e15,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e14,e15).

#pos(e16,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e17,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e16,e17).

#pos(e18,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e19,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e18,e19).

#pos(e20,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e21,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e20,e21).

#pos(e22,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e23,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e22,e23).

#pos(e24,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e25,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e24,e25).

#pos(e26,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e27,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e26,e27).

#pos(e28,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e29,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e28,e29).

#pos(e30,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e31,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e30,e31).

#pos(e32,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e33,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e32,e33).

#pos(e34,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e35,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e34,e35).

#pos(e36,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e37,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e36,e37).

#pos(e38,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e39,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e38,e39).

#pos(e40,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e41,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e40,e41).

#pos(e42,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e43,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e42,e43).

#pos(e44,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e45,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e44,e45).

#pos(e46,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e47,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e46,e47).

#pos(e48,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e49,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e48,e49).

#pos(e50,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e51,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e50,e51).

#pos(e52,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e53,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e52,e53).

#pos(e54,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e55,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e54,e55).

#pos(e56,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e57,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e56,e57).

#pos(e58,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e59,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e58,e59).

#pos(e60,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e61,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e60,e61).

#pos(e62,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e63,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e62,e63).

#pos(e64,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e65,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e64,e65).

#pos(e66,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e67,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e66,e67).

#pos(e68,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e69,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e68,e69).

#pos(e70,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e71,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e70,e71).

#pos(e72,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e73,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e72,e73).

#pos(e74,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e75,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e74,e75).

#pos(e76,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e77,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e76,e77).

#pos(e78,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e79,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e78,e79).

#pos(e80,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e81,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e80,e81).

#pos(e82,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e83,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e82,e83).

#pos(e84,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e85,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e84,e85).

#pos(e86,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e87,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e86,e87).

#pos(e88,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e89,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e88,e89).

#pos(e90,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e91,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e90,e91).

#pos(e92,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e93,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e92,e93).

#pos(e94,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e95,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e94,e95).

#pos(e96,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e97,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e96,e97).

#pos(e98,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e99,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e98,e99).

#pos(e100,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e101,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e100,e101).

#pos(e102,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e103,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e102,e103).

#pos(e104,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e105,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e104,e105).

#pos(e106,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e107,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e106,e107).

#pos(e108,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e109,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e108,e109).

#pos(e110,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e111,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e110,e111).

#pos(e112,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e113,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e112,e113).

#pos(e114,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e115,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e114,e115).

#pos(e116,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e117,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e116,e117).

#pos(e118,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e119,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e118,e119).

#pos(e120,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e121,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e120,e121).

#pos(e122,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e123,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e122,e123).

#pos(e124,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e125,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e124,e125).

#pos(e126,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e127,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e126,e127).

#pos(e128,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e129,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e128,e129).

#pos(e130,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e131,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e130,e131).

#pos(e132,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e133,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e132,e133).

#pos(e134,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e135,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e134,e135).

#pos(e136,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e137,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e136,e137).

#pos(e138,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e139,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e138,e139).

#pos(e140,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e141,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e140,e141).

#pos(e142,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e143,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e142,e143).

#pos(e144,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e145,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e144,e145).

#pos(e146,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e147,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e146,e147).

#pos(e148,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e149,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e148,e149).

#pos(e150,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e151,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e150,e151).

#pos(e152,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e153,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e152,e153).

#pos(e154,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e155,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e154,e155).

#pos(e156,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e157,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e156,e157).

#pos(e158,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e159,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e158,e159).

#pos(e160,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e161,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e160,e161).

#pos(e162,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e163,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e162,e163).

#pos(e164,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e165,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e164,e165).

#pos(e166,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e167,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e166,e167).

#pos(e168,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e169,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e168,e169).

#pos(e170,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e171,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e170,e171).

#pos(e172,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e173,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e172,e173).

#pos(e174,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e175,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e174,e175).

#pos(e176,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e177,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e176,e177).

#pos(e178,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e179,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e178,e179).

#pos(e180,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e181,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e180,e181).

#pos(e182,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e183,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e182,e183).

#pos(e184,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e185,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e184,e185).

#pos(e186,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e187,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e186,e187).

#pos(e188,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e189,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e188,e189).

#pos(e190,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e191,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e190,e191).

#pos(e192,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e193,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e192,e193).

#pos(e194,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e195,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e194,e195).

#pos(e196,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e197,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e196,e197).

#pos(e198,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e199,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e198,e199).

#pos(e200,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e201,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e200,e201).

#pos(e202,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e203,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e202,e203).

#pos(e204,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e205,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e204,e205).

#pos(e206,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e207,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e206,e207).

#pos(e208,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e209,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e208,e209).

#pos(e210,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e211,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e210,e211).

#pos(e212,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e213,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e212,e213).

#pos(e214,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e215,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e214,e215).

#pos(e216,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e217,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e216,e217).

#pos(e218,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e219,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e218,e219).

#pos(e220,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e221,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e220,e221).

#pos(e222,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e223,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e222,e223).

#pos(e224,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e225,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e224,e225).

#pos(e226,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e227,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e226,e227).

#pos(e228,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e229,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e228,e229).

#pos(e230,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e231,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e230,e231).

#pos(e232,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e233,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e232,e233).

#pos(e234,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e235,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e234,e235).

#pos(e236,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e237,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e236,e237).

#pos(e238,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e239,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e238,e239).

#pos(e240,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e241,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e240,e241).

#pos(e242,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e243,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e242,e243).

#pos(e244,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e245,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e244,e245).

#pos(e246,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e247,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e246,e247).

#pos(e248,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e249,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e248,e249).

#pos(e250,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e251,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e250,e251).

#pos(e252,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e253,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e252,e253).

#pos(e254,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e255,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e254,e255).

#pos(e256,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e257,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e256,e257).

#pos(e258,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e259,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e258,e259).

#pos(e260,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e261,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e260,e261).

#pos(e262,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e263,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e262,e263).

#pos(e264,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e265,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e264,e265).

#pos(e266,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e267,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e266,e267).

#pos(e268,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e269,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e268,e269).

#pos(e270,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e271,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e270,e271).

#pos(e272,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e273,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e272,e273).

#pos(e274,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e275,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e274,e275).

#pos(e276,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e277,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e276,e277).

#pos(e278,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e279,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e278,e279).

#pos(e280,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e281,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e280,e281).

#pos(e282,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e283,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e282,e283).

#pos(e284,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e285,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e284,e285).

#pos(e286,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e287,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e286,e287).

#pos(e288,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e289,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e288,e289).

#pos(e290,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e291,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e290,e291).

#pos(e292,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e293,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e292,e293).

#pos(e294,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e295,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e294,e295).

#pos(e296,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e297,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e296,e297).

#pos(e298,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e299,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e298,e299).

#pos(e300,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e301,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e300,e301).

#pos(e302,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e303,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e302,e303).

#pos(e304,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e305,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e304,e305).

#pos(e306,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e307,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e306,e307).

#pos(e308,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e309,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e308,e309).

#pos(e310,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e311,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e310,e311).

#pos(e312,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e313,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e312,e313).

#pos(e314,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e315,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e314,e315).

#pos(e316,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e317,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e316,e317).

#pos(e318,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e319,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e318,e319).

#pos(e320,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e321,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e320,e321).

#pos(e322,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e323,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e322,e323).

#pos(e324,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e325,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e324,e325).

#pos(e326,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e327,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e326,e327).

#pos(e328,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e329,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e328,e329).

#pos(e330,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e331,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e330,e331).

#pos(e332,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e333,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e332,e333).

#pos(e334,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#pos(e335,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#brave_ordering(e334,e335).

#pos(e336,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e337,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e336,e337).

#pos(e338,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e339,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e338,e339).

#pos(e340,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e341,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e340,e341).

#pos(e342,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e343,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e342,e343).

#pos(e344,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e345,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e344,e345).

#pos(e346,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e347,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e346,e347).

#pos(e348,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e349,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e348,e349).

#pos(e350,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e351,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e350,e351).

#pos(e352,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e353,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e352,e353).

#pos(e354,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e355,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e354,e355).

#pos(e356,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e357,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e356,e357).

#pos(e358,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e359,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e358,e359).

#pos(e360,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e361,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e360,e361).

#pos(e362,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e363,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e362,e363).

#pos(e364,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e365,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e364,e365).

#pos(e366,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e367,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e366,e367).

#pos(e368,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e369,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e368,e369).

#pos(e370,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e371,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e370,e371).

#pos(e372,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e373,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e372,e373).

#pos(e374,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e375,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e374,e375).

#pos(e376,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e377,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e376,e377).

#pos(e378,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e379,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e378,e379).

#pos(e380,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e381,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e380,e381).

#pos(e382,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e383,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e382,e383).

#pos(e384,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e385,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e384,e385).

#pos(e386,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e387,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e386,e387).

#pos(e388,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e389,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e388,e389).

#pos(e390,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e391,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e390,e391).

#pos(e392,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e393,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e392,e393).

#pos(e394,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e395,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e394,e395).

#pos(e396,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e397,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e396,e397).

#pos(e398,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e399,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e398,e399).

#pos(e400,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e401,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e400,e401).

#pos(e402,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e403,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e402,e403).

#pos(e404,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e405,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e404,e405).

#pos(e406,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e407,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e406,e407).

#pos(e408,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e409,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e408,e409).

#pos(e410,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e411,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e410,e411).

#pos(e412,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e413,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e412,e413).

#pos(e414,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e415,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e414,e415).

#pos(e416,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e417,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e416,e417).

#pos(e418,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e419,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e418,e419).

#pos(e420,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e421,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e420,e421).

#pos(e422,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e423,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e422,e423).

#pos(e424,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e425,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e424,e425).

#pos(e426,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e427,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e426,e427).

#pos(e428,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e429,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e428,e429).

#pos(e430,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e431,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e430,e431).

#pos(e432,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e433,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e432,e433).

#pos(e434,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e435,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e434,e435).

#pos(e436,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e437,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e436,e437).

#pos(e438,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e439,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e438,e439).

#pos(e440,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e441,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e440,e441).

#pos(e442,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e443,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e442,e443).

#pos(e444,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e445,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e444,e445).

#pos(e446,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e447,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e446,e447).

#pos(e448,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e449,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e448,e449).

#pos(e450,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e451,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e450,e451).

#pos(e452,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e453,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e452,e453).

#pos(e454,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e455,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e454,e455).

#pos(e456,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e457,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e456,e457).

#pos(e458,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e459,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e458,e459).

#pos(e460,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e461,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e460,e461).

#pos(e462,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e463,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e462,e463).

#pos(e464,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e465,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e464,e465).

#pos(e466,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e467,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e466,e467).

#pos(e468,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e469,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e468,e469).

#pos(e470,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e471,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e470,e471).

#pos(e472,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e473,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e472,e473).

#pos(e474,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e475,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e474,e475).

#pos(e476,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e477,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e476,e477).

#pos(e478,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e479,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e478,e479).

#pos(e480,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e481,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e480,e481).

#pos(e482,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e483,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e482,e483).

#pos(e484,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e485,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e484,e485).

#pos(e486,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e487,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e486,e487).

#pos(e488,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e489,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e488,e489).

#pos(e490,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e491,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e490,e491).

#pos(e492,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e493,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e492,e493).

#pos(e494,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e495,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e494,e495).

#pos(e496,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e497,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e496,e497).

#pos(e498,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e499,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e498,e499).

#pos(e500,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e501,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e500,e501).

#pos(e502,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e503,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e502,e503).

#pos(e504,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e505,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e504,e505).

#pos(e506,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e507,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e506,e507).

#pos(e508,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e509,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e508,e509).

#pos(e510,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e511,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e510,e511).

#pos(e512,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e513,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e512,e513).

#pos(e514,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e515,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e514,e515).

#pos(e516,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e517,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e516,e517).

#pos(e518,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e519,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e518,e519).

#pos(e520,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e521,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e520,e521).

#pos(e522,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e523,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e522,e523).

#pos(e524,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e525,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e524,e525).

#pos(e526,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e527,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e526,e527).

#pos(e528,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e529,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e528,e529).

#pos(e530,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e531,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e530,e531).

#pos(e532,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e533,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e532,e533).

#pos(e534,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e535,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e534,e535).

#pos(e536,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e537,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e536,e537).

#pos(e538,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e539,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e538,e539).

#pos(e540,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e541,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e540,e541).

#pos(e542,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e543,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e542,e543).

#pos(e544,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e545,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e544,e545).

#pos(e546,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e547,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e546,e547).

#pos(e548,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e549,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e548,e549).

#pos(e550,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e551,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e550,e551).

#pos(e552,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e553,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e552,e553).

#pos(e554,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e555,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e554,e555).

#pos(e556,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e557,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e556,e557).

#pos(e558,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e559,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e558,e559).

#pos(e560,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e561,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e560,e561).

#pos(e562,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e563,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e562,e563).

#pos(e564,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e565,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e564,e565).

#pos(e566,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e567,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e566,e567).

#pos(e568,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e569,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e568,e569).

#pos(e570,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e571,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e570,e571).

#pos(e572,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e573,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e572,e573).

#pos(e574,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e575,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e574,e575).

#pos(e576,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e577,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e576,e577).

#pos(e578,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e579,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e578,e579).

#pos(e580,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e581,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e580,e581).

#pos(e582,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e583,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e582,e583).

#pos(e584,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e585,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e584,e585).

#pos(e586,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e587,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e586,e587).

#pos(e588,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e589,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e588,e589).

#pos(e590,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e591,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e590,e591).

#pos(e592,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e593,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e592,e593).

#pos(e594,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e595,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e594,e595).

#pos(e596,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e597,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e596,e597).

#pos(e598,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e599,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e598,e599).

#pos(e600,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e601,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e600,e601).

#pos(e602,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e603,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e602,e603).

#pos(e604,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e605,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e604,e605).

#pos(e606,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e607,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e606,e607).

#pos(e608,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e609,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e608,e609).

#pos(e610,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e611,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e610,e611).

#pos(e612,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e613,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e612,e613).

#pos(e614,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e615,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e614,e615).

#pos(e616,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e617,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e616,e617).

#pos(e618,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e619,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e618,e619).

#pos(e620,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e621,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e620,e621).

#pos(e622,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e623,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e622,e623).

#pos(e624,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e625,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e624,e625).

#pos(e626,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e627,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e626,e627).

#pos(e628,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e629,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e628,e629).

#pos(e630,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e631,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e630,e631).

#pos(e632,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e633,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e632,e633).

#pos(e634,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e635,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e634,e635).

#pos(e636,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e637,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e636,e637).

#pos(e638,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e639,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e638,e639).

#pos(e640,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e641,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e640,e641).

#pos(e642,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e643,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e642,e643).

#pos(e644,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e645,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e644,e645).

#pos(e646,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e647,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e646,e647).

#pos(e648,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e649,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e648,e649).

#pos(e650,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e651,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e650,e651).

#pos(e652,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e653,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e652,e653).

#pos(e654,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e655,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e654,e655).

#pos(e656,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e657,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e656,e657).

#pos(e658,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e659,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e658,e659).

#pos(e660,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e661,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e660,e661).

#pos(e662,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e663,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e662,e663).

#pos(e664,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e665,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e664,e665).

#pos(e666,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e667,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e666,e667).

#pos(e668,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e669,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e668,e669).

#pos(e670,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e671,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e670,e671).

#pos(e672,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e673,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e672,e673).

#pos(e674,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e675,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e674,e675).

#pos(e676,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e677,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e676,e677).

#pos(e678,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e679,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e678,e679).

#pos(e680,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e681,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e680,e681).

#pos(e682,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e683,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e682,e683).

#pos(e684,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e685,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e684,e685).

#pos(e686,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e687,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e686,e687).

#pos(e688,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e689,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e688,e689).

#pos(e690,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e691,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e690,e691).

#pos(e692,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e693,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e692,e693).

#pos(e694,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e695,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e694,e695).

#pos(e696,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e697,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e696,e697).

#pos(e698,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e699,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e698,e699).

#pos(e700,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e701,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e700,e701).

#pos(e702,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e703,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e702,e703).

#pos(e704,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e705,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e704,e705).

#pos(e706,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e707,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e706,e707).

#pos(e708,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e709,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e708,e709).

#pos(e710,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e711,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e710,e711).

#pos(e712,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e713,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e712,e713).

#pos(e714,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e715,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e714,e715).

#pos(e716,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e717,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e716,e717).

#pos(e718,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e719,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e718,e719).

#pos(e720,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e721,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e720,e721).

#pos(e722,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e723,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e722,e723).

#pos(e724,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e725,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e724,e725).

#pos(e726,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e727,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e726,e727).

#pos(e728,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e729,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e728,e729).

#pos(e730,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e731,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e730,e731).

#pos(e732,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e733,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e732,e733).

#pos(e734,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e735,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e734,e735).

#pos(e736,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e737,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e736,e737).

#pos(e738,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e739,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e738,e739).

#pos(e740,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e741,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e740,e741).

#pos(e742,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e743,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e742,e743).

#pos(e744,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e745,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e744,e745).

#pos(e746,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e747,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e746,e747).

#pos(e748,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e749,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e748,e749).

#pos(e750,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e751,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e750,e751).

#pos(e752,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e753,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e752,e753).

#pos(e754,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e755,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e754,e755).

#pos(e756,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e757,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e756,e757).

#pos(e758,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e759,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e758,e759).

#pos(e760,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e761,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e760,e761).

#pos(e762,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e763,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e762,e763).

#pos(e764,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e765,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e764,e765).

#pos(e766,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e767,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e766,e767).

#pos(e768,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e769,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e768,e769).

#pos(e770,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e771,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e770,e771).

#pos(e772,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e773,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e772,e773).

#pos(e774,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e775,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e774,e775).

#pos(e776,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e777,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e776,e777).

#pos(e778,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e779,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e778,e779).

#pos(e780,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e781,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e780,e781).

#pos(e782,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e783,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e782,e783).

#pos(e784,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e785,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e784,e785).

#pos(e786,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e787,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e786,e787).

#pos(e788,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e789,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e788,e789).

#pos(e790,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e791,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e790,e791).

#pos(e792,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e793,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e792,e793).

#pos(e794,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e795,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e794,e795).

#pos(e796,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e797,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e796,e797).

#pos(e798,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e799,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e798,e799).

#pos(e800,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e801,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e800,e801).

#pos(e802,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e803,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e802,e803).

#pos(e804,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e805,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e804,e805).

#pos(e806,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e807,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e806,e807).

#pos(e808,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e809,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e808,e809).

#pos(e810,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e811,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e810,e811).

#pos(e812,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e813,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e812,e813).

#pos(e814,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e815,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e814,e815).

#pos(e816,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e817,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e816,e817).

#pos(e818,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e819,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e818,e819).

#pos(e820,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e821,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e820,e821).

#pos(e822,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e823,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e822,e823).

#pos(e824,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e825,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e824,e825).

#pos(e826,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e827,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e826,e827).

#pos(e828,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e829,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e828,e829).

#pos(e830,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e831,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e830,e831).

#pos(e832,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e833,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e832,e833).

#pos(e834,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e835,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e834,e835).

#pos(e836,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e837,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e836,e837).

#pos(e838,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e839,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e838,e839).

#pos(e840,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e841,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e840,e841).

#pos(e842,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e843,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e842,e843).

#pos(e844,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e845,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e844,e845).

#pos(e846,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e847,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e846,e847).

#pos(e848,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e849,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e848,e849).

#pos(e850,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#pos(e851,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#brave_ordering(e850,e851).

#pos(e852,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#pos(e853,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#brave_ordering(e852,e853).

#pos(e854,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#pos(e855,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#brave_ordering(e854,e855).

#pos(e856,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#pos(e857,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,4)). 
}).
#brave_ordering(e856,e857).

#pos(e858,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e859,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e858,e859).

#pos(e860,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e861,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e860,e861).

#pos(e862,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e863,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e862,e863).

#pos(e864,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e865,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e864,e865).

#pos(e866,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e867,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e866,e867).

#pos(e868,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e869,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e868,e869).

#pos(e870,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e871,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e870,e871).

#pos(e872,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e873,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e872,e873).

#pos(e874,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e875,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e874,e875).

#pos(e876,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e877,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e876,e877).

#pos(e878,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e879,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e878,e879).

#pos(e880,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e881,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e880,e881).

#pos(e882,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e883,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e882,e883).

#pos(e884,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e885,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e884,e885).

#pos(e886,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e887,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e886,e887).

#pos(e888,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e889,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e888,e889).

#pos(e890,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e891,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e890,e891).

#pos(e892,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e893,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e892,e893).

#pos(e894,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e895,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e894,e895).

#pos(e896,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e897,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e896,e897).

#pos(e898,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e899,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e898,e899).

#pos(e900,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e901,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e900,e901).

#pos(e902,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e903,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e902,e903).

#pos(e904,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e905,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e904,e905).

#pos(e906,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e907,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e906,e907).

#pos(e908,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e909,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e908,e909).

#pos(e910,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e911,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e910,e911).

#pos(e912,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e913,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e912,e913).

#pos(e914,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e915,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e914,e915).

#pos(e916,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e917,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e916,e917).

#pos(e918,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e919,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e918,e919).

#pos(e920,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e921,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e920,e921).

#pos(e922,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e923,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e922,e923).

#pos(e924,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e925,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e924,e925).

#pos(e926,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e927,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e926,e927).

#pos(e928,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e929,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e928,e929).

#pos(e930,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e931,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e930,e931).

#pos(e932,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e933,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e932,e933).

#pos(e934,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e935,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e934,e935).

#pos(e936,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e937,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e936,e937).

#pos(e938,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e939,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e938,e939).

#pos(e940,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e941,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e940,e941).

#pos(e942,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e943,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e942,e943).

#pos(e944,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e945,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e944,e945).

#pos(e946,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e947,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e946,e947).

#pos(e948,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e949,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e948,e949).

#pos(e950,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e951,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e950,e951).

#pos(e952,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e953,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e952,e953).

#pos(e954,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e955,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e954,e955).

#pos(e956,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e957,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e956,e957).

#pos(e958,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e959,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e958,e959).

#pos(e960,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e961,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e960,e961).

#pos(e962,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e963,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e962,e963).

#pos(e964,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e965,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e964,e965).

#pos(e966,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e967,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e966,e967).

#pos(e968,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e969,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e968,e969).

#pos(e970,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e971,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e970,e971).

#pos(e972,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e973,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e972,e973).

#pos(e974,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e975,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e974,e975).

#pos(e976,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e977,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e976,e977).

#pos(e978,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e979,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e978,e979).

#pos(e980,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e981,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e980,e981).

#pos(e982,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e983,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e982,e983).

#pos(e984,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e985,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e984,e985).

#pos(e986,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e987,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e986,e987).

#pos(e988,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e989,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e988,e989).

#pos(e990,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e991,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e990,e991).

#pos(e992,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e993,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e992,e993).

#pos(e994,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e995,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e994,e995).

#pos(e996,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e997,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e996,e997).

#pos(e998,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e999,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e998,e999).

#pos(e1000,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1001,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1000,e1001).

#pos(e1002,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1003,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1002,e1003).

#pos(e1004,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1005,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1004,e1005).

#pos(e1006,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1007,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1006,e1007).

#pos(e1008,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1009,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1008,e1009).

#pos(e1010,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1011,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1010,e1011).

#pos(e1012,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1013,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1012,e1013).

#pos(e1014,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1015,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1014,e1015).

#pos(e1016,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e1017,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e1016,e1017).

#pos(e1018,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1019,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1018,e1019).

#pos(e1020,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1021,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1020,e1021).

#pos(e1022,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1023,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1022,e1023).

#pos(e1024,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1025,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1024,e1025).

#pos(e1026,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1027,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1026,e1027).

#pos(e1028,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1029,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1028,e1029).

#pos(e1030,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1031,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1030,e1031).

#pos(e1032,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1033,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1032,e1033).

#pos(e1034,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1035,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1034,e1035).

#pos(e1036,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1037,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1036,e1037).

#pos(e1038,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1039,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1038,e1039).

#pos(e1040,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1041,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1040,e1041).

#pos(e1042,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1043,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1042,e1043).

#pos(e1044,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1045,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1044,e1045).

#pos(e1046,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1047,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1046,e1047).

#pos(e1048,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1049,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1048,e1049).

#pos(e1050,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1051,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1050,e1051).

#pos(e1052,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1053,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1052,e1053).

#pos(e1054,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1055,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1054,e1055).

#pos(e1056,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1057,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1056,e1057).

#pos(e1058,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1059,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1058,e1059).

#pos(e1060,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1061,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1060,e1061).

#pos(e1062,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1063,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1062,e1063).

#pos(e1064,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1065,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1064,e1065).

#pos(e1066,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1067,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1066,e1067).

#pos(e1068,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1069,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1068,e1069).

#pos(e1070,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1071,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1070,e1071).

#pos(e1072,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1073,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1072,e1073).

#pos(e1074,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1075,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1074,e1075).

#pos(e1076,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1077,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1076,e1077).

#pos(e1078,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1079,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1078,e1079).

#pos(e1080,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1081,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1080,e1081).

#pos(e1082,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1083,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1082,e1083).

#pos(e1084,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1085,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1084,e1085).

#pos(e1086,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1087,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1086,e1087).

#pos(e1088,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1089,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1088,e1089).

#pos(e1090,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1091,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1090,e1091).

#pos(e1092,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1093,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1092,e1093).

#pos(e1094,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1095,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1094,e1095).

#pos(e1096,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1097,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1096,e1097).

#pos(e1098,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1099,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1098,e1099).

#pos(e1100,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1101,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1100,e1101).

#pos(e1102,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1103,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1102,e1103).

#pos(e1104,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1105,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1104,e1105).

#pos(e1106,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1107,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1106,e1107).

#pos(e1108,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1109,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1108,e1109).

#pos(e1110,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1111,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1110,e1111).

#pos(e1112,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1113,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1112,e1113).

#pos(e1114,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1115,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1114,e1115).

#pos(e1116,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1117,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1116,e1117).

#pos(e1118,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1119,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1118,e1119).

#pos(e1120,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1121,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1120,e1121).

#pos(e1122,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1123,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1122,e1123).

#pos(e1124,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1125,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1124,e1125).

#pos(e1126,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1127,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1126,e1127).

#pos(e1128,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1129,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1128,e1129).

#pos(e1130,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1131,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1130,e1131).

#pos(e1132,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1133,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1132,e1133).

#pos(e1134,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1135,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1134,e1135).

#pos(e1136,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1137,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1136,e1137).

#pos(e1138,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1139,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1138,e1139).

#pos(e1140,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1141,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1140,e1141).

#pos(e1142,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1143,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1142,e1143).

#pos(e1144,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1145,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1144,e1145).

#pos(e1146,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1147,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1146,e1147).

#pos(e1148,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1149,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1148,e1149).

#pos(e1150,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1151,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1150,e1151).

#pos(e1152,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1153,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1152,e1153).

#pos(e1154,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1155,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1154,e1155).

#pos(e1156,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1157,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1156,e1157).

#pos(e1158,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1159,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1158,e1159).

#pos(e1160,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1161,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1160,e1161).

#pos(e1162,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1163,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1162,e1163).

#pos(e1164,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1165,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1164,e1165).

#pos(e1166,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1167,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1166,e1167).

#pos(e1168,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1169,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1168,e1169).

#pos(e1170,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1171,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1170,e1171).

#pos(e1172,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1173,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1172,e1173).

#pos(e1174,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1175,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1174,e1175).

#pos(e1176,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1177,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1176,e1177).

#pos(e1178,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1179,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1178,e1179).

#pos(e1180,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1181,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1180,e1181).

#pos(e1182,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e1183,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e1182,e1183).

#pos(e1184,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e1185,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e1184,e1185).

#pos(e1186,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e1187,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e1186,e1187).

#pos(e1188,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1189,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1188,e1189).

#pos(e1190,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1191,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1190,e1191).

#pos(e1192,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1193,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1192,e1193).

#pos(e1194,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1195,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1194,e1195).

#pos(e1196,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1197,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1196,e1197).

#pos(e1198,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1199,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1198,e1199).

#pos(e1200,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1201,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1200,e1201).

#pos(e1202,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1203,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1202,e1203).

#pos(e1204,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1205,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1204,e1205).

#pos(e1206,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1207,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1206,e1207).

#pos(e1208,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1209,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1208,e1209).

#pos(e1210,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1211,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1210,e1211).

#pos(e1212,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1213,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1212,e1213).

#pos(e1214,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1215,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1214,e1215).

#pos(e1216,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1217,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1216,e1217).

#pos(e1218,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1219,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1218,e1219).

#pos(e1220,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1221,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1220,e1221).

#pos(e1222,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1223,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1222,e1223).

#pos(e1224,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1225,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1224,e1225).

#pos(e1226,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1227,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1226,e1227).

#pos(e1228,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1229,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1228,e1229).

#pos(e1230,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1231,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1230,e1231).

#pos(e1232,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1233,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1232,e1233).

#pos(e1234,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1235,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1234,e1235).

#pos(e1236,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1237,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1236,e1237).

#pos(e1238,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e1239,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e1238,e1239).

#pos(e1240,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1241,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1240,e1241).

#pos(e1242,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1243,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1242,e1243).

#pos(e1244,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1245,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1244,e1245).

#pos(e1246,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1247,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1246,e1247).

#pos(e1248,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1249,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1248,e1249).

#pos(e1250,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1251,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1250,e1251).

#pos(e1252,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1253,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1252,e1253).

#pos(e1254,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1255,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1254,e1255).

#pos(e1256,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1257,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1256,e1257).

#pos(e1258,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1259,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1258,e1259).

#pos(e1260,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1261,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1260,e1261).

#pos(e1262,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1263,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1262,e1263).

#pos(e1264,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1265,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1264,e1265).

#pos(e1266,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1267,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1266,e1267).

#pos(e1268,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1269,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1268,e1269).

#pos(e1270,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1271,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1270,e1271).

#pos(e1272,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1273,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1272,e1273).

#pos(e1274,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1275,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1274,e1275).

#pos(e1276,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1277,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1276,e1277).

#pos(e1278,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1279,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1278,e1279).

#pos(e1280,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1281,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1280,e1281).

#pos(e1282,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1283,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1282,e1283).

#pos(e1284,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1285,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1284,e1285).

#pos(e1286,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e1287,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e1286,e1287).

#pos(e1288,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1289,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1288,e1289).

#pos(e1290,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1291,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1290,e1291).

#pos(e1292,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1293,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1292,e1293).

#pos(e1294,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1295,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1294,e1295).

#pos(e1296,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e1297,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e1296,e1297).

#pos(e1298,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1299,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1298,e1299).

#pos(e1300,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1301,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1300,e1301).

#pos(e1302,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1303,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1302,e1303).

#pos(e1304,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1305,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1304,e1305).

#pos(e1306,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1307,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1306,e1307).

#pos(e1308,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1309,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1308,e1309).

#pos(e1310,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1311,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1310,e1311).

#pos(e1312,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1313,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1312,e1313).

#pos(e1314,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1315,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1314,e1315).

#pos(e1316,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1317,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1316,e1317).

#pos(e1318,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1319,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1318,e1319).

#pos(e1320,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e1321,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e1320,e1321).

#pos(e1322,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1323,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1322,e1323).

#pos(e1324,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1325,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1324,e1325).

#pos(e1326,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1327,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1326,e1327).

#pos(e1328,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1329,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1328,e1329).

#pos(e1330,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1331,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1330,e1331).

#pos(e1332,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1333,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1332,e1333).

#pos(e1334,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1335,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1334,e1335).

#pos(e1336,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1337,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1336,e1337).

#pos(e1338,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1339,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1338,e1339).

#pos(e1340,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1341,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1340,e1341).

#pos(e1342,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1343,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1342,e1343).

#pos(e1344,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1345,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1344,e1345).

#pos(e1346,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1347,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1346,e1347).

#pos(e1348,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e1349,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e1348,e1349).

#pos(e1350,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e1351,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e1350,e1351).

#pos(e1352,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1353,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1352,e1353).

#pos(e1354,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1355,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1354,e1355).

#pos(e1356,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1357,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1356,e1357).

#pos(e1358,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1359,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1358,e1359).

#pos(e1360,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1361,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1360,e1361).

#pos(e1362,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1363,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1362,e1363).

#pos(e1364,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1365,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1364,e1365).

#pos(e1366,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e1367,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e1366,e1367).

#pos(e1368,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e1369,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e1368,e1369).

#pos(e1370,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1371,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1370,e1371).

#pos(e1372,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1373,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1372,e1373).

#pos(e1374,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1375,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1374,e1375).

#pos(e1376,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1377,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1376,e1377).

#pos(e1378,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1379,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1378,e1379).

#pos(e1380,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1381,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1380,e1381).

#pos(e1382,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#pos(e1383,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#brave_ordering(e1382,e1383).

#pos(e1384,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#pos(e1385,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#brave_ordering(e1384,e1385).

#pos(e1386,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#pos(e1387,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#brave_ordering(e1386,e1387).

#pos(e1388,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#pos(e1389,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,1)). 
}).
#brave_ordering(e1388,e1389).

#pos(e1390,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1391,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1390,e1391).

#pos(e1392,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1393,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1392,e1393).

#pos(e1394,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1395,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1394,e1395).

#pos(e1396,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1397,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1396,e1397).

#pos(e1398,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1399,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1398,e1399).

#pos(e1400,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1401,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1400,e1401).

#pos(e1402,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e1403,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e1402,e1403).

#pos(e1404,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1405,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1404,e1405).

#pos(e1406,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1407,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1406,e1407).

#pos(e1408,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1409,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1408,e1409).

#pos(e1410,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1411,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1410,e1411).

#pos(e1412,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1413,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1412,e1413).

#pos(e1414,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1415,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1414,e1415).

#pos(e1416,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1417,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1416,e1417).

#pos(e1418,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e1419,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e1418,e1419).

#pos(e1420,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1421,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1420,e1421).

#pos(e1422,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1423,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1422,e1423).

#pos(e1424,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1425,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1424,e1425).

#pos(e1426,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1427,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1426,e1427).

#pos(e1428,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1429,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1428,e1429).

#pos(e1430,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1431,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1430,e1431).

#pos(e1432,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1433,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1432,e1433).

#pos(e1434,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1435,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1434,e1435).

#pos(e1436,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1437,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1436,e1437).

#pos(e1438,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1439,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1438,e1439).

#pos(e1440,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1441,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1440,e1441).

#pos(e1442,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1443,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1442,e1443).

#pos(e1444,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1445,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1444,e1445).

#pos(e1446,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1447,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1446,e1447).

#pos(e1448,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1449,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1448,e1449).

#pos(e1450,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1451,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1450,e1451).

#pos(e1452,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1453,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1452,e1453).

#pos(e1454,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1455,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1454,e1455).

#pos(e1456,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1457,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1456,e1457).

#pos(e1458,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1459,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1458,e1459).

#pos(e1460,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1461,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1460,e1461).

#pos(e1462,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1463,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1462,e1463).

#pos(e1464,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1465,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1464,e1465).

#pos(e1466,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1467,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1466,e1467).

#pos(e1468,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1469,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1468,e1469).

#pos(e1470,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1471,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1470,e1471).

#pos(e1472,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1473,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1472,e1473).

#pos(e1474,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1475,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1474,e1475).

#pos(e1476,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1477,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1476,e1477).

#pos(e1478,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1479,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1478,e1479).

#pos(e1480,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e1481,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e1480,e1481).

#pos(e1482,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e1483,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e1482,e1483).

#pos(e1484,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e1485,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e1484,e1485).

#pos(e1486,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e1487,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e1486,e1487).

#pos(e1488,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1489,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1488,e1489).

#pos(e1490,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1491,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1490,e1491).

#pos(e1492,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1493,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1492,e1493).

#pos(e1494,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1495,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1494,e1495).

#pos(e1496,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1497,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1496,e1497).

#pos(e1498,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1499,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1498,e1499).

#pos(e1500,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e1501,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e1500,e1501).

#pos(e1502,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1503,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1502,e1503).

#pos(e1504,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e1505,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e1504,e1505).

#pos(e1506,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#pos(e1507,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,3)). 
}).
#brave_ordering(e1506,e1507).

#pos(e1508,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1509,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1508,e1509).

#pos(e1510,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1511,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1510,e1511).

#pos(e1512,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1513,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1512,e1513).

#pos(e1514,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1515,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1514,e1515).

#pos(e1516,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1517,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1516,e1517).

#pos(e1518,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1519,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1518,e1519).

#pos(e1520,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1521,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1520,e1521).

#pos(e1522,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e1523,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e1522,e1523).

#pos(e1524,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1525,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1524,e1525).

#pos(e1526,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1527,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1526,e1527).

#pos(e1528,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1529,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1528,e1529).

#pos(e1530,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1531,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1530,e1531).

#pos(e1532,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1533,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1532,e1533).

#pos(e1534,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1535,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1534,e1535).

#pos(e1536,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1537,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1536,e1537).

#pos(e1538,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1539,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1538,e1539).

#pos(e1540,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1541,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1540,e1541).

#pos(e1542,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1543,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1542,e1543).

#pos(e1544,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1545,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1544,e1545).

#pos(e1546,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1547,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1546,e1547).

#pos(e1548,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1549,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1548,e1549).

#pos(e1550,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1551,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1550,e1551).

#pos(e1552,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1553,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1552,e1553).

#pos(e1554,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1555,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1554,e1555).

#pos(e1556,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e1557,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e1556,e1557).

#pos(e1558,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e1559,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e1558,e1559).

#pos(e1560,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e1561,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e1560,e1561).

#pos(e1562,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1563,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1562,e1563).

#pos(e1564,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e1565,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e1564,e1565).

#pos(e1566,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1567,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1566,e1567).

#pos(e1568,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1569,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1568,e1569).

#pos(e1570,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1571,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1570,e1571).

#pos(e1572,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1573,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1572,e1573).

#pos(e1574,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1575,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1574,e1575).

#pos(e1576,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1577,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1576,e1577).

#pos(e1578,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1579,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1578,e1579).

#pos(e1580,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1581,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1580,e1581).

#pos(e1582,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e1583,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e1582,e1583).

#pos(e1584,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e1585,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e1584,e1585).

#pos(e1586,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1587,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1586,e1587).

#pos(e1588,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e1589,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e1588,e1589).

#pos(e1590,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1591,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1590,e1591).

#pos(e1592,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1593,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1592,e1593).

#pos(e1594,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1595,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1594,e1595).

#pos(e1596,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1597,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1596,e1597).

#pos(e1598,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1599,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1598,e1599).

#pos(e1600,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1601,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1600,e1601).

#pos(e1602,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1603,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1602,e1603).

#pos(e1604,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1605,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1604,e1605).

#pos(e1606,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1607,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1606,e1607).

#pos(e1608,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1609,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1608,e1609).

#pos(e1610,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e1611,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e1610,e1611).

#pos(e1612,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1613,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1612,e1613).

#pos(e1614,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1615,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1614,e1615).

#pos(e1616,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1617,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1616,e1617).

#pos(e1618,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e1619,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e1618,e1619).

#pos(e1620,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1621,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1620,e1621).

#pos(e1622,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1623,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1622,e1623).

#pos(e1624,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1625,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1624,e1625).

#pos(e1626,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1627,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1626,e1627).

#pos(e1628,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1629,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1628,e1629).

#pos(e1630,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1631,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1630,e1631).

#pos(e1632,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1633,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1632,e1633).

#pos(e1634,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1635,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1634,e1635).

#pos(e1636,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1637,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1636,e1637).

#pos(e1638,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1639,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1638,e1639).

#pos(e1640,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1641,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1640,e1641).

#pos(e1642,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1643,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1642,e1643).

#pos(e1644,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1645,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1644,e1645).

#pos(e1646,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1647,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1646,e1647).

#pos(e1648,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1649,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1648,e1649).

#pos(e1650,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1651,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1650,e1651).

#pos(e1652,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1653,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1652,e1653).

#pos(e1654,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1655,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1654,e1655).

#pos(e1656,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1657,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1656,e1657).

#pos(e1658,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1659,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1658,e1659).

#pos(e1660,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1661,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1660,e1661).

#pos(e1662,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1663,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1662,e1663).

#pos(e1664,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e1665,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e1664,e1665).

#pos(e1666,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1667,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1666,e1667).

#pos(e1668,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1669,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1668,e1669).

#pos(e1670,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e1671,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e1670,e1671).

#pos(e1672,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e1673,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e1672,e1673).

#pos(e1674,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1675,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1674,e1675).

#pos(e1676,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1677,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1676,e1677).

#pos(e1678,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e1679,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e1678,e1679).

#pos(e1680,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e1681,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e1680,e1681).

#pos(e1682,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e1683,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e1682,e1683).

#pos(e1684,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e1685,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e1684,e1685).

#pos(e1686,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e1687,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e1686,e1687).

#pos(e1688,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1689,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1688,e1689).

#pos(e1690,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1691,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1690,e1691).

#pos(e1692,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1693,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1692,e1693).

#pos(e1694,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1695,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1694,e1695).

#pos(e1696,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1697,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1696,e1697).

#pos(e1698,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1699,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1698,e1699).

#pos(e1700,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e1701,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e1700,e1701).

#pos(e1702,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e1703,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e1702,e1703).

#pos(e1704,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1705,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1704,e1705).

#pos(e1706,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1707,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1706,e1707).

#pos(e1708,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1709,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1708,e1709).

#pos(e1710,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1711,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1710,e1711).

#pos(e1712,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1713,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1712,e1713).

#pos(e1714,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1715,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1714,e1715).

#pos(e1716,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e1717,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e1716,e1717).

#pos(e1718,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e1719,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e1718,e1719).

#pos(e1720,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e1721,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e1720,e1721).

#pos(e1722,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e1723,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e1722,e1723).

#pos(e1724,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e1725,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e1724,e1725).

#pos(e1726,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1727,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1726,e1727).

#pos(e1728,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1729,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1728,e1729).

#pos(e1730,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1731,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1730,e1731).

#pos(e1732,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1733,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1732,e1733).

#pos(e1734,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e1735,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e1734,e1735).

#pos(e1736,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1737,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1736,e1737).

#pos(e1738,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1739,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1738,e1739).

#pos(e1740,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1741,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1740,e1741).

#pos(e1742,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1743,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1742,e1743).

#pos(e1744,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e1745,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e1744,e1745).

#pos(e1746,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1747,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1746,e1747).

#pos(e1748,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1749,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1748,e1749).

#pos(e1750,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1751,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1750,e1751).

#pos(e1752,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1753,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1752,e1753).

#pos(e1754,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1755,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1754,e1755).

#pos(e1756,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1757,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1756,e1757).

#pos(e1758,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1759,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1758,e1759).

#pos(e1760,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,2)). 
}).
#pos(e1761,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,2)). 
}).
#brave_ordering(e1760,e1761).

#pos(e1762,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,2)). 
}).
#pos(e1763,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,2)). 
}).
#brave_ordering(e1762,e1763).

#pos(e1764,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1765,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1764,e1765).

#pos(e1766,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1767,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1766,e1767).

#pos(e1768,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1769,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1768,e1769).

#pos(e1770,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e1771,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e1770,e1771).

#pos(e1772,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1773,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1772,e1773).

#pos(e1774,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1775,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1774,e1775).

#pos(e1776,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1777,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1776,e1777).

#pos(e1778,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1779,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1778,e1779).

#pos(e1780,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1781,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1780,e1781).

#pos(e1782,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1783,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1782,e1783).

#pos(e1784,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e1785,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e1784,e1785).

#pos(e1786,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1787,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1786,e1787).

#pos(e1788,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1789,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1788,e1789).

#pos(e1790,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1791,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1790,e1791).

#pos(e1792,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e1793,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e1792,e1793).

#pos(e1794,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1795,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1794,e1795).

#pos(e1796,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1797,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1796,e1797).

#pos(e1798,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e1799,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e1798,e1799).

#pos(e1800,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1801,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1800,e1801).

#pos(e1802,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1803,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1802,e1803).

#pos(e1804,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e1805,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e1804,e1805).

#pos(e1806,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e1807,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e1806,e1807).

#pos(e1808,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e1809,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e1808,e1809).

#pos(e1810,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e1811,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e1810,e1811).

#pos(e1812,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1813,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1812,e1813).

#pos(e1814,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1815,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1814,e1815).

#pos(e1816,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1817,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1816,e1817).

#pos(e1818,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1819,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1818,e1819).

#pos(e1820,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1821,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1820,e1821).

#pos(e1822,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1823,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1822,e1823).

#pos(e1824,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1825,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1824,e1825).

#pos(e1826,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1827,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1826,e1827).

#pos(e1828,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1829,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1828,e1829).

#pos(e1830,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1831,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1830,e1831).

#pos(e1832,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1833,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1832,e1833).

#pos(e1834,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1835,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1834,e1835).

#pos(e1836,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1837,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1836,e1837).

#pos(e1838,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1839,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1838,e1839).

#pos(e1840,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1841,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1840,e1841).

#pos(e1842,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1843,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1842,e1843).

#pos(e1844,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1845,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1844,e1845).

#pos(e1846,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1847,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1846,e1847).

#pos(e1848,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e1849,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e1848,e1849).

#pos(e1850,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e1851,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e1850,e1851).

#pos(e1852,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e1853,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e1852,e1853).

#pos(e1854,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1855,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1854,e1855).

#pos(e1856,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1857,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1856,e1857).

#pos(e1858,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1859,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1858,e1859).

#pos(e1860,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1861,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1860,e1861).

#pos(e1862,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1863,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1862,e1863).

#pos(e1864,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1865,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1864,e1865).

#pos(e1866,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1867,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1866,e1867).

#pos(e1868,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1869,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1868,e1869).

#pos(e1870,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1871,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1870,e1871).

#pos(e1872,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1873,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1872,e1873).

#pos(e1874,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e1875,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e1874,e1875).

#pos(e1876,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1877,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1876,e1877).

#pos(e1878,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1879,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1878,e1879).

#pos(e1880,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e1881,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e1880,e1881).

#pos(e1882,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1883,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1882,e1883).

#pos(e1884,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1885,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1884,e1885).

#pos(e1886,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1887,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1886,e1887).

#pos(e1888,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1889,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1888,e1889).

#pos(e1890,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e1891,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e1890,e1891).

#pos(e1892,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e1893,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e1892,e1893).

#pos(e1894,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1895,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1894,e1895).

#pos(e1896,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1897,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1896,e1897).

#pos(e1898,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e1899,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e1898,e1899).

#pos(e1900,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1901,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1900,e1901).

#pos(e1902,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e1903,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e1902,e1903).

#pos(e1904,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1905,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1904,e1905).

#pos(e1906,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1907,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1906,e1907).

#pos(e1908,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1909,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1908,e1909).

#pos(e1910,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1911,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1910,e1911).

#pos(e1912,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1913,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1912,e1913).

#pos(e1914,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1915,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1914,e1915).

#pos(e1916,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1917,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1916,e1917).

#pos(e1918,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e1919,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e1918,e1919).

#pos(e1920,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e1921,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e1920,e1921).

#pos(e1922,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e1923,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e1922,e1923).

#pos(e1924,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1925,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1924,e1925).

#pos(e1926,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1927,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1926,e1927).

#pos(e1928,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1929,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1928,e1929).

#pos(e1930,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1931,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1930,e1931).

#pos(e1932,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1933,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1932,e1933).

#pos(e1934,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1935,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1934,e1935).

#pos(e1936,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1937,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1936,e1937).

#pos(e1938,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1939,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1938,e1939).

#pos(e1940,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1941,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1940,e1941).

#pos(e1942,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e1943,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e1942,e1943).

#pos(e1944,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1945,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1944,e1945).

#pos(e1946,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1947,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1946,e1947).

#pos(e1948,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e1949,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e1948,e1949).

#pos(e1950,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1951,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1950,e1951).

#pos(e1952,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e1953,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e1952,e1953).

#pos(e1954,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e1955,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e1954,e1955).

#pos(e1956,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1957,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1956,e1957).

#pos(e1958,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e1959,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e1958,e1959).

#pos(e1960,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e1961,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e1960,e1961).

#pos(e1962,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1963,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1962,e1963).

#pos(e1964,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e1965,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e1964,e1965).

#pos(e1966,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e1967,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e1966,e1967).

#pos(e1968,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1969,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1968,e1969).

#pos(e1970,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e1971,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e1970,e1971).

#pos(e1972,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1973,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1972,e1973).

#pos(e1974,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1975,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1974,e1975).

#pos(e1976,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e1977,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e1976,e1977).

#pos(e1978,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e1979,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e1978,e1979).

#pos(e1980,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1981,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1980,e1981).

#pos(e1982,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e1983,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e1982,e1983).

#pos(e1984,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e1985,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e1984,e1985).

#pos(e1986,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1987,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1986,e1987).

#pos(e1988,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e1989,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e1988,e1989).

#pos(e1990,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1991,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1990,e1991).

#pos(e1992,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e1993,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e1992,e1993).

#pos(e1994,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1995,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1994,e1995).

#pos(e1996,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1997,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1996,e1997).

#pos(e1998,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e1999,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e1998,e1999).

#pos(e2000,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e2001,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e2000,e2001).

#pos(e2002,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2003,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2002,e2003).

#pos(e2004,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2005,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2004,e2005).

#pos(e2006,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2007,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2006,e2007).

#pos(e2008,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2009,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2008,e2009).

#pos(e2010,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2011,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2010,e2011).

#pos(e2012,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2013,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2012,e2013).

#pos(e2014,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2015,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2014,e2015).

#pos(e2016,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2017,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2016,e2017).

#pos(e2018,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2019,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2018,e2019).

#pos(e2020,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2021,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2020,e2021).

#pos(e2022,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2023,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2022,e2023).

#pos(e2024,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2025,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2024,e2025).

#pos(e2026,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2027,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2026,e2027).

#pos(e2028,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2029,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2028,e2029).

#pos(e2030,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2031,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2030,e2031).

#pos(e2032,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2033,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2032,e2033).

#pos(e2034,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2035,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2034,e2035).

#pos(e2036,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2037,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2036,e2037).

#pos(e2038,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2039,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2038,e2039).

#pos(e2040,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2041,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2040,e2041).

#pos(e2042,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2043,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2042,e2043).

#pos(e2044,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2045,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2044,e2045).

#pos(e2046,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2047,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2046,e2047).

#pos(e2048,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2049,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2048,e2049).

#pos(e2050,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2051,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2050,e2051).

#pos(e2052,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2053,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2052,e2053).

#pos(e2054,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2055,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2054,e2055).

#pos(e2056,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2057,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2056,e2057).

#pos(e2058,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2059,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2058,e2059).

#pos(e2060,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2061,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2060,e2061).

#pos(e2062,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2063,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2062,e2063).

#pos(e2064,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2065,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2064,e2065).

#pos(e2066,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2067,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2066,e2067).

#pos(e2068,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2069,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2068,e2069).

#pos(e2070,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2071,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2070,e2071).

#pos(e2072,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2073,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2072,e2073).

#pos(e2074,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2075,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2074,e2075).

#pos(e2076,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2077,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2076,e2077).

#pos(e2078,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2079,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2078,e2079).

#pos(e2080,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2081,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2080,e2081).

#pos(e2082,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2083,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2082,e2083).

#pos(e2084,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2085,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2084,e2085).

#pos(e2086,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2087,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2086,e2087).

#pos(e2088,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2089,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2088,e2089).

#pos(e2090,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2091,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2090,e2091).

#pos(e2092,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2093,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2092,e2093).

#pos(e2094,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2095,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2094,e2095).

#pos(e2096,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2097,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2096,e2097).

#pos(e2098,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2099,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2098,e2099).

#pos(e2100,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2101,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2100,e2101).

#pos(e2102,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2103,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2102,e2103).

#pos(e2104,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2105,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2104,e2105).

#pos(e2106,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2107,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2106,e2107).

#pos(e2108,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2109,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2108,e2109).

#pos(e2110,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2111,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2110,e2111).

#pos(e2112,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2113,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2112,e2113).

#pos(e2114,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2115,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2114,e2115).

#pos(e2116,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2117,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2116,e2117).

#pos(e2118,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2119,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2118,e2119).

#pos(e2120,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2121,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2120,e2121).

#pos(e2122,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2123,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2122,e2123).

#pos(e2124,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2125,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2124,e2125).

#pos(e2126,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2127,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2126,e2127).

#pos(e2128,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2129,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2128,e2129).

#pos(e2130,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2131,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2130,e2131).

#pos(e2132,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2133,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2132,e2133).

#pos(e2134,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2135,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2134,e2135).

#pos(e2136,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2137,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2136,e2137).

#pos(e2138,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2139,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2138,e2139).

#pos(e2140,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2141,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2140,e2141).

#pos(e2142,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2143,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2142,e2143).

#pos(e2144,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2145,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2144,e2145).

#pos(e2146,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2147,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2146,e2147).

#pos(e2148,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2149,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2148,e2149).

#pos(e2150,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2151,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2150,e2151).

#pos(e2152,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2153,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2152,e2153).

#pos(e2154,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2155,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2154,e2155).

#pos(e2156,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2157,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2156,e2157).

#pos(e2158,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2159,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2158,e2159).

#pos(e2160,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2161,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2160,e2161).

#pos(e2162,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2163,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2162,e2163).

#pos(e2164,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2165,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2164,e2165).

#pos(e2166,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e2167,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e2166,e2167).

#pos(e2168,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2169,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2168,e2169).

#pos(e2170,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2171,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2170,e2171).

#pos(e2172,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2173,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2172,e2173).

#pos(e2174,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2175,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2174,e2175).

#pos(e2176,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2177,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2176,e2177).

#pos(e2178,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e2179,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e2178,e2179).

#pos(e2180,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2181,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2180,e2181).

#pos(e2182,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2183,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2182,e2183).

#pos(e2184,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2185,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2184,e2185).

#pos(e2186,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2187,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2186,e2187).

#pos(e2188,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2189,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2188,e2189).

#pos(e2190,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2191,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2190,e2191).

#pos(e2192,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2193,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2192,e2193).

#pos(e2194,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2195,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2194,e2195).

#pos(e2196,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2197,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2196,e2197).

#pos(e2198,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2199,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2198,e2199).

#pos(e2200,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2201,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2200,e2201).

#pos(e2202,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2203,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2202,e2203).

#pos(e2204,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2205,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2204,e2205).

#pos(e2206,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2207,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2206,e2207).

#pos(e2208,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2209,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2208,e2209).

#pos(e2210,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2211,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2210,e2211).

#pos(e2212,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2213,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2212,e2213).

#pos(e2214,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2215,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2214,e2215).

#pos(e2216,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2217,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2216,e2217).

#pos(e2218,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2219,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2218,e2219).

#pos(e2220,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2221,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2220,e2221).

#pos(e2222,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2223,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2222,e2223).

#pos(e2224,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2225,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2224,e2225).

#pos(e2226,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2227,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2226,e2227).

#pos(e2228,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2229,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2228,e2229).

#pos(e2230,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2231,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2230,e2231).

#pos(e2232,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2233,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2232,e2233).

#pos(e2234,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2235,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2234,e2235).

#pos(e2236,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2237,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2236,e2237).

#pos(e2238,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e2239,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e2238,e2239).

#pos(e2240,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2241,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2240,e2241).

#pos(e2242,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2243,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2242,e2243).

#pos(e2244,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2245,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2244,e2245).

#pos(e2246,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2247,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2246,e2247).

#pos(e2248,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2249,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2248,e2249).

#pos(e2250,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2251,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2250,e2251).

#pos(e2252,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2253,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2252,e2253).

#pos(e2254,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2255,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2254,e2255).

#pos(e2256,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2257,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2256,e2257).

#pos(e2258,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2259,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2258,e2259).

#pos(e2260,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2261,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2260,e2261).

#pos(e2262,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2263,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2262,e2263).

#pos(e2264,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2265,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2264,e2265).

#pos(e2266,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2267,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2266,e2267).

#pos(e2268,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2269,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2268,e2269).

#pos(e2270,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2271,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2270,e2271).

#pos(e2272,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2273,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2272,e2273).

#pos(e2274,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2275,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2274,e2275).

#pos(e2276,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2277,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2276,e2277).

#pos(e2278,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2279,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2278,e2279).

#pos(e2280,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,4)). 
}).
#pos(e2281,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,4)). 
}).
#brave_ordering(e2280,e2281).

#pos(e2282,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e2283,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e2282,e2283).

#pos(e2284,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2285,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2284,e2285).

#pos(e2286,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2287,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2286,e2287).

#pos(e2288,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e2289,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e2288,e2289).

#pos(e2290,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e2291,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e2290,e2291).

#pos(e2292,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e2293,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e2292,e2293).

#pos(e2294,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2295,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2294,e2295).

#pos(e2296,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2297,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2296,e2297).

#pos(e2298,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2299,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2298,e2299).

#pos(e2300,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e2301,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e2300,e2301).

#pos(e2302,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e2303,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e2302,e2303).

#pos(e2304,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2305,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2304,e2305).

#pos(e2306,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2307,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2306,e2307).

#pos(e2308,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2309,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2308,e2309).

#pos(e2310,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e2311,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e2310,e2311).

#pos(e2312,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e2313,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e2312,e2313).

#pos(e2314,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e2315,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e2314,e2315).

#pos(e2316,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2317,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2316,e2317).

#pos(e2318,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2319,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2318,e2319).

#pos(e2320,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2321,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2320,e2321).

#pos(e2322,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2323,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2322,e2323).

#pos(e2324,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2325,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2324,e2325).

#pos(e2326,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,4)). true(has(3,0)). 
}).
#pos(e2327,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,4)). true(has(3,0)). 
}).
#brave_ordering(e2326,e2327).

#pos(e2328,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e2329,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e2328,e2329).

#pos(e2330,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2331,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2330,e2331).

#pos(e2332,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2333,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2332,e2333).

#pos(e2334,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,6)). 
}).
#pos(e2335,{ does(b,remove(1,6)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,6)). 
}).
#brave_ordering(e2334,e2335).

#pos(e2336,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2337,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2336,e2337).

#pos(e2338,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2339,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2338,e2339).

#pos(e2340,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2341,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2340,e2341).

#pos(e2342,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2343,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2342,e2343).

#pos(e2344,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2345,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2344,e2345).

#pos(e2346,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2347,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2346,e2347).

#pos(e2348,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2349,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2348,e2349).

#pos(e2350,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2351,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2350,e2351).

#pos(e2352,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2353,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2352,e2353).

#pos(e2354,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2355,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2354,e2355).

#pos(e2356,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2357,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2356,e2357).

#pos(e2358,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2359,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2358,e2359).

#pos(e2360,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2361,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2360,e2361).

#pos(e2362,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2363,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2362,e2363).

#pos(e2364,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2365,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2364,e2365).

#pos(e2366,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2367,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2366,e2367).

#pos(e2368,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2369,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2368,e2369).

#pos(e2370,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2371,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2370,e2371).

#pos(e2372,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2373,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2372,e2373).

#pos(e2374,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2375,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2374,e2375).

#pos(e2376,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2377,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2376,e2377).

#pos(e2378,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2379,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2378,e2379).

#pos(e2380,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2381,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2380,e2381).

#pos(e2382,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2383,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2382,e2383).

#pos(e2384,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2385,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2384,e2385).

#pos(e2386,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2387,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2386,e2387).

#pos(e2388,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2389,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2388,e2389).

#pos(e2390,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2391,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2390,e2391).

#pos(e2392,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2393,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2392,e2393).

#pos(e2394,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2395,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2394,e2395).

#pos(e2396,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2397,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2396,e2397).

#pos(e2398,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2399,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2398,e2399).

#pos(e2400,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2401,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2400,e2401).

#pos(e2402,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2403,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2402,e2403).

#pos(e2404,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2405,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2404,e2405).

#pos(e2406,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2407,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2406,e2407).

#pos(e2408,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2409,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2408,e2409).

#pos(e2410,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2411,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2410,e2411).

#pos(e2412,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2413,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2412,e2413).

#pos(e2414,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2415,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2414,e2415).

#pos(e2416,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2417,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2416,e2417).

#pos(e2418,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2419,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2418,e2419).

#pos(e2420,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2421,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2420,e2421).

#pos(e2422,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2423,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2422,e2423).

#pos(e2424,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2425,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2424,e2425).

#pos(e2426,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2427,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2426,e2427).

#pos(e2428,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2429,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2428,e2429).

#pos(e2430,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2431,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2430,e2431).

#pos(e2432,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2433,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2432,e2433).

#pos(e2434,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2435,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2434,e2435).

#pos(e2436,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2437,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2436,e2437).

#pos(e2438,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2439,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2438,e2439).

#pos(e2440,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2441,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2440,e2441).

#pos(e2442,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2443,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2442,e2443).

#pos(e2444,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2445,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2444,e2445).

#pos(e2446,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2447,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2446,e2447).

#pos(e2448,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2449,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2448,e2449).

#pos(e2450,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2451,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2450,e2451).

#pos(e2452,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2453,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2452,e2453).

#pos(e2454,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2455,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2454,e2455).

#pos(e2456,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2457,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2456,e2457).

#pos(e2458,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2459,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2458,e2459).

#pos(e2460,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2461,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2460,e2461).

#pos(e2462,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e2463,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e2462,e2463).

#pos(e2464,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2465,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2464,e2465).

#pos(e2466,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2467,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2466,e2467).

#pos(e2468,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2469,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2468,e2469).

#pos(e2470,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2471,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2470,e2471).

#pos(e2472,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2473,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2472,e2473).

#pos(e2474,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2475,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2474,e2475).

#pos(e2476,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2477,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2476,e2477).

#pos(e2478,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2479,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2478,e2479).

#pos(e2480,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2481,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2480,e2481).

#pos(e2482,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2483,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2482,e2483).

#pos(e2484,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2485,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2484,e2485).

#pos(e2486,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2487,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2486,e2487).

#pos(e2488,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e2489,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e2488,e2489).

#pos(e2490,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e2491,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e2490,e2491).

#pos(e2492,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e2493,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e2492,e2493).

#pos(e2494,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e2495,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e2494,e2495).

#pos(e2496,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e2497,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e2496,e2497).

#pos(e2498,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e2499,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e2498,e2499).

#pos(e2500,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2501,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2500,e2501).

#pos(e2502,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2503,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2502,e2503).

#pos(e2504,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2505,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2504,e2505).

#pos(e2506,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2507,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2506,e2507).

#pos(e2508,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2509,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2508,e2509).

#pos(e2510,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2511,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2510,e2511).

#pos(e2512,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2513,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2512,e2513).

#pos(e2514,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2515,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2514,e2515).

#pos(e2516,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2517,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2516,e2517).

#pos(e2518,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2519,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2518,e2519).

#pos(e2520,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e2521,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e2520,e2521).

#pos(e2522,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2523,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2522,e2523).

#pos(e2524,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2525,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2524,e2525).

#pos(e2526,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2527,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2526,e2527).

#pos(e2528,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2529,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2528,e2529).

#pos(e2530,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2531,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2530,e2531).

#pos(e2532,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2533,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2532,e2533).

#pos(e2534,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2535,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2534,e2535).

#pos(e2536,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2537,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2536,e2537).

#pos(e2538,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e2539,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e2538,e2539).

#pos(e2540,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2541,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2540,e2541).

#pos(e2542,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2543,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2542,e2543).

#pos(e2544,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2545,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2544,e2545).

#pos(e2546,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2547,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2546,e2547).

#pos(e2548,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e2549,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e2548,e2549).

#pos(e2550,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2551,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2550,e2551).

#pos(e2552,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2553,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2552,e2553).

#pos(e2554,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2555,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2554,e2555).

#pos(e2556,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e2557,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e2556,e2557).

#pos(e2558,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e2559,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e2558,e2559).

#pos(e2560,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2561,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2560,e2561).

#pos(e2562,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2563,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2562,e2563).

#pos(e2564,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2565,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2564,e2565).

#pos(e2566,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2567,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2566,e2567).

#pos(e2568,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2569,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2568,e2569).

#pos(e2570,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2571,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2570,e2571).

#pos(e2572,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2573,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2572,e2573).

#pos(e2574,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2575,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2574,e2575).

#pos(e2576,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2577,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2576,e2577).

#pos(e2578,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2579,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2578,e2579).

#pos(e2580,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2581,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2580,e2581).

#pos(e2582,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2583,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2582,e2583).

#pos(e2584,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2585,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2584,e2585).

#pos(e2586,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2587,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2586,e2587).

#pos(e2588,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2589,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2588,e2589).

#pos(e2590,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2591,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2590,e2591).

#pos(e2592,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2593,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2592,e2593).

#pos(e2594,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2595,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2594,e2595).

#pos(e2596,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2597,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2596,e2597).

#pos(e2598,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e2599,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e2598,e2599).

#pos(e2600,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e2601,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e2600,e2601).

#pos(e2602,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2603,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2602,e2603).

#pos(e2604,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2605,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2604,e2605).

#pos(e2606,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2607,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2606,e2607).

#pos(e2608,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e2609,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e2608,e2609).

#pos(e2610,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2611,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2610,e2611).

#pos(e2612,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2613,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2612,e2613).

#pos(e2614,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2615,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2614,e2615).

#pos(e2616,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e2617,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e2616,e2617).

#pos(e2618,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2619,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2618,e2619).

#pos(e2620,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2621,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2620,e2621).

#pos(e2622,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2623,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2622,e2623).

#pos(e2624,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e2625,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e2624,e2625).

#pos(e2626,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2627,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2626,e2627).

#pos(e2628,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2629,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2628,e2629).

#pos(e2630,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2631,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2630,e2631).

#pos(e2632,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2633,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2632,e2633).

#pos(e2634,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2635,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2634,e2635).

#pos(e2636,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2637,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2636,e2637).

#pos(e2638,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2639,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2638,e2639).

#pos(e2640,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2641,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2640,e2641).

#pos(e2642,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2643,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2642,e2643).

#pos(e2644,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2645,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2644,e2645).

#pos(e2646,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2647,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2646,e2647).

#pos(e2648,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2649,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2648,e2649).

#pos(e2650,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2651,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2650,e2651).

#pos(e2652,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2653,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2652,e2653).

#pos(e2654,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2655,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2654,e2655).

#pos(e2656,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2657,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2656,e2657).

#pos(e2658,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2659,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2658,e2659).

#pos(e2660,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2661,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2660,e2661).

#pos(e2662,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2663,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2662,e2663).

#pos(e2664,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2665,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2664,e2665).

#pos(e2666,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2667,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2666,e2667).

#pos(e2668,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2669,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2668,e2669).

#pos(e2670,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2671,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2670,e2671).

#pos(e2672,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2673,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2672,e2673).

#pos(e2674,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2675,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2674,e2675).

#pos(e2676,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2677,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2676,e2677).

#pos(e2678,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2679,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2678,e2679).

#pos(e2680,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e2681,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e2680,e2681).

#pos(e2682,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2683,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2682,e2683).

#pos(e2684,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2685,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2684,e2685).

#pos(e2686,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2687,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2686,e2687).

#pos(e2688,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2689,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2688,e2689).

#pos(e2690,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2691,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2690,e2691).

#pos(e2692,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2693,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2692,e2693).

#pos(e2694,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2695,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2694,e2695).

#pos(e2696,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2697,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2696,e2697).

#pos(e2698,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e2699,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e2698,e2699).

#pos(e2700,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2701,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2700,e2701).

#pos(e2702,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2703,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2702,e2703).

#pos(e2704,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2705,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2704,e2705).

#pos(e2706,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2707,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2706,e2707).

#pos(e2708,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2709,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2708,e2709).

#pos(e2710,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2711,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2710,e2711).

#pos(e2712,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2713,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2712,e2713).

#pos(e2714,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2715,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2714,e2715).

#pos(e2716,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2717,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2716,e2717).

#pos(e2718,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2719,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2718,e2719).

#pos(e2720,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2721,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2720,e2721).

#pos(e2722,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2723,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2722,e2723).

#pos(e2724,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2725,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2724,e2725).

#pos(e2726,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2727,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2726,e2727).

#pos(e2728,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e2729,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e2728,e2729).

#pos(e2730,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2731,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2730,e2731).

#pos(e2732,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2733,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2732,e2733).

#pos(e2734,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2735,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2734,e2735).

#pos(e2736,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2737,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2736,e2737).

#pos(e2738,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2739,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2738,e2739).

#pos(e2740,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e2741,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e2740,e2741).

#pos(e2742,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2743,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2742,e2743).

#pos(e2744,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2745,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2744,e2745).

#pos(e2746,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e2747,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e2746,e2747).

#pos(e2748,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2749,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2748,e2749).

#pos(e2750,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e2751,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e2750,e2751).

#pos(e2752,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e2753,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e2752,e2753).

#pos(e2754,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2755,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2754,e2755).

#pos(e2756,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2757,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2756,e2757).

#pos(e2758,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2759,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2758,e2759).

#pos(e2760,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2761,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2760,e2761).

#pos(e2762,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2763,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2762,e2763).

#pos(e2764,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2765,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2764,e2765).

#pos(e2766,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2767,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2766,e2767).

#pos(e2768,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2769,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2768,e2769).

#pos(e2770,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2771,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2770,e2771).

#pos(e2772,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2773,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2772,e2773).

#pos(e2774,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2775,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2774,e2775).

#pos(e2776,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2777,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2776,e2777).

#pos(e2778,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2779,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2778,e2779).

#pos(e2780,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2781,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2780,e2781).

#pos(e2782,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2783,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2782,e2783).

#pos(e2784,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2785,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2784,e2785).

#pos(e2786,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2787,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2786,e2787).

#pos(e2788,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2789,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2788,e2789).

#pos(e2790,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2791,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2790,e2791).

#pos(e2792,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2793,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2792,e2793).

#pos(e2794,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2795,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2794,e2795).

#pos(e2796,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2797,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2796,e2797).

#pos(e2798,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e2799,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e2798,e2799).

#pos(e2800,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2801,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2800,e2801).

#pos(e2802,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2803,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2802,e2803).

#pos(e2804,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2805,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2804,e2805).

#pos(e2806,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2807,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2806,e2807).

#pos(e2808,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e2809,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e2808,e2809).

#pos(e2810,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2811,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2810,e2811).

#pos(e2812,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e2813,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e2812,e2813).

#pos(e2814,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2815,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2814,e2815).

#pos(e2816,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2817,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2816,e2817).

#pos(e2818,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2819,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2818,e2819).

#pos(e2820,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2821,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2820,e2821).

#pos(e2822,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2823,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2822,e2823).

#pos(e2824,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2825,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2824,e2825).

#pos(e2826,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2827,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2826,e2827).

#pos(e2828,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2829,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2828,e2829).

#pos(e2830,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2831,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2830,e2831).

#pos(e2832,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2833,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2832,e2833).

#pos(e2834,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2835,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2834,e2835).

#pos(e2836,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2837,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2836,e2837).

#pos(e2838,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2839,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2838,e2839).

#pos(e2840,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2841,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2840,e2841).

#pos(e2842,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2843,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2842,e2843).

#pos(e2844,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e2845,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e2844,e2845).

#pos(e2846,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2847,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2846,e2847).

#pos(e2848,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2849,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2848,e2849).

#pos(e2850,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e2851,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e2850,e2851).

#pos(e2852,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e2853,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e2852,e2853).

#pos(e2854,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e2855,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e2854,e2855).

#pos(e2856,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2857,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2856,e2857).

#pos(e2858,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e2859,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e2858,e2859).

#pos(e2860,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2861,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2860,e2861).

#pos(e2862,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2863,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2862,e2863).

#pos(e2864,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2865,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2864,e2865).

#pos(e2866,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2867,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2866,e2867).

#pos(e2868,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2869,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2868,e2869).

#pos(e2870,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2871,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2870,e2871).

#pos(e2872,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2873,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2872,e2873).

#pos(e2874,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2875,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2874,e2875).

#pos(e2876,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2877,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2876,e2877).

#pos(e2878,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2879,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2878,e2879).

#pos(e2880,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2881,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2880,e2881).

#pos(e2882,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2883,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2882,e2883).

#pos(e2884,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2885,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2884,e2885).

#pos(e2886,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2887,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2886,e2887).

#pos(e2888,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2889,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2888,e2889).

#pos(e2890,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2891,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2890,e2891).

#pos(e2892,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e2893,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e2892,e2893).

#pos(e2894,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e2895,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e2894,e2895).

#pos(e2896,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2897,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2896,e2897).

#pos(e2898,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e2899,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e2898,e2899).

#pos(e2900,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2901,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2900,e2901).

#pos(e2902,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e2903,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e2902,e2903).

#pos(e2904,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e2905,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e2904,e2905).

#pos(e2906,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e2907,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e2906,e2907).

#pos(e2908,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e2909,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e2908,e2909).

#pos(e2910,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e2911,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e2910,e2911).

#pos(e2912,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e2913,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e2912,e2913).

#pos(e2914,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e2915,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e2914,e2915).

#pos(e2916,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e2917,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e2916,e2917).

#pos(e2918,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2919,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2918,e2919).

#pos(e2920,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2921,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2920,e2921).

#pos(e2922,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2923,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2922,e2923).

#pos(e2924,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e2925,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e2924,e2925).

#pos(e2926,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2927,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2926,e2927).

#pos(e2928,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2929,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2928,e2929).

#pos(e2930,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2931,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2930,e2931).

#pos(e2932,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2933,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2932,e2933).

#pos(e2934,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2935,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2934,e2935).

#pos(e2936,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2937,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2936,e2937).

#pos(e2938,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2939,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2938,e2939).

#pos(e2940,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e2941,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e2940,e2941).

#pos(e2942,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2943,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2942,e2943).

#pos(e2944,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2945,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2944,e2945).

#pos(e2946,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2947,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2946,e2947).

#pos(e2948,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e2949,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e2948,e2949).

#pos(e2950,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2951,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2950,e2951).

#pos(e2952,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2953,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2952,e2953).

#pos(e2954,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2955,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2954,e2955).

#pos(e2956,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2957,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2956,e2957).

#pos(e2958,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2959,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2958,e2959).

#pos(e2960,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e2961,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e2960,e2961).

#pos(e2962,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e2963,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e2962,e2963).

#pos(e2964,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2965,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2964,e2965).

#pos(e2966,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2967,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2966,e2967).

#pos(e2968,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e2969,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e2968,e2969).

#pos(e2970,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2971,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2970,e2971).

#pos(e2972,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2973,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2972,e2973).

#pos(e2974,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2975,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2974,e2975).

#pos(e2976,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e2977,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e2976,e2977).

#pos(e2978,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e2979,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e2978,e2979).

#pos(e2980,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e2981,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e2980,e2981).

#pos(e2982,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e2983,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e2982,e2983).

#pos(e2984,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2985,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2984,e2985).

#pos(e2986,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e2987,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e2986,e2987).

#pos(e2988,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e2989,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e2988,e2989).

#pos(e2990,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e2991,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e2990,e2991).

#pos(e2992,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e2993,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e2992,e2993).

#pos(e2994,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2995,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2994,e2995).

#pos(e2996,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e2997,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e2996,e2997).

#pos(e2998,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e2999,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e2998,e2999).

#pos(e3000,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3001,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3000,e3001).

#pos(e3002,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3003,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3002,e3003).

#pos(e3004,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3005,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3004,e3005).

#pos(e3006,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3007,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3006,e3007).

#pos(e3008,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3009,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3008,e3009).

#pos(e3010,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3011,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3010,e3011).

#pos(e3012,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3013,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3012,e3013).

#pos(e3014,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3015,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3014,e3015).

#pos(e3016,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3017,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3016,e3017).

#pos(e3018,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3019,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3018,e3019).

#pos(e3020,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3021,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3020,e3021).

#pos(e3022,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3023,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3022,e3023).

#pos(e3024,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3025,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3024,e3025).

#pos(e3026,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3027,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3026,e3027).

#pos(e3028,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3029,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3028,e3029).

#pos(e3030,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3031,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3030,e3031).

#pos(e3032,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3033,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3032,e3033).

#pos(e3034,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3035,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3034,e3035).

#pos(e3036,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3037,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3036,e3037).

#pos(e3038,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3039,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3038,e3039).

#pos(e3040,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3041,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3040,e3041).

#pos(e3042,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e3043,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e3042,e3043).

#pos(e3044,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e3045,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e3044,e3045).

#pos(e3046,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e3047,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e3046,e3047).

#pos(e3048,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3049,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3048,e3049).

#pos(e3050,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3051,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3050,e3051).

#pos(e3052,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3053,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3052,e3053).

#pos(e3054,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3055,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3054,e3055).

#pos(e3056,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e3057,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e3056,e3057).

#pos(e3058,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e3059,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e3058,e3059).

#pos(e3060,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3061,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3060,e3061).

#pos(e3062,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3063,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3062,e3063).

#pos(e3064,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3065,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3064,e3065).

#pos(e3066,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3067,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3066,e3067).

#pos(e3068,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3069,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3068,e3069).

#pos(e3070,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3071,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3070,e3071).

#pos(e3072,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3073,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3072,e3073).

#pos(e3074,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3075,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3074,e3075).

#pos(e3076,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3077,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3076,e3077).

#pos(e3078,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3079,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3078,e3079).

#pos(e3080,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3081,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3080,e3081).

#pos(e3082,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3083,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3082,e3083).

#pos(e3084,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3085,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3084,e3085).

#pos(e3086,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3087,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3086,e3087).

#pos(e3088,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3089,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3088,e3089).

#pos(e3090,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3091,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3090,e3091).

#pos(e3092,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3093,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3092,e3093).

#pos(e3094,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3095,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3094,e3095).

#pos(e3096,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3097,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3096,e3097).

#pos(e3098,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3099,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3098,e3099).

#pos(e3100,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3101,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3100,e3101).

#pos(e3102,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3103,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3102,e3103).

#pos(e3104,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3105,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3104,e3105).

#pos(e3106,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3107,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3106,e3107).

#pos(e3108,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3109,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3108,e3109).

#pos(e3110,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e3111,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e3110,e3111).

#pos(e3112,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3113,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3112,e3113).

#pos(e3114,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3115,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3114,e3115).

#pos(e3116,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3117,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3116,e3117).

#pos(e3118,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3119,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3118,e3119).

#pos(e3120,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3121,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3120,e3121).

#pos(e3122,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e3123,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e3122,e3123).

#pos(e3124,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e3125,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e3124,e3125).

#pos(e3126,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e3127,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e3126,e3127).

#pos(e3128,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3129,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3128,e3129).

#pos(e3130,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3131,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3130,e3131).

#pos(e3132,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3133,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3132,e3133).

#pos(e3134,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3135,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3134,e3135).

#pos(e3136,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3137,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3136,e3137).

#pos(e3138,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3139,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3138,e3139).

#pos(e3140,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3141,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3140,e3141).

#pos(e3142,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3143,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3142,e3143).

#pos(e3144,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3145,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3144,e3145).

#pos(e3146,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3147,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3146,e3147).

#pos(e3148,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3149,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3148,e3149).

#pos(e3150,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3151,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3150,e3151).

#pos(e3152,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3153,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3152,e3153).

#pos(e3154,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3155,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3154,e3155).

#pos(e3156,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e3157,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e3156,e3157).

#pos(e3158,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e3159,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e3158,e3159).

#pos(e3160,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3161,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3160,e3161).

#pos(e3162,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3163,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3162,e3163).

#pos(e3164,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3165,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3164,e3165).

#pos(e3166,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3167,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3166,e3167).

#pos(e3168,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3169,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3168,e3169).

#pos(e3170,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3171,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3170,e3171).

#pos(e3172,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3173,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3172,e3173).

#pos(e3174,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3175,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3174,e3175).

#pos(e3176,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3177,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3176,e3177).

#pos(e3178,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3179,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3178,e3179).

#pos(e3180,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3181,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3180,e3181).

#pos(e3182,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3183,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3182,e3183).

#pos(e3184,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3185,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3184,e3185).

#pos(e3186,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3187,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3186,e3187).

#pos(e3188,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e3189,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e3188,e3189).

#pos(e3190,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e3191,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e3190,e3191).

#pos(e3192,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e3193,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e3192,e3193).

#pos(e3194,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#pos(e3195,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,4)). true(has(2,0)). 
}).
#brave_ordering(e3194,e3195).

#pos(e3196,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3197,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3196,e3197).

#pos(e3198,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3199,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3198,e3199).

#pos(e3200,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3201,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3200,e3201).

#pos(e3202,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3203,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3202,e3203).

#pos(e3204,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3205,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3204,e3205).

#pos(e3206,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3207,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3206,e3207).

#pos(e3208,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3209,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3208,e3209).

#pos(e3210,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e3211,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e3210,e3211).

#pos(e3212,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#pos(e3213,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,1)). true(has(3,0)). 
}).
#brave_ordering(e3212,e3213).

#pos(e3214,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3215,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3214,e3215).

#pos(e3216,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3217,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3216,e3217).

#pos(e3218,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3219,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3218,e3219).

#pos(e3220,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3221,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3220,e3221).

#pos(e3222,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3223,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3222,e3223).

#pos(e3224,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e3225,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e3224,e3225).

#pos(e3226,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3227,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3226,e3227).

#pos(e3228,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3229,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3228,e3229).

#pos(e3230,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3231,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3230,e3231).

#pos(e3232,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3233,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3232,e3233).

#pos(e3234,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3235,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3234,e3235).

#pos(e3236,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3237,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3236,e3237).

#pos(e3238,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3239,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3238,e3239).

#pos(e3240,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3241,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3240,e3241).

#pos(e3242,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3243,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3242,e3243).

#pos(e3244,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3245,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3244,e3245).

#pos(e3246,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e3247,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e3246,e3247).

#pos(e3248,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e3249,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e3248,e3249).

#pos(e3250,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#pos(e3251,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,4)). 
}).
#brave_ordering(e3250,e3251).

#pos(e3252,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3253,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3252,e3253).

#pos(e3254,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3255,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3254,e3255).

#pos(e3256,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3257,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3256,e3257).

#pos(e3258,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3259,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3258,e3259).

#pos(e3260,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3261,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3260,e3261).

#pos(e3262,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3263,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3262,e3263).

#pos(e3264,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3265,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3264,e3265).

#pos(e3266,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3267,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3266,e3267).

#pos(e3268,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3269,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3268,e3269).

#pos(e3270,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3271,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3270,e3271).

#pos(e3272,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3273,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3272,e3273).

#pos(e3274,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3275,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3274,e3275).

#pos(e3276,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3277,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3276,e3277).

#pos(e3278,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3279,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3278,e3279).

#pos(e3280,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e3281,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e3280,e3281).

#pos(e3282,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e3283,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e3282,e3283).

#pos(e3284,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e3285,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e3284,e3285).

#pos(e3286,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e3287,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e3286,e3287).

#pos(e3288,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e3289,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e3288,e3289).

#pos(e3290,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3291,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3290,e3291).

#pos(e3292,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3293,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3292,e3293).

#pos(e3294,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3295,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3294,e3295).

#pos(e3296,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3297,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3296,e3297).

#pos(e3298,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3299,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3298,e3299).

#pos(e3300,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3301,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3300,e3301).

#pos(e3302,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3303,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3302,e3303).

#pos(e3304,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3305,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3304,e3305).

#pos(e3306,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3307,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3306,e3307).

#pos(e3308,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3309,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3308,e3309).

#pos(e3310,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#pos(e3311,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,4)). 
}).
#brave_ordering(e3310,e3311).

#pos(e3312,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3313,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3312,e3313).

#pos(e3314,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3315,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3314,e3315).

#pos(e3316,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3317,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3316,e3317).

#pos(e3318,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3319,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3318,e3319).

#pos(e3320,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3321,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3320,e3321).

#pos(e3322,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3323,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3322,e3323).

#pos(e3324,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3325,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3324,e3325).

#pos(e3326,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3327,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3326,e3327).

#pos(e3328,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3329,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3328,e3329).

#pos(e3330,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e3331,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,1)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e3330,e3331).

#pos(e3332,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e3333,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e3332,e3333).

#pos(e3334,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e3335,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e3334,e3335).

#pos(e3336,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e3337,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e3336,e3337).

#pos(e3338,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e3339,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e3338,e3339).

#pos(e3340,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#pos(e3341,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,5)). true(has(2,1)). 
}).
#brave_ordering(e3340,e3341).

#pos(e3342,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3343,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3342,e3343).

#pos(e3344,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3345,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3344,e3345).

#pos(e3346,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3347,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3346,e3347).

#pos(e3348,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3349,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3348,e3349).

#pos(e3350,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e3351,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e3350,e3351).

#pos(e3352,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e3353,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e3352,e3353).

#pos(e3354,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e3355,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e3354,e3355).

#pos(e3356,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3357,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3356,e3357).

#pos(e3358,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3359,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3358,e3359).

#pos(e3360,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3361,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3360,e3361).

#pos(e3362,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3363,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3362,e3363).

#pos(e3364,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3365,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3364,e3365).

#pos(e3366,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3367,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3366,e3367).

#pos(e3368,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3369,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3368,e3369).

#pos(e3370,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3371,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3370,e3371).

#pos(e3372,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3373,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3372,e3373).

#pos(e3374,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3375,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3374,e3375).

#pos(e3376,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3377,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3376,e3377).

#pos(e3378,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3379,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3378,e3379).

#pos(e3380,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3381,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3380,e3381).

#pos(e3382,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#pos(e3383,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,4)). 
}).
#brave_ordering(e3382,e3383).

#pos(e3384,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3385,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3384,e3385).

#pos(e3386,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e3387,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e3386,e3387).

#pos(e3388,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e3389,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e3388,e3389).

#pos(e3390,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e3391,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e3390,e3391).

#pos(e3392,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e3393,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e3392,e3393).

#pos(e3394,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e3395,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e3394,e3395).

#pos(e3396,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e3397,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e3396,e3397).

#pos(e3398,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3399,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3398,e3399).

#pos(e3400,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3401,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3400,e3401).

#pos(e3402,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3403,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3402,e3403).

#pos(e3404,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e3405,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e3404,e3405).

#pos(e3406,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#pos(e3407,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,5)). true(has(2,0)). 
}).
#brave_ordering(e3406,e3407).

#pos(e3408,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3409,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3408,e3409).

#pos(e3410,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3411,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3410,e3411).

#pos(e3412,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3413,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3412,e3413).

#pos(e3414,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3415,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3414,e3415).

#pos(e3416,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3417,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3416,e3417).

#pos(e3418,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3419,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3418,e3419).

#pos(e3420,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e3421,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e3420,e3421).

#pos(e3422,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3423,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3422,e3423).

#pos(e3424,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3425,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3424,e3425).

#pos(e3426,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3427,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3426,e3427).

#pos(e3428,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3429,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3428,e3429).

#pos(e3430,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3431,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3430,e3431).

#pos(e3432,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3433,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3432,e3433).

#pos(e3434,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3435,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3434,e3435).

#pos(e3436,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3437,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3436,e3437).

#pos(e3438,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3439,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3438,e3439).

#pos(e3440,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3441,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3440,e3441).

#pos(e3442,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3443,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3442,e3443).

#pos(e3444,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3445,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3444,e3445).

#pos(e3446,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3447,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3446,e3447).

#pos(e3448,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3449,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3448,e3449).

#pos(e3450,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3451,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3450,e3451).

#pos(e3452,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3453,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3452,e3453).

#pos(e3454,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3455,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3454,e3455).

#pos(e3456,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e3457,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e3456,e3457).

#pos(e3458,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3459,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3458,e3459).

#pos(e3460,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3461,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3460,e3461).

#pos(e3462,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#pos(e3463,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,3)). true(has(2,0)). 
}).
#brave_ordering(e3462,e3463).

#pos(e3464,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e3465,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e3464,e3465).

#pos(e3466,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3467,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3466,e3467).

#pos(e3468,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3469,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3468,e3469).

#pos(e3470,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3471,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3470,e3471).

#pos(e3472,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3473,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3472,e3473).

#pos(e3474,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3475,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3474,e3475).

#pos(e3476,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3477,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3476,e3477).

#pos(e3478,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e3479,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e3478,e3479).

#pos(e3480,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e3481,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e3480,e3481).

#pos(e3482,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3483,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3482,e3483).

#pos(e3484,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3485,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3484,e3485).

#pos(e3486,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e3487,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e3486,e3487).

#pos(e3488,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3489,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3488,e3489).

#pos(e3490,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e3491,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e3490,e3491).

#pos(e3492,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e3493,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e3492,e3493).

#pos(e3494,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e3495,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e3494,e3495).

#pos(e3496,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3497,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3496,e3497).

#pos(e3498,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e3499,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e3498,e3499).

#pos(e3500,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#pos(e3501,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,1)). true(has(3,0)). 
}).
#brave_ordering(e3500,e3501).

#pos(e3502,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3503,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3502,e3503).

#pos(e3504,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3505,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3504,e3505).

#pos(e3506,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3507,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3506,e3507).

#pos(e3508,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3509,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3508,e3509).

#pos(e3510,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3511,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3510,e3511).

#pos(e3512,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3513,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3512,e3513).

#pos(e3514,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3515,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3514,e3515).

#pos(e3516,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3517,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3516,e3517).

#pos(e3518,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3519,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3518,e3519).

#pos(e3520,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3521,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3520,e3521).

#pos(e3522,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3523,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3522,e3523).

#pos(e3524,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3525,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3524,e3525).

#pos(e3526,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3527,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3526,e3527).

#pos(e3528,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3529,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3528,e3529).

#pos(e3530,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3531,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3530,e3531).

#pos(e3532,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3533,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3532,e3533).

#pos(e3534,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3535,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3534,e3535).

#pos(e3536,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3537,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3536,e3537).

#pos(e3538,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3539,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3538,e3539).

#pos(e3540,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e3541,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e3540,e3541).

#pos(e3542,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3543,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3542,e3543).

#pos(e3544,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3545,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3544,e3545).

#pos(e3546,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3547,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3546,e3547).

#pos(e3548,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3549,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3548,e3549).

#pos(e3550,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3551,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3550,e3551).

#pos(e3552,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3553,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3552,e3553).

#pos(e3554,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3555,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3554,e3555).

#pos(e3556,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3557,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3556,e3557).

#pos(e3558,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3559,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3558,e3559).

#pos(e3560,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3561,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3560,e3561).

#pos(e3562,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3563,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3562,e3563).

#pos(e3564,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3565,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3564,e3565).

#pos(e3566,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3567,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3566,e3567).

#pos(e3568,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3569,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3568,e3569).

#pos(e3570,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3571,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3570,e3571).

#pos(e3572,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3573,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3572,e3573).

#pos(e3574,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3575,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3574,e3575).

#pos(e3576,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3577,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3576,e3577).

#pos(e3578,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3579,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3578,e3579).

#pos(e3580,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3581,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3580,e3581).

#pos(e3582,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3583,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3582,e3583).

#pos(e3584,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3585,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3584,e3585).

#pos(e3586,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3587,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3586,e3587).

#pos(e3588,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3589,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3588,e3589).

#pos(e3590,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3591,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3590,e3591).

#pos(e3592,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3593,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3592,e3593).

#pos(e3594,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3595,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3594,e3595).

#pos(e3596,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3597,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3596,e3597).

#pos(e3598,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3599,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3598,e3599).

#pos(e3600,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3601,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3600,e3601).

#pos(e3602,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3603,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3602,e3603).

#pos(e3604,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3605,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3604,e3605).

#pos(e3606,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3607,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3606,e3607).

#pos(e3608,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3609,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3608,e3609).

#pos(e3610,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3611,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3610,e3611).

#pos(e3612,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3613,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3612,e3613).

#pos(e3614,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3615,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3614,e3615).

#pos(e3616,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3617,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3616,e3617).

#pos(e3618,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3619,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3618,e3619).

#pos(e3620,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3621,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3620,e3621).

#pos(e3622,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3623,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3622,e3623).

#pos(e3624,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3625,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3624,e3625).

#pos(e3626,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3627,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3626,e3627).

#pos(e3628,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3629,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3628,e3629).

#pos(e3630,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3631,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3630,e3631).

#pos(e3632,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3633,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3632,e3633).

#pos(e3634,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3635,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3634,e3635).

#pos(e3636,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3637,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3636,e3637).

#pos(e3638,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3639,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3638,e3639).

#pos(e3640,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3641,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3640,e3641).

#pos(e3642,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3643,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3642,e3643).

#pos(e3644,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3645,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3644,e3645).

#pos(e3646,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3647,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3646,e3647).

#pos(e3648,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3649,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3648,e3649).

#pos(e3650,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3651,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3650,e3651).

#pos(e3652,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3653,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3652,e3653).

#pos(e3654,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3655,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3654,e3655).

#pos(e3656,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3657,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3656,e3657).

#pos(e3658,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3659,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3658,e3659).

#pos(e3660,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3661,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3660,e3661).

#pos(e3662,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3663,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3662,e3663).

#pos(e3664,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3665,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3664,e3665).

#pos(e3666,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3667,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3666,e3667).

#pos(e3668,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3669,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3668,e3669).

#pos(e3670,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3671,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3670,e3671).

#pos(e3672,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3673,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3672,e3673).

#pos(e3674,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3675,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3674,e3675).

#pos(e3676,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3677,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3676,e3677).

#pos(e3678,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#pos(e3679,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,1)). 
}).
#brave_ordering(e3678,e3679).

#pos(e3680,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3681,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3680,e3681).

#pos(e3682,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3683,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3682,e3683).

#pos(e3684,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3685,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3684,e3685).

#pos(e3686,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3687,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3686,e3687).

#pos(e3688,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3689,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3688,e3689).

#pos(e3690,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3691,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3690,e3691).

#pos(e3692,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3693,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3692,e3693).

#pos(e3694,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3695,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3694,e3695).

#pos(e3696,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3697,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3696,e3697).

#pos(e3698,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3699,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3698,e3699).

#pos(e3700,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3701,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3700,e3701).

#pos(e3702,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3703,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3702,e3703).

#pos(e3704,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3705,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3704,e3705).

#pos(e3706,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e3707,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e3706,e3707).

#pos(e3708,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e3709,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e3708,e3709).

#pos(e3710,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e3711,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e3710,e3711).

#pos(e3712,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e3713,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e3712,e3713).

#pos(e3714,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3715,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3714,e3715).

#pos(e3716,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3717,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3716,e3717).

#pos(e3718,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3719,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3718,e3719).

#pos(e3720,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3721,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3720,e3721).

#pos(e3722,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e3723,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e3722,e3723).

#pos(e3724,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#pos(e3725,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,3)). 
}).
#brave_ordering(e3724,e3725).

#pos(e3726,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3727,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3726,e3727).

#pos(e3728,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3729,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3728,e3729).

#pos(e3730,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3731,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3730,e3731).

#pos(e3732,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3733,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3732,e3733).

#pos(e3734,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3735,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3734,e3735).

#pos(e3736,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3737,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3736,e3737).

#pos(e3738,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3739,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3738,e3739).

#pos(e3740,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3741,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3740,e3741).

#pos(e3742,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3743,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3742,e3743).

#pos(e3744,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3745,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3744,e3745).

#pos(e3746,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3747,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3746,e3747).

#pos(e3748,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3749,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3748,e3749).

#pos(e3750,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3751,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3750,e3751).

#pos(e3752,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3753,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3752,e3753).

#pos(e3754,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3755,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3754,e3755).

#pos(e3756,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3757,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3756,e3757).

#pos(e3758,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#pos(e3759,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,3)). 
}).
#brave_ordering(e3758,e3759).

#pos(e3760,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3761,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3760,e3761).

#pos(e3762,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3763,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3762,e3763).

#pos(e3764,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3765,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3764,e3765).

#pos(e3766,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3767,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3766,e3767).

#pos(e3768,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3769,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3768,e3769).

#pos(e3770,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3771,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3770,e3771).

#pos(e3772,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3773,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3772,e3773).

#pos(e3774,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e3775,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e3774,e3775).

#pos(e3776,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e3777,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e3776,e3777).

#pos(e3778,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3779,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3778,e3779).

#pos(e3780,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3781,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3780,e3781).

#pos(e3782,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3783,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3782,e3783).

#pos(e3784,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3785,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3784,e3785).

#pos(e3786,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3787,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3786,e3787).

#pos(e3788,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3789,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3788,e3789).

#pos(e3790,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3791,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3790,e3791).

#pos(e3792,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e3793,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e3792,e3793).

#pos(e3794,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e3795,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e3794,e3795).

#pos(e3796,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3797,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3796,e3797).

#pos(e3798,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e3799,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e3798,e3799).

#pos(e3800,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#pos(e3801,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,3)). 
}).
#brave_ordering(e3800,e3801).

#pos(e3802,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3803,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3802,e3803).

#pos(e3804,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3805,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3804,e3805).

#pos(e3806,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e3807,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e3806,e3807).

#pos(e3808,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e3809,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e3808,e3809).

#pos(e3810,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3811,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3810,e3811).

#pos(e3812,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3813,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3812,e3813).

#pos(e3814,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3815,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3814,e3815).

#pos(e3816,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3817,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3816,e3817).

#pos(e3818,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3819,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3818,e3819).

#pos(e3820,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3821,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3820,e3821).

#pos(e3822,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3823,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3822,e3823).

#pos(e3824,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3825,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3824,e3825).

#pos(e3826,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3827,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3826,e3827).

#pos(e3828,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3829,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3828,e3829).

#pos(e3830,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3831,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3830,e3831).

#pos(e3832,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3833,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3832,e3833).

#pos(e3834,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#pos(e3835,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,2)). 
}).
#brave_ordering(e3834,e3835).

#pos(e3836,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3837,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3836,e3837).

#pos(e3838,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3839,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3838,e3839).

#pos(e3840,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3841,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3840,e3841).

#pos(e3842,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e3843,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e3842,e3843).

#pos(e3844,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3845,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3844,e3845).

#pos(e3846,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e3847,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e3846,e3847).

#pos(e3848,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3849,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3848,e3849).

#pos(e3850,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3851,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3850,e3851).

#pos(e3852,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#pos(e3853,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,3)). true(has(2,1)). 
}).
#brave_ordering(e3852,e3853).

#pos(e3854,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3855,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3854,e3855).

#pos(e3856,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3857,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3856,e3857).

#pos(e3858,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3859,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3858,e3859).

#pos(e3860,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3861,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3860,e3861).

#pos(e3862,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3863,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3862,e3863).

#pos(e3864,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3865,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3864,e3865).

#pos(e3866,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3867,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3866,e3867).

#pos(e3868,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3869,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3868,e3869).

#pos(e3870,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3871,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3870,e3871).

#pos(e3872,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3873,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3872,e3873).

#pos(e3874,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#pos(e3875,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,0)). true(has(2,3)). 
}).
#brave_ordering(e3874,e3875).

#pos(e3876,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3877,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3876,e3877).

#pos(e3878,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3879,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3878,e3879).

#pos(e3880,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3881,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3880,e3881).

#pos(e3882,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3883,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3882,e3883).

#pos(e3884,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e3885,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e3884,e3885).

#pos(e3886,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3887,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3886,e3887).

#pos(e3888,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3889,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3888,e3889).

#pos(e3890,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#pos(e3891,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,0)). true(has(2,0)). 
}).
#brave_ordering(e3890,e3891).

#pos(e3892,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e3893,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e3892,e3893).

#pos(e3894,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3895,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3894,e3895).

#pos(e3896,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e3897,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e3896,e3897).

#pos(e3898,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3899,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3898,e3899).

#pos(e3900,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3901,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3900,e3901).

#pos(e3902,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e3903,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e3902,e3903).

#pos(e3904,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3905,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3904,e3905).

#pos(e3906,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#pos(e3907,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,3)). true(has(1,2)). 
}).
#brave_ordering(e3906,e3907).

#pos(e3908,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3909,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3908,e3909).

#pos(e3910,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3911,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3910,e3911).

#pos(e3912,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3913,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3912,e3913).

#pos(e3914,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e3915,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e3914,e3915).

#pos(e3916,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3917,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3916,e3917).

#pos(e3918,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3919,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3918,e3919).

#pos(e3920,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e3921,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e3920,e3921).

#pos(e3922,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3923,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3922,e3923).

#pos(e3924,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e3925,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e3924,e3925).

#pos(e3926,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3927,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3926,e3927).

#pos(e3928,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3929,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3928,e3929).

#pos(e3930,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e3931,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e3930,e3931).

#pos(e3932,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3933,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3932,e3933).

#pos(e3934,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3935,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3934,e3935).

#pos(e3936,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3937,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3936,e3937).

#pos(e3938,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#pos(e3939,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,0)). true(has(1,3)). 
}).
#brave_ordering(e3938,e3939).

#pos(e3940,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3941,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3940,e3941).

#pos(e3942,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3943,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3942,e3943).

#pos(e3944,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e3945,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e3944,e3945).

#pos(e3946,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3947,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3946,e3947).

#pos(e3948,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e3949,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e3948,e3949).

#pos(e3950,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e3951,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e3950,e3951).

#pos(e3952,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e3953,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e3952,e3953).

#pos(e3954,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3955,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3954,e3955).

#pos(e3956,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3957,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3956,e3957).

#pos(e3958,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e3959,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e3958,e3959).

#pos(e3960,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e3961,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e3960,e3961).

#pos(e3962,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e3963,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e3962,e3963).

#pos(e3964,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e3965,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e3964,e3965).

#pos(e3966,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3967,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3966,e3967).

#pos(e3968,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e3969,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e3968,e3969).

#pos(e3970,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e3971,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e3970,e3971).

#pos(e3972,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3973,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3972,e3973).

#pos(e3974,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3975,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3974,e3975).

#pos(e3976,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3977,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3976,e3977).

#pos(e3978,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3979,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3978,e3979).

#pos(e3980,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e3981,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e3980,e3981).

#pos(e3982,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e3983,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e3982,e3983).

#pos(e3984,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3985,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3984,e3985).

#pos(e3986,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e3987,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e3986,e3987).

#pos(e3988,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e3989,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e3988,e3989).

#pos(e3990,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e3991,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e3990,e3991).

#pos(e3992,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e3993,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e3992,e3993).

#pos(e3994,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3995,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3994,e3995).

#pos(e3996,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#pos(e3997,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,0)). 
}).
#brave_ordering(e3996,e3997).

#pos(e3998,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e3999,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e3998,e3999).

#pos(e4000,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4001,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4000,e4001).

#pos(e4002,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4003,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4002,e4003).

#pos(e4004,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4005,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4004,e4005).

#pos(e4006,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4007,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4006,e4007).

#pos(e4008,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4009,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4008,e4009).

#pos(e4010,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4011,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4010,e4011).

#pos(e4012,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4013,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4012,e4013).

#pos(e4014,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4015,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4014,e4015).

#pos(e4016,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e4017,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e4016,e4017).

#pos(e4018,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4019,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4018,e4019).

#pos(e4020,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4021,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4020,e4021).

#pos(e4022,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4023,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4022,e4023).

#pos(e4024,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4025,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4024,e4025).

#pos(e4026,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4027,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4026,e4027).

#pos(e4028,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4029,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4028,e4029).

#pos(e4030,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e4031,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e4030,e4031).

#pos(e4032,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e4033,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e4032,e4033).

#pos(e4034,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#pos(e4035,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#brave_ordering(e4034,e4035).

#pos(e4036,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#pos(e4037,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,2)). 
}).
#brave_ordering(e4036,e4037).

#pos(e4038,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e4039,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e4038,e4039).

#pos(e4040,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e4041,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e4040,e4041).

#pos(e4042,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e4043,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,2)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e4042,e4043).

#pos(e4044,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e4045,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e4044,e4045).

#pos(e4046,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e4047,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e4046,e4047).

#pos(e4048,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e4049,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e4048,e4049).

#pos(e4050,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#pos(e4051,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,1)). 
}).
#brave_ordering(e4050,e4051).

#pos(e4052,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#pos(e4053,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,1)). 
}).
#brave_ordering(e4052,e4053).

#pos(e4054,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e4055,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e4054,e4055).

#pos(e4056,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4057,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4056,e4057).

#pos(e4058,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4059,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4058,e4059).

#pos(e4060,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e4061,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e4060,e4061).

#pos(e4062,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e4063,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e4062,e4063).

#pos(e4064,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e4065,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e4064,e4065).

#pos(e4066,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4067,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4066,e4067).

#pos(e4068,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4069,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4068,e4069).

#pos(e4070,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4071,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4070,e4071).

#pos(e4072,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4073,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4072,e4073).

#pos(e4074,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e4075,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e4074,e4075).

#pos(e4076,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e4077,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e4076,e4077).

#pos(e4078,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e4079,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e4078,e4079).

#pos(e4080,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e4081,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e4080,e4081).

#pos(e4082,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4083,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4082,e4083).

#pos(e4084,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4085,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4084,e4085).

#pos(e4086,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#pos(e4087,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,4)). true(has(3,0)). 
}).
#brave_ordering(e4086,e4087).

#pos(e4088,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4089,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4088,e4089).

#pos(e4090,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4091,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4090,e4091).

#pos(e4092,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4093,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4092,e4093).

#pos(e4094,{ does(a,remove(2,4)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4095,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4094,e4095).

#pos(e4096,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4097,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4096,e4097).

#pos(e4098,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4099,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4098,e4099).

#pos(e4100,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4101,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4100,e4101).

#pos(e4102,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e4103,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e4102,e4103).

#pos(e4104,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#pos(e4105,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,0)). true(has(2,2)). 
}).
#brave_ordering(e4104,e4105).

#pos(e4106,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e4107,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e4106,e4107).

#pos(e4108,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e4109,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e4108,e4109).

#pos(e4110,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#pos(e4111,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(2,3)). true(has(3,0)). 
}).
#brave_ordering(e4110,e4111).

#pos(e4112,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e4113,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e4112,e4113).

#pos(e4114,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e4115,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e4114,e4115).

#pos(e4116,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#pos(e4117,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,3)). true(has(1,0)). 
}).
#brave_ordering(e4116,e4117).

#pos(e4118,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e4119,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e4118,e4119).

#pos(e4120,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#pos(e4121,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,1)). true(has(2,2)). 
}).
#brave_ordering(e4120,e4121).

#pos(e4122,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e4123,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e4122,e4123).

#pos(e4124,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e4125,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e4124,e4125).

#pos(e4126,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#pos(e4127,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,1)). true(has(3,1)). true(has(2,3)). 
}).
#brave_ordering(e4126,e4127).

#pos(e4128,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e4129,{ does(b,remove(2,4)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e4128,e4129).

#pos(e4130,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e4131,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e4130,e4131).

#pos(e4132,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e4133,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e4132,e4133).

#pos(e4134,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#pos(e4135,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,4)). true(has(1,1)). 
}).
#brave_ordering(e4134,e4135).

#pos(e4136,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#pos(e4137,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,0)). true(has(2,2)). 
}).
#brave_ordering(e4136,e4137).

#pos(e4138,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4139,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4138,e4139).

#pos(e4140,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4141,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4140,e4141).

#pos(e4142,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4143,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4142,e4143).

#pos(e4144,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e4145,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e4144,e4145).

#pos(e4146,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e4147,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e4146,e4147).

#pos(e4148,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#pos(e4149,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(1,0)). true(has(2,3)). 
}).
#brave_ordering(e4148,e4149).

#pos(e4150,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#pos(e4151,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(2,2)). true(has(3,0)). 
}).
#brave_ordering(e4150,e4151).

#pos(e4152,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4153,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4152,e4153).

#pos(e4154,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4155,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4154,e4155).

#pos(e4156,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4157,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4156,e4157).

#pos(e4158,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4159,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,1)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4158,e4159).

#pos(e4160,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e4161,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e4160,e4161).

#pos(e4162,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e4163,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e4162,e4163).

#pos(e4164,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#pos(e4165,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,3)). true(has(1,1)). 
}).
#brave_ordering(e4164,e4165).

#pos(e4166,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4167,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4166,e4167).

#pos(e4168,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e4169,{ does(b,remove(2,3)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e4168,e4169).

#pos(e4170,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#pos(e4171,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,3)). true(has(1,0)). true(has(3,0)). 
}).
#brave_ordering(e4170,e4171).

#pos(e4172,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#pos(e4173,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(1,0)). true(has(3,1)). true(has(2,2)). 
}).
#brave_ordering(e4172,e4173).

#pos(e4174,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4175,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4174,e4175).

#pos(e4176,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4177,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4176,e4177).

#pos(e4178,{ does(a,remove(2,3)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#pos(e4179,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(2,3)). true(has(3,1)). true(has(1,0)). 
}).
#brave_ordering(e4178,e4179).

#pos(e4180,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4181,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4180,e4181).

#pos(e4182,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e4183,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e4182,e4183).

#pos(e4184,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e4185,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e4184,e4185).

#pos(e4186,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4187,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4186,e4187).

#pos(e4188,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#pos(e4189,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,0)). 
}).
#brave_ordering(e4188,e4189).

#pos(e4190,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#pos(e4191,{ does(b,remove(2,2)) }, {}, {
 true(control(b)). true(has(3,0)). true(has(2,2)). true(has(1,0)). 
}).
#brave_ordering(e4190,e4191).

#pos(e4192,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e4193,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e4192,e4193).

#pos(e4194,{ does(a,remove(2,2)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#pos(e4195,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,2)). true(has(3,0)). true(has(1,1)). 
}).
#brave_ordering(e4194,e4195).

#pos(e4196,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#pos(e4197,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,0)). 
}).
#brave_ordering(e4196,e4197).

#pos(e4198,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4199,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4198,e4199).

#pos(e4200,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4201,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4200,e4201).

#pos(e4202,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4203,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4202,e4203).

#pos(e4204,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e4205,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e4204,e4205).

#pos(e4206,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e4207,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e4206,e4207).

#pos(e4208,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e4209,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,4)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e4208,e4209).

#pos(e4210,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4211,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4210,e4211).

#pos(e4212,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4213,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4212,e4213).

#pos(e4214,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4215,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4214,e4215).

#pos(e4216,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e4217,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e4216,e4217).

#pos(e4218,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#pos(e4219,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(1,2)). true(has(2,1)). 
}).
#brave_ordering(e4218,e4219).

#pos(e4220,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4221,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4220,e4221).

#pos(e4222,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4223,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4222,e4223).

#pos(e4224,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4225,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4224,e4225).

#pos(e4226,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e4227,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e4226,e4227).

#pos(e4228,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e4229,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e4228,e4229).

#pos(e4230,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e4231,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e4230,e4231).

#pos(e4232,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4233,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4232,e4233).

#pos(e4234,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4235,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4234,e4235).

#pos(e4236,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4237,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4236,e4237).

#pos(e4238,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4239,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4238,e4239).

#pos(e4240,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4241,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4240,e4241).

#pos(e4242,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4243,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4242,e4243).

#pos(e4244,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4245,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4244,e4245).

#pos(e4246,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4247,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4246,e4247).

#pos(e4248,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4249,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4248,e4249).

#pos(e4250,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e4251,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e4250,e4251).

#pos(e4252,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e4253,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e4252,e4253).

#pos(e4254,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4255,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4254,e4255).

#pos(e4256,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4257,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4256,e4257).

#pos(e4258,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4259,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4258,e4259).

#pos(e4260,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#pos(e4261,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,2)). true(has(3,0)). 
}).
#brave_ordering(e4260,e4261).

#pos(e4262,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e4263,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e4262,e4263).

#pos(e4264,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#pos(e4265,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(1,3)). true(has(3,0)). 
}).
#brave_ordering(e4264,e4265).

#pos(e4266,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4267,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4266,e4267).

#pos(e4268,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4269,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4268,e4269).

#pos(e4270,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4271,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4270,e4271).

#pos(e4272,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4273,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4272,e4273).

#pos(e4274,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4275,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4274,e4275).

#pos(e4276,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#pos(e4277,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,3)). 
}).
#brave_ordering(e4276,e4277).

#pos(e4278,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#pos(e4279,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,2)). 
}).
#brave_ordering(e4278,e4279).

#pos(e4280,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e4281,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e4280,e4281).

#pos(e4282,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4283,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4282,e4283).

#pos(e4284,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4285,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4284,e4285).

#pos(e4286,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e4287,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e4286,e4287).

#pos(e4288,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e4289,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e4288,e4289).

#pos(e4290,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#pos(e4291,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,3)). 
}).
#brave_ordering(e4290,e4291).

#pos(e4292,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,4)). true(has(3,0)). 
}).
#pos(e4293,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,4)). true(has(3,0)). 
}).
#brave_ordering(e4292,e4293).

#pos(e4294,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4295,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4294,e4295).

#pos(e4296,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4297,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4296,e4297).

#pos(e4298,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4299,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4298,e4299).

#pos(e4300,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4301,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(1,4)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4300,e4301).

#pos(e4302,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4303,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,2)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4302,e4303).

#pos(e4304,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4305,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4304,e4305).

#pos(e4306,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4307,{ does(b,remove(3,1)) }, {}, {
 true(control(b)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4306,e4307).

#pos(e4308,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e4309,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e4308,e4309).

#pos(e4310,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#pos(e4311,{ does(a,remove(2,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,1)). true(has(1,2)). 
}).
#brave_ordering(e4310,e4311).

#pos(e4312,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4313,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4312,e4313).

#pos(e4314,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4315,{ does(b,remove(2,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4314,e4315).

#pos(e4316,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4317,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4316,e4317).

#pos(e4318,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4319,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,1)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4318,e4319).

#pos(e4320,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e4321,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e4320,e4321).

#pos(e4322,{ does(a,remove(1,4)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#pos(e4323,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,1)). 
}).
#brave_ordering(e4322,e4323).

#pos(e4324,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4325,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,0)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4324,e4325).

#pos(e4326,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e4327,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e4326,e4327).

#pos(e4328,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#pos(e4329,{ does(b,remove(1,5)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(1,5)). true(has(3,0)). 
}).
#brave_ordering(e4328,e4329).

#pos(e4330,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e4331,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e4330,e4331).

#pos(e4332,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4333,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4332,e4333).

#pos(e4334,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#pos(e4335,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,2)). 
}).
#brave_ordering(e4334,e4335).

#pos(e4336,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#pos(e4337,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(2,0)). true(has(3,0)). true(has(1,2)). 
}).
#brave_ordering(e4336,e4337).

#pos(e4338,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4339,{ does(b,remove(1,3)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4338,e4339).

#pos(e4340,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#pos(e4341,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(1,3)). true(has(2,0)). true(has(3,0)). 
}).
#brave_ordering(e4340,e4341).

#pos(e4342,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e4343,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e4342,e4343).

#pos(e4344,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e4345,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e4344,e4345).

#pos(e4346,{ does(a,remove(1,3)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#pos(e4347,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(3,1)). true(has(2,0)). true(has(1,3)). 
}).
#brave_ordering(e4346,e4347).

#pos(e4348,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4349,{ does(b,remove(1,1)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4348,e4349).

#pos(e4350,{ does(b,remove(1,4)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#pos(e4351,{ does(b,remove(1,2)) }, {}, {
 true(control(b)). true(has(2,0)). true(has(3,1)). true(has(1,4)). 
}).
#brave_ordering(e4350,e4351).

#pos(e4352,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4353,{ does(a,remove(1,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4352,e4353).

#pos(e4354,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4355,{ does(a,remove(3,1)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4354,e4355).

#pos(e4356,{ does(a,remove(1,5)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#pos(e4357,{ does(a,remove(1,2)) }, {}, {
 true(control(a)). true(has(1,5)). true(has(3,1)). true(has(2,0)). 
}).
#brave_ordering(e4356,e4357).

#pos(e4358,{ does(a,remove(1,2)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#pos(e4359,{ does(a,remove(1,6)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#brave_ordering(e4358,e4359).

#pos(e4360,{ does(a,remove(1,2)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#pos(e4361,{ does(a,remove(1,1)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#brave_ordering(e4360,e4361).

#pos(e4362,{ does(a,remove(1,2)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#pos(e4363,{ does(a,remove(1,5)) }, {}, {
 true(has(1,7)). true(has(2,4)). true(has(3,1)). true(control(a)). 
}).
#brave_ordering(e4362,e4363).