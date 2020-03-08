
%1.1
%
f([],-1).
f([H|T],S):-H>0,f(T,S1),S1<H,!,S is H.
f([_|T],S):-f(T,S1),S is S1.

inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|R]):-

    inserare(T,E,R).

%1.4
%

f4([],0).
f4([H|T],S):-f4(T,S1),S is S1-H.

permutari([], []).
permutari([H|T], R) :-
    permutari(T, RP),
    inserare(RP, H, R).

% combinari(L:list, K:number, R:list)
% combinari(i, o)

combinari(_, 0, []).
combinari([H|T], K, [H|R]) :-
    K > 0,
    NK is K - 1,
    combinari(T, NK, R).
combinari([_|T], K, R) :-
    K > 0,
    combinari(T, K, R).

% aranjamente(L:list, K:number, R:list)
% aranjamente(i, i, o)
%
%

check([]).
check([A,B|T]):-
    20 is A*B,
    check(T).

aranjamente(L, K, R) :-
    combinari(L, K, RC),
    permutari(RC, R),
    check(R).

% allsolutions(L:list, N:number, R:list)
% allsolutions(i, i, o)

allsolutions(L, N, R) :-
    findall(RPartial, aranjamente(L,N,RPartial), R).

