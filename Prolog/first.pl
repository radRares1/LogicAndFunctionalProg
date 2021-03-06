%setIntersection(List1,List2,NewList):
%flow model: (i,i,o),
%List1,List2 the initial sets to be intersected
%NewList the result of the intersection
setIntersection([],_,[]).
setIntersection([H|L], List1, List2) :- member(H, List1),!,
    List2 = [H|L2],
    memberchk(H,List2),!,
    setIntersection(L, List1, L2).
setIntersection([_|L], List1, List2) :-
    setIntersection(L,List1,List2).
