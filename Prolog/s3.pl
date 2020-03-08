

f([],-1).
f([H|T],S):-H>0,f(T,S1),S1<H,!,S is H.
f([_|T],S):-f(T,S1),S is S1.

inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|R]):-
    inserare(T,E,R).

check([_]).
check([A,B|T]):-
    abs(A-B)<4,
    check([B|T]).


f4([],[]).
f4([H|T],[H|S]):-f4(T,S).
f4([H|T],S):-H mod 2 =:= 0,f4(T,S).



permutari([], []).
permutari([H|T], R) :-
    permutari(T, RP),
    inserare(RP, H, R),
    check(R).


%allsolutions(L:list, N:number, R:list)
% allsolutions(i, i, o)

allsolutions(L , R) :-
    findall(RPartial, permutari(L,RPartial), R).

