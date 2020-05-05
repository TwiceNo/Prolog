/*
Составить предикат средствами SWI-Prolog, который составляет и выводит 
в файл все слова алфавита {a,b,c,d,e,f} длины n, в которых ровно k букв F,
ровно ровно m букв С остальные буквы встречаются ровно 1 раз или не встречаются
вообще.
*/

:- dynamic word/1.


if(Cond, Then):-
	Cond -> Then.


words(N, K, M):-
	(N < M + K; N - M - K > 4), writeln("Invalid conditions"), !.
words(N, K, M):-
	 make_words(N, K, M), remove_duplicates,
	 tell('d:/words.txt'), print, told, abolish(word, 1).


make_words(N, K, M):-
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
		(permutation(Word, W), atomic_list_concat(W, N), 
		assert(word(N)), fail); !
	).


permutation([], []).
permutation(L, [H|T]):-
	select(H, L, T1), permutation(T1, T).
 

select(H, [H|T], T).
select(H, [Y|T], [Y|T1]):-
	select(H, T, T1).


print:-
	repeat,
	(
		(word(X), writeln(X), fail); !
	).


remove_duplicates:-
	repeat,
	(
		(word(X), retractall(word(X)), assert(word(X)), fail); !
	).

