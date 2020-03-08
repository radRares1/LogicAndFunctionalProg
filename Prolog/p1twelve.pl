% b. Remove the n-th element of a list



removeN([],_,[]).
removeN([_|T],1,T).
removeN([H|T],E,[H|R]):-
    E1 is E-1,
    removeN(T,E1,R).


