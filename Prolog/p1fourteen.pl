
%selectN(l1..ln,n):
%l1,n=1
%select(l2..ln,n-1),otherwise
%select(list,number,result)

selectN([H|_],1,H):-!.
selectN([_|T],N,R):-
    NN is N-1,
    selectN(T,NN,R).
