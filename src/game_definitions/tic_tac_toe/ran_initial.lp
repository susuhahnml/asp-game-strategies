
#const grid_size = 2.

% Starting player
true(control(a)).
true(has(free,X,Y)):- X=1..grid_size, Y=1..grid_size.
