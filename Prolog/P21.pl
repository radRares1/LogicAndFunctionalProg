% 3.
% a. Merge two sorted lists with removing the double values.
% b. For a heterogeneous list, formed from integer numbers and list of numbers,
% merge all sublists with removing the double values.
% [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
% [1, 2, 3, 4, 6, 7, 9, 10, 11]

%(i,i,o)

mergeLists(L,[],L).
mergeLists([],R,R).
mergeLists([HeadLeft|TailLeft],[HeadRight|TailRight],[HeadLeft|R]):- HeadLeft< HeadRight,
           mergeLists(TailLeft,[HeadRight|TailRight],R).
mergeLists([HeadLeft|TailLeft],[HeadRight|TailRight],[HeadRight|R]):-HeadLeft>HeadRight,
    mergeLists([HeadLeft|TailLeft],TailRight,R).
mergeLists([HeadLeft|TailLeft],[HeadRight|TailRight],R):- HeadLeft=:=HeadRight,
    mergeLists([HeadLeft|TailLeft],TailRight,R).

checkInList([],[]).
checkInList([Head|Tail],R):-is_list(Head),!,
    checkInList(Tail,ResultHead),
    mergeLists(Head,ResultHead,R).
checkInList([_|T],R):-
    checkInList(T,R).

