/*
Составить предикат средствами SWI-Prolog, который составляет и выводит 
в файл все слова алфавита {a,b,c,d,e,f} длины n, в которых ровно k букв F,
ровно ровно m букв С остальные буквы встречаются ровно 1 раз или не встречаются
вообще.
*/

words(N, K, M):-
	(N < (M + K)); (N - M - K > 4), writeln("Недопустимые условия"), !.
words(N, K, M):-
	tell('words.txt'), make_words(N, K, M, Words), told.


make_words(N, K, M, Wods):-
	push([], f, K, 0, Word), push(Word, c, M, 0, NWord), N1 is N - K - M, 
	get_rest(Rest),
	repeat,
	(
		(comb(Rest, R, N1), append(NWord, R, NewWord),
		permutations(NewWord), fail); !
	).


push(W, _, N, N, Word):-
	Word = W, !.
push(W, C, N, I, Word):-
	append(W, [C], NW), I1 is I + 1, push(NW, C, N, I1, Word).


get_rest(Rest):-
	Rest = [a, b, d, e].


comb([], [], 0).
comb([H|List], [H|T], N):- 
	N > 0, N1 is N - 1, comb(List, T, N1).
comb([_|List], T, N):- 
	comb(List, T, N).



permutations(Word):-
	repeat,
	(
		(permutation(Word, W), printf(W), fail); !
	).


permutation([], []).
permutation(L, [H|T]):-
	select(H, L, T1), permutation(T1, T).
 

select(H, [H|T], T).
select(H, [Y|T], [Y|T1]):-
	select(H, T, T1).


printf([]):- nl.
printf([H|T]):-
	write(H), printf(T).






test:-
	repeat,
	(
		(comb([a, b, c], X, 2), 
		permutations(X), fail); !
	).
