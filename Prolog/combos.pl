

%comb(L:list,N:integer,R:list)(i,i,o)

%comb(l1..ln,N):
%(l1),n=1
%comb(l1..ln,N)
%l1 U comb(l2..ln,N-1),N>1
%

comb([E|_],1,[E]).
comb([_|T],N,R):-
    comb(T,N,R).
comb([H|T],N,[H|R]):-
     N>1,
     N1 is N-1,
     comb(T,N1,R).

allSols(L,N,R):-
    findall(RP,comb(L,N,RP),R).
