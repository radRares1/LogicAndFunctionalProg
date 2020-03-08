%(i,i,o)
%From=first int from the interval
%To=second int from the interval
%List=the list of integers that are in the interval
abc(From,To,List):-
    (   From =:= To -> List=[From]).
abc(From,To,List):-
    (   From > To ->
    List = []).
abc(From, To, List):-
    To >= From,
    T is To-1,
    abc(From,T,List1),
    D is T+1,
    append(List1,[D],List).


