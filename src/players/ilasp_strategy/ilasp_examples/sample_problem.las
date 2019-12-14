% background knowledge
cell((0..4,0..4)).
adjacent(right,(X+1,Y),(X,Y)):-cell((X,Y)),cell((X+1,Y)).
adjacent(left,(X,Y),(X+1,Y)):-cell((X,Y)),cell((X+1,Y)).
adjacent(down,(X,Y+1),(X,Y)):-cell((X,Y)),cell((X,Y+1)).
adjacent(up,(X,Y),(X,Y+1)):-cell((X,Y)),cell((X,Y+1)).

% some constant variables
#constant(action,right).
#constant(action,left).
#constant(action,down).
#constant(action,up).

% context dependent example
#pos({state_after((2,3))},
{},
{state_before((1,3)).action(right).
wall((0,3)).wall((1,4)).}).

% language bias
#modeh(state_after(var(cell))).
#modeb(1,adjacent(const(action),var(cell),var(cell)),(positive)).
#modeb(1,state_before(var(cell)),(positive)).
#modeb(1,action(const(action)),(positive)).
#modeb(1,wall(var(cell))).
#max_penalty(50).