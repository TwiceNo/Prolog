%Дан произвольный неориентированный граф. 
%Построить наибольшее паросочетание.


if(Cond, Then, Else):-
	Cond -> Then; Else.
if(Cond, Then):-
	if(Cond, Then, !).


match:-
	read_graph(Nodes, Edges), max_match(Edges, Match, 0), 
	print(Match).


read_graph(Nodes, Edges):-
	writeln("Type -1 to stop"),
	writeln("\nNodes:"), read_list(Nodes).
%	writeln("\nType as an example: [A, B]"),
%	writeln("\nEdges:"), read_list(Edges),
%	writeln(Nodes), writeln(Edges).


test:-
	read(El), writeln(El).


read_list(List):-
	read(El), read_list(List, El).
read_list(List, -1):-!.
read_list(List, El):-
	append(List, [El], NewList), read(NewEl),
	read_list(NewList, NewEl).
	


max_match([H|T], Match, Len):-
	make_match([H|T], SomeMatch), len(SomeMatch, L),
	if(L > Len, max_match(T, SomeMatch), max_match(T, Match)).


make_match(Edges, Match):-
	make_match(Edges, Match, []).
make_match([[A, B]|T], Match, Vis):-
	if(
			is_used(A, B, Vis), make_match(T, Match, Vis),
			(
				append(Match, [A, B], NewMatch), append(Vis, A, Vis1),
				append(Vis1, B, Visited), make_match(T, NewMatch, Visited)
			)
		).


is_used(_, _, []):- false.
is_used(A, _, [A|_]):- true.
is_used(_, B, [B|_]):- true.
is_used(A, B, [H|T]):-
	is_used(A, B, T).	


len([], _):- !.
len([H|T], Len):-
	if(var(Len), Len is 0), NewLen is Len + 1, len(T, NewLen).

