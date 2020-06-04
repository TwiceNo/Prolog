:- dynamic class/2.
:- dynamic type/2.
:- dynamic sentient/2.
:- dynamic polymorphy/2.
:- dynamic activity/2.
:- dynamic habitat/2.
:- dynamic abilities/2.


read_base(Path):-
	see(Path),
	readln(Line), read_monsters(Line), seen.


read_monsters([]).
read_monsters([M, C, T, S, P, Ac, H, Ab]):-
	assert(class(M, C)),
	assert(type(M, T)), 
	assert(sentient(M, S)),
	assert(polymorphy(M, P)),
	assert(activity(M, Ac)),
	assert(habitat(M, H)),
	assert(abilities(M, Ab)),
	readln(Next), read_monsters(Next).


restore_base:-
	abolish(class, 2), abolish(type, 2), 
	abolish(sentient, 2), abolish(polymorphy, 2), 
	abolish(activity, 2), abolish(habitat, 2), 
	abolish(abilities, 2).


add_to_base([M, C, T, S, P, Ac, H, Ab]):-
	assert(class(M, C)), 
	assert(type(M, T)), 
	assert(sentient(M, S)),
	assert(polymorphy(M, P)),
	assert(activity(M, Ac)),
	assert(habitat(M, H)),
	assert(abilities(M, Ab)).


base_to_file(Path):-
	tell(Path),
	repeat,
	(
		(class(M, C),
		type(M, T), 
		sentient(M, S),
		polymorphy(M, P),
		activity(M, Ac),
		habitat(M, H),
		abilities(M, Ab),
		print([M, C, T, S, P, Ac, H, Ab]), fail); !
	), told.


get_monster([M, C, T, S, P, Ac, H, Ab]):-
	class(M, C),
	type(M, T), 
	sentient(M, S),
	polymorphy(M, P),
	activity(M, Ac),
	habitat(M, H),
	abilities(M, Ab).


print([]):- nl.
print([H|T]):-
	write(H), write("\t"), print(T).

