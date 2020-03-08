% 2.
% a. Write a predicate to remove all occurrences of a certain atom from a list.
% b. Define a predicate to produce a list of pairs (atom n) from an initial list of atoms.
% In this initial list atom has n occurrences.
% Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].


%math model
%removeEl(l1..ln,e)=
%[],n=0
%removeEl(l2..ln,e),l1=e
%l1+removeEl(l2..ln,e),l1!=e
%i,i,o

removeEl([],_,[]).
removeEl([H|T],E,R):- H =:= E,
    removeEl(T,E,R).
removeEl([H|T],E,[H|R]):- H=\=E,
    removeEl(T,E,R).

%b
%math model
%countOc(l1..ln,e):
%0,n=0,
%1+countOc(l2..ln,e),l1=e,
%countOc(l2..ln,e),l1!=e.
%i,i,o

countOc([],_,0).
countOc([H|T],E,R):-H=:=E,
    countOc(T,E,R1),
    R is R1+1.
countOc([H|T],E,R):-H=\=E,
    countOc(T,E,R).

%numberAtom(l1..ln):
%[],n=0
%[l1,countOc(l1..ln,l1)]+numberAtom(removeEl(l2..ln,l1))
%numberAtom(list,list)
%i,o

numberAtom([],[]).
numberAtom([H|T],[[H,RC]|R]):-
           countOc([H|T],H,RC),
           removeEl(T,H,RR),
           numberAtom(RR,R).
