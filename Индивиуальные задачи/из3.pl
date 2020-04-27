/*В файле дан текст. Переставить и вывести в отдельный файл
строки заданного текста в соответствии с ростом доли согласных в строках.*/


if(Cond, Then, Else):-
	Cond -> Then; Else.
if(Cond, Then):-
	Cond -> Then.


text:- 
	see('d:/text.txt'), tell('d:/text changed.txt'), 
	read_line(Line), read_text(List, Line), 
	seen, told, writeln("Done.").


read_text(List, ''):-
	to_file(List), !.
read_text(List, Line):-
	consonants(Cons), string_chars(Line, Chars),
	count(Chars, Num, 0),
	string_length(Line, Len), R is Num / Len, 
	append(List, [[R, Line]], NewList), 
	read_line(NLine), read_text(NewList, NLine).


consonants(Cons):-
	Cons = [b, c, d, f, g, h, j, k, l, m, n, p, 
		q, r, s, t, v, w, x, y, z, 'B', 'C', 'D', 
		'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 
		'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'].


count([], Num, N):- 
	Num is N.
count([H|T], Num, N):-
	consonants(Cons),
	if(
		is_consonant(H, Cons), 
		(N1 is N + 1, count(T, Num, N1)), 
		count(T, Num, N)
	).


is_consonant(Char, []):- false.
is_consonant(Char, [Char|T]):- true.
is_consonant(Char, [H|T]):-
	is_consonant(Char, T).


read_line(Line):-
	readln(Words),
	if(
		Words = [], 
		Line = '', 
		atomic_list_concat(Words, ' ', Line)
		).


to_file(List):-
	sort_list(List). 


sort_list(List):-
	min_key(List, R, 1), sort_list(List, Sorted, R, List).

sort_list(_, Sorted, _, []):-
	print(Sorted).
sort_list([], Sorted, R, List):-
	sort_list(List, Sorted, R, List).

sort_list([[R, Line]|T], Sorted, R, List):-
	append(Sorted, [Line], NewSorted), 
	delete(List, [R, Line], NewList),
	min_key(NewList, Min, 1), 
	sort_list(NewList, NewSorted, Min, NewList).

sort_list([[Y, _]|T], Sorted, R, List):-
	sort_list(T, Sorted, R, List).
	

min_key([], R, M):-
	R is M.
min_key([[N, Line]|T], R, M):-
	N < M, min_key(T, R, N).
min_key([[H, L]|T], R, M):-
	min_key(T, R, M).


print([]):-!.
print([H|T]):-
	writeln(H), print(T).
