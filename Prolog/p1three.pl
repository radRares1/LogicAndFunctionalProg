% 3.
% a. Define a predicate to remove from a list all repetitive elements.
% Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
% b. Remove all occurrence of a maximum value from a list on integer numbers.
%

%countOc(l1..ln,e):
%0,n=0
%1+countOc(l2..ln,e),l1=e,
%countOc(l2..ln,e),l1!=e.
%countOc(list,el,result)
%i,i,0

countOc([],_,0).
countOc([H|T],E,R):-H=:=E,
    countOc(T,E,R1),
    R is R1 + 1.
countOc([H|T],E,R):-H=\=E,
    countOc(T,E,R).

%removeOc(l1..ln,e),
%[],n=0
%removeOc(l2..ln,e),l1=e
%l1+removeOc(l2..ln,e),l1!=e
%removeOc(list,element,result)
%i,i,o

removeOc([],_,[]).
removeOc([H|T],E,R):-H=:=E,
    removeOc(T,E,R).
removeOc([H|T],E,[H|R]):-H=\=E,
    removeOc(T,E,R).

%removeAll(l1..ln):
%[],n=0,
%removeAll(l2..ln), countAll(l1)>1
%l1+removeAll(l2..ln), countAll(l1) = 1;
%removeAll(list,result)
%i,o

removeAll([],[]).
removeAll([H|T],[H|R]):-
    countOc([H|T],H,RC),
    RC=:=1,
    removeAll(T,R).
removeAll([H|T],R):-
    countOc([H|T],H,RC),
    RC=\=1,
    removeOc([H|T],H,N),
    removeAll(N,R).


%maxNo(a,b):
%a,a>=b
%b,b>=a
%maxNo(number,number)
%i,i

maxNo(A,B,A):-A>=B.
maxNo(A,B,B):-B>=A.

%maxList(l1..ln)
%l1,n=1,
%maxNo(l1,maxList(l2..ln)
%i,o

maxList([H],H).
maxList([H|T],R):-
    maxList(T,RS),
    maxNo(H,RS,R).

%removeMax(l1..ln):
%removeOc(

removeMax(L,R):-
    maxList(L,RM),
    removeOc(L,RM,R).

