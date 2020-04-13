/*
для введенного числа построить список всех простых делителей. если
делится на p^a, в списке p должно присутствовать a раз. список по
возрастанию.
*/

if(Cond, Then, Else):-
    Cond -> Then; Else.
if(Cond, Then):-
    if(Cond, Then, !).
if_not(Cond, Else):-
    if(Cond, !, Else).


dividers(X):-
    make_list(List, X), writeln(List).


make_list([], X):-
    make_list([], X, 2).
make_list(List, X, Y):-
    Y =< X, X1 is X, if(is_prime(Y), if(mod(X, Y) = 0,
                               (count(X1, Y, 0, List)))),
    Y1 is Y+1, make_list(List, X, Y1).


add([], El, N):-
    N > 0, N1 is N-1, add([El], El, N1).
add(L, El, N):-
    N > 0, N1 is N-1, add([L|El], El, N1).


count(1, Y, N, List):-
    add(List, Y, N).
count(X, Y, N, List):-
    X > 1, X1 is X/Y, N1 is N+1,
    count(X1, Y, N1, List).


is_prime(X):-
    if(X > 1,(H is div(X, 2), is_prime(X, 2, H)), false).
is_prime(X, D, H):-
    D =< H, R is mod(X, D),
    if(R =\= 0, (D1 is D+1, is_prime(X, D1, H)), false).
is_prime(_, D, H):-
    D > H, true.
