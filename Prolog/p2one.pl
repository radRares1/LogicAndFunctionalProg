
% 1. Write a predicate to generate the list of all subsets with all elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]
%
% insert(l1..ln,e):
% [e],n=0
% e+l1..ln,n>=1
% l1+insert(l2..ln,e),otherwise
%
% insertA(list,e,list)
% insertA(i,i,o)

insertA([],E,[E]).
insertA([H|T],E,[E,H|T]).
insertA([H|T],E,[H|R]):-
    insertA(T,E,R).

%perm(l1..ln):
%[],n=0
%insert(perm(l2..ln),l1),otherwise
%
%perm(list,resultList)
%perm(i,o)

perm([],[]).
perm([H|T],R):-
    perm(T,RP),
    insertA(RP,H,R).


%combi(l1..ln,k):
%[],k=0
%l1+combi(l2..ln,k-1),k>0
%combi(l2..ln,k),k>0
%
%combi(list,number,list)
%combi(i,o)
%

combi(_,0,[]).
combi([H|T],K,[H|R]):-
    K>0,
    NK is K-1,
    combi(T,NK,R).
combi([_|T],K,R):-
    K>0,
    combi(T,K,R).


%allSols(list,number,list)
%i.i.o

allSols(L,N,R):-
    findall(RP,combi(L,N,RP),R).
