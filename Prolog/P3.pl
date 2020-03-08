%computes the absolute difference between two numbers.
%(input1,input2,result)
%(i,i,o)
absoluteDifference(A,B,C) :-
    A < B,
    C is B - A.
absoluteDifference(A,B,C):-
    A > B,
    C is A - B.


%N is n, I is the index that we increment and append to the
%sequence,Result is the list containing the sequence
%(i,i,o)

computeSequence(N,I,[]):- I =:= N+1,!.
computeSequence(N,I,[I|Result]):-
                I =< N,
                NewI is I + 1,
                computeSequence(N,NewI,Result).
computeSequence(N,I,Result):-
    I =< N,
    NewI is I + 1,
    computeSequence(N, NewI, Result).


% check if the absolute difference of two consec numbers is
% greater than a given M, if it finishes it returns true, if at
% any point the result is < m it returns false
%(i,i)

ok([T1,T2],M):-
    absoluteDifference(T1,T2,Result),
    Result >= M,!.
ok([T1,T2|L],M):-
    absoluteDifference(T1,T2,Result),
    Result >= M,
    ok([T2|L],M).

%computes a sequence from 1 to N and checks if all the
%consecutive numbers have the abs diff >=m
%(i,i,o)
main(N,M,Result):-
    computeSequence(N,1,Result),
    ok(Result,M).

%uses find all to get all the solutions
%MiniResult is the result computed at each step by main
%main is the goal
%Result is the unified list of all miniResults
%(i,i,o)
getAll(N,M,Result):-
    findall(MiniResult,main(N,M,MiniResult),Result).



