/*
Составить предикат средствами SWI-Prolog, который составляет и выводит 
в файл все слова алфавита {a,b,c,d,e,f} длины n, в которых ровно k букв F,
ровно ровно m букв С остальные буквы встречаются ровно 1 раз или не встречаются
вообще.
*/

if(Cond, Then, Else):-
	Cond -> Then; Else.
if(Cond, Then):-
	Cond -> Then.


words(N, K, M):-
	(N < (M + K)); (N - M - K > 4), writeln("Недопустимые условия"), !.
words(N, K, M):-
	tell('words.txt'), make_words(N, K, M), told.


make_words(N, K, M):-
	push([], f, K, 0, Word), push(Word, c, M, 0, NWord),
	N1 = N - K - M, push_rest(NWord, N1, 0). %,
%	print(NewWord), permutations(NewWord).


push(W, _, N, N, Word):-
	Word = 	W.
push(W, C, N, I, Word):-
	append(W, C, NW), I1 = I + 1, push(NW, C, N, I1, Word).


%push_rest(Word, N, 0).
	
	

test:-
	repeat,
	(
		(comb([a, b, c, d, e, f], X, 4), 
		writeln(X), fail); !
	).


comb([], [], 0).
comb([H|List], [H|T], N):- 
	N > 0, N1 is N - 1, comb(List, T, N1).
comb([_|List], T, N):- 
	comb(List, T, N).

/*
comb([], []).
comb([H|List], [H|T]):- 
	comb(List, T).
comb([_|List], T):- 
	comb(List, T).
*/