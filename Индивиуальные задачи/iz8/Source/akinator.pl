:- dynamic class/2.
:- dynamic type/2.
:- dynamic sentient/2.
:- dynamic polymorphy/2.
:- dynamic activity/2.
:- dynamic habitat/2.
:- dynamic abilities/2.


if(Cond, Then, Else):-
	Cond -> Then; Else.
if(Cond, Then):-
	Cond -> Then.


monster:-
	read_base,
	get_class(C), get_type(T), 
	get_sentient(S), get_polymorphy(P), 
	get_activity(Ac), get_habitat(H), 
	get_abilities(Ab), 
	get_monster([M, C, T, S, P, Ac, H, Ab]),
	if(M = nil, !, writeln(M)),
	base_to_file, restore_base.


get_class(Class):-
	writeln("\nTo which category your monster belongs?"),
	writeln("1. Cursed ones."),
	writeln("2. Draconids"),
	writeln("3. Elementa"),
	writeln("4. Hybrids"),
	writeln("5. Insectoids"),
	writeln("6. Necrophages"),
	writeln("7. Ogroids"),
	writeln("8. Relicts"),
	writeln("9. Specters"),
	writeln("10. Vampires"),
	read(Class).


get_type(Type):-
	writeln("\nIs your monster a loner or it lives in a pack?"),
	writeln("0. Loner."),
	writeln("1. Flock"),
	writeln("2. Could be both cases."),
	read(Type).


get_sentient(Sentient):-
	writeln("\nIs it sentient?"),
	writeln("0. No."),
	writeln("1. Yes"),
	read(Sentient).


get_polymorphy(Poly):-
	writeln("\nCan it change itself in some ways?"),
	writeln("0. No."),
	writeln("1. Yes"),
	read(Poly).


get_activity(Activ):-
	writeln("\nWhen is your monster most active?"),
	writeln("0. At night."),
	writeln("1. In the daytime."),
	writeln("2. Could be both cases or doesn't really matter."),
	read(Activ).


get_habitat(Habitat):-
	writeln("\nWhere it could be found?"),
	writeln("0. Nearly everywhere."),
	writeln("1. In the mountains, hills, or caves."),
	writeln("2. In water bodies."),
	writeln("3. In rural areas."),
	writeln("4. In the woods."),
	writeln("5. Underground."),
	writeln("6. Cemeteries, batllefields."),
	writeln("7. Castles, ruins."),
	writeln("8. Somewhere else."),
	read(Habitat).


get_abilities(Abil):-
	writeln("\nWhich tactic does it use in battle mostly?"),
	writeln("0. None."),
	writeln("1. Disappears and reappears."),
	writeln("2. Becomes invisible."),
	writeln("3. Summons other monsters or beasts."),
	writeln("4. Stuns the enemy."),
	writeln("5. Poisons the enemy."),
	writeln("6. Blinds the enemy."),
	writeln("7. Attacks from height."),
	writeln("8. Attacks with elemental forces."),
	read(Abil).


add_monster(Name, C, T, S, P, Ac, H, Ab):-
	writeln("\nNo matches found."),
	writeln("Do you want to add your monster to the base?"),
	writeln("0. No."),
	writeln("1. Yes."),
	read(F),
	if(
		F = 1, 
		(writeln("\nWrite name:"), read(Name), 
		add_to_base(Name, C, T, S, P, Ac, H, Ab))
	).


read_base(Path):-
	see(Path),
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
get_monster([nil, C, T, S, P, Ac, H, Ab]):-
	add_monster(_, C, T, S, P, Ac, H, Ab).


print([]):- nl.
print([H|T]):-
	write(H), write("\t"), print(T).

