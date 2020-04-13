
if(Cond, Then, Else):-
    Cond -> Then; Else.
if(Cond, Then):-
    if(Cond, Then, !).
if_not(Cond, Else):-
    if(Cond, !, Else).


is_prime(X):-
    if(X > 1,(H is div(X, 2), is_prime(X, 2, H)), false).
is_prime(X, D, H):-
    D =< H, R is mod(X, D),
    if(R =\= 0, (D1 is D+1, is_prime(X, D1, H)), false).
is_prime(_, D, H):-
    D > H, true.


dividers(X):-
    dividers(X, X, [], 2).
dividers(X, Y, List, Z):-
    Z < X, M is mod(Y, Z),
    if((M = 0, Y > 1, is_prime(Z)), (Y1 is Y/Z, append(List, [Z], NewList),
        dividers(X, Y1, NewList, Z)), (Z1 is Z+1, dividers(X, X, List, Z1))).
dividers(X, _, List, X):-
    if(is_prime(X), (append(List, [X], NewList), print(NewList)), print(List)). 


print([]).
print([H|T]):-
    write(H), write(" "), print(T).
