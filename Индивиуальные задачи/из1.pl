if(Cond, Then, Else):-
    Cond -> Then; Else.
if(Cond, Then):-
    if(Cond, Then, !).
if_not(Cond, Else):-
    if(Cond, !, Else).


sum :- sum(0, 23).
sum(S, X):-
    X < 10000, X1 is X+1, S1 is S+X, 
    if(condition(X), sum(S1, X1), sum(S, X1)).
sum(S, X):-
    X = 10000, write("Sum = "), writeln(S), fail.


condition(X):-
    is_prime(X),
    if(cut_right(X), TimeSaver is 0, false), 
    if(cut_left(X), true, false).


is_prime(X):-
    if(X > 1,(H is div(X, 2), is_prime(X, 2, H)), false).
is_prime(X, D, H):-
    D =< H, R is mod(X, D),
    if(R =\= 0, (D1 is D + 1, is_prime(X, D1, H)), false).
is_prime(_, D, H):-
    D > H, true.


cut_right(X):-
    if(X > 9, R is div(X, 10), R is X), is_prime(R),
    if(R > 9, cut_right(R)).
cut_right(0):- true.


cut_left(X):-
    range(X, 1).
cut_left(X, R):-
    Y is mod(X, R), R1 is R / 10, is_prime(Y),
    if(Y > 9, cut_left(Y, R1)).


range(X, R):-
    if(X >= R, (R1 is R * 10, range(X, R1)), cut_left(X, R)).
