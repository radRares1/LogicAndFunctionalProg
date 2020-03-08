% a. Substitute all occurrences of an element of a list with all the elements of another list.
% Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].
% b. For a heterogeneous list, formed from integer numbers and list of numbers,
% replace in every sublist all occurrences of the first element from sublist it a new given list.
% Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
% [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]
%(i,o)

insert([],L,L).
insert([H|T],L,[H|R]) :- insert(T,L,R).

substituteEl([],_,_,[]).
substituteEl([H|T],E,List,R):- H=:=E,
    insert(List,T,RI),
    substituteEl(RI,E,List,R).
substituteEl([H|T],E,List,[H|R]):- H=\= E,
    substituteEl(T,E,List,R).

checkList([],_,[]).
checkList([H|T],E,[HR|R]):-is_list(H),!,
    substituteEl([H|T],H,E,HR),
    checkList(T,E,R).
checkList([H|T],E,[H|R]):-
    checkList(T,E,R).
