%Дан произвольный неориентированный граф. 
%Построить наибольшее паросочетание.

if(Cond, Then, Else):-
	Cond -> Then; Else.
if(Cond, Then):-
	Cond -> Then.


match:-
	writeln("Enter the edges, '-' to stop."),
	read_edges([], Edges), longest_match(Edges, [], Match), 
	writeln("The longest match:"), print(Match).


read_edges(List, Edges):-
	readln(Edge), get_edge(Edge, V),
	if(
		V = '-', 
		Edges = List, 
		(append(List, [Edge], NList), read_edges(NList, Edges))
	).


longest_match([], Curr, Match):-
	Match = Curr.
longest_match([H|T], Curr, Match):-
	get_match([H|T], [], M), length(M, L1), length(Curr, L2),
	if(L1 > L2, longest_match(T, M, Match), longest_match(T, Curr, Match)).


get_match([], Curr, Match):-
	Match = Curr.
get_match([H|T], Curr, Match):-
	get_edge(H, V1, V2), 
	delete([H|T], [V1, _], L1), delete(L1, [_, V1], NoV1),
	delete(NoV1, [V2, _], L2), delete(L2, [_, V2], NoV2),
	append(Curr, [H], NCurr), 
	get_match(NoV2, NCurr, Match).


get_edge([H|_], H).
get_edge([H, T], H, T).


print([]).
print([H|T]):-
	get_edge(H, V1, V2), write(V1), write(" "), write(V2), nl, print(T).
