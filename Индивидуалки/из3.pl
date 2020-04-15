/*В файле дан текст. Переставить и вывести в отдельный файл 
строки заданного текста в соответствии с ростом доли согласных в строках.*/


read_line(Line):-
    get_code(H), 
    (
        code_type(H, end_of_line), !;
        code_type(H, end_of_file), !;
        Line = [H|T], read_line(T)
    ).


consonants(List):-
	List = [98, 99, 100, 102, 103, 104, 106, 107, 108, 
	109, 110, 112, 113, 114, 115, 116, 118, 119, 120, 122].


length(List, Length):-
	length(List, 0, Length).
length([], Length, Length):-!.
length([H|T], Len, Length):-
	Curr is Len+1, length(T, Curr, Length).


num_cons([], _, _):-!.
num_cons([H|T], Cons, Num):-
	if(is_cons(H), N is Num+1, N is Num), num_cons(T, Cons, N).


is_cons(_, []):- false.
is_cons(Code, [H|T]):-
	if(Code = H, true, is_cons(Code, T)).


%	open file
%	read line 
%	get length and consonants number
%	save line in new list as list itself, first element is ratio
%	sort list and print


text():-
	see("D:\repos\Prolog\Индивидуалки\text.txt"),
	text(List), seen, 
	tell("D:\repos\Prolog\Индивидуалки\text changed.txt"),
	to_file(List), told.
text(List):-
	read_line(Line), length(Line, Length), Length > 0, L is Line,
	consonants(Cons), num_cons(L, Cons, Num), R is Num/Length,
	append(List, [R|Line], NewList), text(NewList).


to_file(List):-
	sort(List, Sorted), print(Sorted).


sort([], _):-!.
sort(List, Sorted):-
	find_min(List, R), sort(List, Sorted, R, List).
sort([[R|L]|T], Sorted, R, List):-
	append(Sorted, L, NewSorted), delete([R|L], List, NewList),
	sort(NewList, NewSorted).
sort([[Y|L]|T], Sorted, R, List):-
	sort(T, Sorted, R, List).


delete(_, [], List):-!.
delete(El, [El|T], List):-
	delete(El, T, List).
delete(EL, [H|T], List):-
	delete(El, T, [H|List]).
