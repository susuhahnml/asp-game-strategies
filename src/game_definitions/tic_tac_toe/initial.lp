
% Starting player
true(control(a)).
true(free(X,Y)):- X=1..grid_size, Y=1..grid_size.
