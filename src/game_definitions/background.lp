% Winning number configuration
#const m = 2.

% Roles (Players)
role(a).
role(b).

% Action selection
legal(P,remove(X,Y)) :- true(has(X,Y)), true(control(P)), not terminal.
0 { does(X,A)} 1 :- legal(X,A), not terminal.
:- does(X,Y), does(X,Z), Y < Z.
:- not does(X,_), true(control(X)), not terminal.

% State transition
next(control(b)) :- true(control(a)).
next(control(a)) :- true(control(b)).
next(has(X,Y)) :- not does(_,remove(X,Y)), true(has(X,Y)).
next(has(P,X,Y)) :- does(P,remove(X,Y)).
next(has(P,X,Y)) :- true(has(P,X,Y)).

% Trigger to check player scores
check(P) :- #sum{1,P,X,Y:true(has(P,X,Y))} >= m, role(P).
{group(P,X,Y):true(has(P,X,Y))} = m :- check(P).
% Vertical check
goal(P,1) :- N = #sum{Y:group(P,X,Y)}, M = #min{Y:group(P,X,Y)}, N-(M-1)*m=(m*(m+1))/2, #sum{1,X:group(P,X,Y)} = 1, check(P).
% Horizontal check
goal(P,1) :- N = #sum{X:group(P,X,Y)}, M = #min{X:group(P,X,Y)}, N-(M-1)*m=(m*(m+1))/2, #sum{1,Y:group(P,X,Y)} = 1, check(P).
% Diagonal check
goal(P,1) :- N = #sum{X:group(P,X,Y)}, M = #min{X:group(P,X,Y)}, N-(M-1)*m=(m*(m+1))/2, N' = #sum{Y:group(P,X,Y)}, M' = #min{Y:group(P,X,Y)}, N'-(M'-1)*m=(m*(m+1))/2, check(P).
% Draw check
goal(P,0) :- #sum{1,X,Y:true(has(X,Y))}=0, true(control(P)), not goal(P,1), not goal(P,-1).
% Terminal declaration
terminal :- goal(_,_).
% Complementary goal declaration
goal(X,-1*G) :- goal(Y,G), role(X), X!=Y.

#show does/2.
