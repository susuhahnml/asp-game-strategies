%------------------------------- BACKGROUND KNOWLEDGE --------------------------------------
%Configuration
removable(1..3).

% Roles (Players)
role(a).
role(b).

% Action selection
legal(X,remove(P,N)) :- true(has(P,M)), removable(N), N<=M, true(control(X)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)).
next(control(a)) :- true(control(b)).
next(has(P,N-M)) :- does(_,remove(P,M)), true(has(P,N)).
next(has(P,N)) :- not does(_,remove(P,_)), true(has(P,N)).

% Define goal and terminal states
goal(X,1):- true(has(p1,0)), true(has(p2,0)), true(has(p3,0)), true(control(X)).
terminal :- goal(_,_).

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



%------------------------------- EXAMPLES --------------------------------------

%------------ Context E ----------------

#pos(e1, { does(a,remove(p2,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(e2, { does(a,remove(p1,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(e3, { does(a,remove(p2,2))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#brave_ordering(e1,e2).
#brave_ordering(e3,e2).

% %------------ Context F ----------------

#pos(f1, { does(a,remove(p1,1))}, {}, {
    true(has(p1,3)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(f2, { does(a,remove(p1,2))}, {}, {
    true(has(p1,3)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(f3, { does(a,remove(p1,3))}, {}, {
    true(has(p1,3)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(f4, { does(a,remove(p2,1))}, {}, {
    true(has(p1,3)).
    true(has(p2,2)).
    true(has(p3,0)).
    true(control(a)).}).

#brave_ordering(f1,f2).
#brave_ordering(f1,f3).
#brave_ordering(f1,f4).

%------------ Context G ----------------

#pos(g1, { does(a,remove(p1,2))}, {}, {
    true(has(p1,3)).
    true(has(p2,0)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(g2, { does(a,remove(p1,1))}, {}, {
    true(has(p1,3)).
    true(has(p2,0)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(g3, { does(a,remove(p1,3))}, {}, {
    true(has(p1,3)).
    true(has(p2,0)).
    true(has(p3,0)).
    true(control(a)).}).

#brave_ordering(g1,g2).
#brave_ordering(g1,g3). % FOR SOME REASON THIS LEADS TO UNSAT

%------------ Context H ----------------

#pos(h1, { does(a,remove(p3,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,1)).
    true(has(p3,2)).
    true(control(a)).}).

#pos(h2, { does(a,remove(p2,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,1)).
    true(has(p3,2)).
    true(control(a)).}).

#pos(h3, { does(a,remove(p1,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,1)).
    true(has(p3,2)).
    true(control(a)).}).

#pos(h4, { does(a,remove(p3,2))}, {}, {
    true(has(p1,1)).
    true(has(p2,1)).
    true(has(p3,2)).
    true(control(a)).}).

#brave_ordering(h1,h2).
#brave_ordering(h1,h3).
#brave_ordering(h1,h4).% FOR SOME REASON THIS LEADS TO UNSAT

%------------ Context I ----------------

#pos(i1, { does(a,remove(p1,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,2)).
    true(control(a)).}).

#pos(i2, { does(a,remove(p3,1))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,2)).
    true(control(a)).}).

#pos(i3, { does(a,remove(p3,2))}, {}, {
    true(has(p1,1)).
    true(has(p2,2)).
    true(has(p3,2)).
    true(control(a)).}).

#brave_ordering(i1,i2).
#brave_ordering(i1,i3).


%------------ Context J ----------------

#pos(j1, { does(a,remove(p1,1))}, {}, {
    true(has(p1,2)).
    true(has(p2,0)).
    true(has(p3,0)).
    true(control(a)).}).

#pos(j2, { does(a,remove(p1,2))}, {}, {
    true(has(p1,2)).
    true(has(p2,0)).
    true(has(p3,0)).
    true(control(a)).}).


#brave_ordering(j1,j2).

%------------ Context K ----------------

#pos(k1, { does(a,remove(p3,3))}, {}, {
    true(has(p1,2)).
    true(has(p2,2)).
    true(has(p3,3)).
    true(control(a)).}).

#pos(k2, { does(a,remove(p2,2))}, {}, {
    true(has(p1,2)).
    true(has(p2,2)).
    true(has(p3,3)).
    true(control(a)).}).

#pos(k3, { does(a,remove(p3,2))}, {}, {
    true(has(p1,2)).
    true(has(p2,2)).
    true(has(p3,3)).
    true(control(a)).}).


#brave_ordering(k1,k2).
#brave_ordering(k1,k3).
