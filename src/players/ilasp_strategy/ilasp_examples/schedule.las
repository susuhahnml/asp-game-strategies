slot(mon,1..3).
slot(tue,1..3).
slot(wed,1..3).
type(mon,1,c2).
type(mon,2,c1).
type(mon,3,c1).
type(tue,1,c1).
type(tue,2,c1).
type(tue,3,c2).
type(wed,1,c1).
type(wed,2,c2).
type(wed,3,c1).


0 { assigned(X, Y) } 1 :- slot(X, Y).
#modeo(assigned(var(day), var(time)), (positive)).
#modeo(1, type(var(day), var(time), const(course)), (positive)).
#modeo(1, var(day) != var(day)).
#constant(course, c2).
#weight(1).
% For each example, we show the corresponding partial timetable.  "Yes" means
% that the person was definitely assigned the slot; "No" means that the person
% definitely was not assigned the slot; "?" meas that whether this slot was
% assigned to this person is unknown.
#pos(pos1, {         %
  assigned(mon,1)    %
}, { }).             %
                     %
                     %
                     %
                     %
                     %
                     %
#pos(pos2, {         %
  assigned(mon,3),   %
  assigned(wed,1),   %
  assigned(wed,3)    %
}, {                 %
  assigned(mon,1),   %
  assigned(tue,3),   %
  assigned(wed,2)    %
}). %
#pos(pos3, {         %
  assigned(mon,1),   %
  assigned(wed,3)    %
}, {}).              %
                     %
                     %
                     %
                     %
                     %
#pos(pos4, {         %
  assigned(mon,1),   %
  assigned(mon,2),   %
  assigned(mon,3)    %
}, {                 %
  assigned(tue,1),   %
  assigned(tue,2),   %
  assigned(tue,3),   %
  assigned(wed,1),   %
  assigned(wed,2),
  assigned(wed,3)
}).
#pos(pos5, {         %
  assigned(mon,2),   %
  assigned(mon,3)    %
},{                  %
  assigned(mon,1),   %
  assigned(tue,1),   %
  assigned(tue,2),   %
  assigned(tue,3),   %
  assigned(wed,1),   %
  assigned(wed,2),
  assigned(wed,3)
}).
#pos(pos6, {         %
  assigned(mon,2),   %
  assigned(tue,1)    %
},{                  %
  assigned(mon,1),   %
  assigned(mon,3),   %
  assigned(tue,2),   %
  assigned(tue,3),   %
  assigned(wed,1),   %
  assigned(wed,2),
  assigned(wed,3)
}).
#cautious_ordering(pos4, pos3).
#cautious_ordering(pos2, pos1).
#cautious_ordering(pos2, pos3).
#brave_ordering(pos5, pos6).
#maxv(4).
#maxp(2).