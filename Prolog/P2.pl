%predecesor(L:list,N:number,R:result list)
%flow:(i,i,o)

predecesor([], _, []):-!.
predecesor([0],1,[9]):-!.
predecesor([N],0,[N1]):-
    (   not(N=:=0)->N1 is N-1),!.
predecesor([0|T],1,[9|R]):-
    predecesor(T,1,R),!.
predecesor([H|T],0,[ResultH|R]):-
            predecesor(T,N,R),
            (   not(H=:=0)->ResultH is H-N).

% heterList(L:list, R:result list)
% flow:predList(i, o)

predList([], []).
predList([H|T], [HR|R]) :- is_list(H), !,
    predecesor(H, _, HR),
    predList(T, R).
predList([H|T], [H|R]) :-
    predList(T, R).
