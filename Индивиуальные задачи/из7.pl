:- dynamic class/2.
:- dynamic type/2.
:- dynamic sentient/2.
:- dynamic polymorphy/2.
:- dynamic activity/2.
:- dynamic habitat/2.
:- dynamic abilities/2.


read_base:-
	see('d:/repos/prlg/prolog/monster base.txt'),
	readln(Line), read_base(Line), seen.
read_base([]).
read_base([M, C, T, S, P, Ac, H, Ab]):-
	assert(class(M, C)),
	assert(type(M, T)), 
	assert(sentient(M, S)),
	assert(polymorphy(M, P)),
	assert(activity(M, Ac)),
	assert(habitat(M, H)),
	assert(abilities(M, Ab)),
	readln(Next), read_base(Next).


restore_base:-
	abolish(class, 2), abolish(type, 2), 
	abolish(sentient, 2), abolish(polymorphy, 2), 
	abolish(activity, 2), abolish(habitat, 2), 
	abolish(abilities, 2).


add_to_base(M, C, T, S, P, Ac, H, Ab):-
	assert(class(M, C)),
	assert(type(M, T)), 
	assert(sentient(M, S)),
	assert(polymorphy(M, P)),
	assert(activity(M, Ac)),
	assert(habitat(M, H)),
	assert(abilities(M, Ab)).


base_to_file:-
	tell('d:/repos/prlg/prolog/monster base.txt'),
	repeat,
	(
		(get_monster(Monster), print(Monster), fail); !
	), told.


get_monster(Monster):-
	class(M, C),
	type(M, T), 
	sentient(M, S),
	polymorphy(M, P),
	activity(M, Ac),
	habitat(M, H),
	abilities(M, Ab),
	Monster = [M, C, T, S, P, Ac, H, Ab].


print([]):- nl.
print([H|T]):-
	write(H), write("\t"), print(T).


