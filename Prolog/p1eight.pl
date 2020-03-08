% b. Write a predicate to delete first occurrence of the minimum number from a list.



%minNo(a,b):
%a,a<b
%b,b<a
%i,i,o

minNo(A,B,A):-A=<B.
minNo(A,B,B):-B=<A.

%minList(l1..ln):
%l1,n=1
%minNo(l1,minNo(l2..ln)

%i,o

minList([H],H).
minList([H|T],R):-
    minList(T,RP),
    minNo(H,RP,R).

%removefirst(l1..ln,e):
%l2..ln,l1=e
%l1+removeFirst(l2..ln,e)
%
%i,i,o

removeFirst([H|T],H,T):-!.
removeFirst([H|T],E,[H|R]):-
            removeFirst(T,E,R).

removeMin(L,R):-
    minList(L,RN),
    removeFirst(L,RN,R).
