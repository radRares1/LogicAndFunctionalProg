% 5.
% a. Write a predicate to compute the union of two sets.
% b. Write a predicate to determine the set of all the pairs of elements in a list.
% Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].
%
% a.
% math model
%
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


