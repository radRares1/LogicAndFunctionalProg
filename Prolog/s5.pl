

%i.4)
p(1).
p(2).
q(1).
q(2).
r(1).
r(2).

s:-!,p(X),q(Y),r(Z), write(X), write(Y), write(Z),nl.

len([],0).
len([_|T],R):-
    len(T,R1),
    R is R1+1.

sum([],0).
sum([H|T],R):-
    sum(T,R1),
    R is R1+H.

subsets([],[]).
subsets([H|T],[H|R]):-
    subsets(T,R).
subsets([_|L],R):-
    subsets(L,R).

check(L,N,R):-
    subsets(L,R),
    len(R,LEN),
    LEN>=N,
    sum(R,S),
    S mod 3 =:= 0.


allSols(L,N,R):-findall(RP,check(L,N,RP),R).
