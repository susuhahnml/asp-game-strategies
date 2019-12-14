%------------------------------- BACKGROUND KNOWLEDGE --------------------------------------

%Configuration
removable(1..3).

% Action selection
0 { does(X,remove(P,N))} 1 :- has(P,M), removable(N), N<=M, control(X).
:- does(X,Y), does(X,Z), Y < Z,  control(X).
:- not does(X,_), control(X).

% State transition
next(control(b)) :- control(a).
next(control(a)) :- control(b).
next(has(P,N-M)) :- does(_,remove(P,M)), has(P,N).
next(has(P,N)) :- not does(_,remove(P,_)), has(P,N).

% Goal
win(X):- next(has(p1,0)), next(has(p2,0)), next(has(p3,0)), next(control(X)).


%------------------------------- EXAMPLES --------------------------------------

%------------ Context E ----------------

#pos(e1, { does(a,remove(p2,1))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,0).
    control(a).}).

#pos(e2, { does(a,remove(p1,1))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,0).
    control(a).}).

#pos(e3, { does(a,remove(p2,2))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,0).
    control(a).}).

#brave_ordering(e1,e2).
#brave_ordering(e3,e2).

% %------------ Context F ----------------

#pos(f1, { does(a,remove(p1,1))}, {}, {
    has(p1,3).
    has(p2,2).
    has(p3,0).
    control(a).}).

#pos(f2, { does(a,remove(p1,2))}, {}, {
    has(p1,3).
    has(p2,2).
    has(p3,0).
    control(a).}).

#pos(f3, { does(a,remove(p1,3))}, {}, {
    has(p1,3).
    has(p2,2).
    has(p3,0).
    control(a).}).

#pos(f4, { does(a,remove(p2,1))}, {}, {
    has(p1,3).
    has(p2,2).
    has(p3,0).
    control(a).}).

#brave_ordering(f1,f2).
#brave_ordering(f1,f3).
#brave_ordering(f1,f4).

%------------ Context G ----------------

#pos(g1, { does(a,remove(p1,2))}, {}, {
    has(p1,3).
    has(p2,0).
    has(p3,0).
    control(a).}).

#pos(g2, { does(a,remove(p1,1))}, {}, {
    has(p1,3).
    has(p2,0).
    has(p3,0).
    control(a).}).

#pos(g3, { does(a,remove(p1,3))}, {}, {
    has(p1,3).
    has(p2,0).
    has(p3,0).
    control(a).}).

#brave_ordering(g1,g2).
#brave_ordering(g1,g3). % FOR SOME REASON THIS LEADS TO UNSAT

%------------ Context H ----------------

#pos(h1, { does(a,remove(p3,1))}, {}, {
    has(p1,1).
    has(p2,1).
    has(p3,2).
    control(a).}).

#pos(h2, { does(a,remove(p2,1))}, {}, {
    has(p1,1).
    has(p2,1).
    has(p3,2).
    control(a).}).

#pos(h3, { does(a,remove(p1,1))}, {}, {
    has(p1,1).
    has(p2,1).
    has(p3,2).
    control(a).}).

#pos(h4, { does(a,remove(p3,2))}, {}, {
    has(p1,1).
    has(p2,1).
    has(p3,2).
    control(a).}).

#brave_ordering(h1,h2).
#brave_ordering(h1,h3).
#brave_ordering(h1,h4).% FOR SOME REASON THIS LEADS TO UNSAT

%------------ Context I ----------------

#pos(i1, { does(a,remove(p1,1))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,2).
    control(a).}).

#pos(i2, { does(a,remove(p3,1))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,2).
    control(a).}).

#pos(i3, { does(a,remove(p3,2))}, {}, {
    has(p1,1).
    has(p2,2).
    has(p3,2).
    control(a).}).

#brave_ordering(i1,i2).
#brave_ordering(i1,i3).


%------------ Context J ----------------

#pos(j1, { does(a,remove(p1,1))}, {}, {
    has(p1,2).
    has(p2,0).
    has(p3,0).
    control(a).}).

#pos(j2, { does(a,remove(p1,2))}, {}, {
    has(p1,2).
    has(p2,0).
    has(p3,0).
    control(a).}).


#brave_ordering(j1,j2).

%------------ Context K ----------------

#pos(k1, { does(a,remove(p3,3))}, {}, {
    has(p1,2).
    has(p2,2).
    has(p3,3).
    control(a).}).

#pos(k2, { does(a,remove(p2,2))}, {}, {
    has(p1,2).
    has(p2,2).
    has(p3,3).
    control(a).}).

#pos(k3, { does(a,remove(p3,2))}, {}, {
    has(p1,2).
    has(p2,2).
    has(p3,3).
    control(a).}).


#brave_ordering(k1,k2).
#brave_ordering(k1,k3).


%------------------------------- LANGUAGE BIAS --------------------------------------
#constant(amount,0).
#constant(amount,1).
#constant(amount,2).

#constant(player,a).
#constant(player,b).


#modeo(3,next(has(var(pile),const(amount))),(positive)).
#modeo(3,var(pile)!=var(pile),(symmetric,anti_reflexive)).
#weight(-1).
#weight(1).
#weight(2).
#maxp(3).

