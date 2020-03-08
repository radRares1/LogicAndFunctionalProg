solve(_, NumberOfSteps) :- NumberOfSteps = 0.
solve([LHead | LTail], NumberOfSteps) :-
    LHead = NumberOfSteps,
    NumberOfStepsDecremented is NumberOfSteps - 1,
    solve(LTail, NumberOfStepsDecremented) .
