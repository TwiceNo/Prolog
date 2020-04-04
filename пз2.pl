%2

max(X, Y, U, X) :- X>Y, X>U,!.
max(_, Y, U, Y) :- Y>U,!.
max(_, _, U, U).

%3

fact(0, 1):-!.
fact(N, X):-N1 is N-1, fact(N1,X1), X is X1*N.

fact1(N, X) :- fact2(1, N, 1, X).
fact2(N, N,  X, X):-!.
fact2(I, N, Y, X):- I1 is I+1, Y1 is I1*Y, fact2(I1, N, Y1, X).


%4

fib(1, 1):-!.
fib(2, 1):-!.
fib(N, X):-N1 is N-1, N2 is N-2, fib(N1, A), fib(N2, B), X is A+B.


%5

pr(2):-!.
pr(X):-pr1(3, X).
pr1(A, A):-!.
pr1(I, A):- R is A mod I, R=0, !, fail.
pr1(I, A):- I1 is I+1, pr1(I1, A).

del(A, X):- npr(A, A, N).
npr(I, A, I):- pr(I), R is A mod I, R=0, !.
npr(I, A, X):- I1 is I-1, npr(I1, A, X).
