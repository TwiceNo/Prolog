
/*
Есть четыре боксера: Томас Герберт, Герберт Френсис, Френсис Джеймс
и Джеймс Томас. 
Герберт намного сильнее Томаса. 
Френсис сильнее и Томаса и Герберта. 
Герберт слабее Джеймса, но сильнее Френсиса. 
В каком порядке нужно расположить боксеров от слабейшего к сильнейшему?
 */


in_list([El|_],El).
in_list([_|T],El):-
	in_list(T,El).


much_stronger(Strong, Weak, []).
much_stronger(Strong, Weak, List):-
	in_list(List, [Strong, Somebody]),
	in_list(List, [Somebody, Weak]);
	much_stronger(Somebody, Weak, List).


boxers:-
	Boxers = [_, _, _], 
	
	(
		%Herbert much stronger than Thomas.
		
		%strong, weak

		much_stronger(herbert_francis, thomas_herbert, Boxers);
		
		much_stronger(thomas_herbert, james_thomas, Boxers)
	),

	(
		%Francis is stronger than Thomas and Herbert
		
		(
			in_list(Boxers, [francis_james, thomas_herbert]),
			much_stronger(francis_james, herbert_francis, Boxers)
		);

		(
			in_list(Boxers, [francis_james, herbert_francis]),
			much_stronger(francis_james, thomas_herbert, Boxers)
		);

		(
			much_stronger(francis_james, herbert_francis, Boxers),
			much_stronger(francis_james, thomas_herbert, Boxers)
		);

		(
			in_list(Boxers, [herbert_francis, james_thomas]),
			much_stronger(herbert_francis, thomas_herbert, Boxers)
		);

		(
			in_list(Boxers, [herbert_francis, thomas_herbert]),
			much_stronger(herbert_francis, james_thomas, Boxers)
		);

		(
			much_stronger(herbert_francis, thomas_herbert, Boxers),
			much_stronger(herbert_francis, james_thomas, Boxers)
		)
	),

	(
		%Herbert is weaker than James

		in_list(Boxers, [james_thomas, herbert_francis]);
		in_list(Boxers, [francis_james, thomas_herbert])
	),

	(
		%Herbert is stronger than Francis

		in_list(Boxers, [herbert_francis, francis_james]);
		in_list(Boxers, [thomas_herbert, herbert_francis])
	),


	print(Boxers).


print([]).
print([H|T]):-
	writeln(H), print(T).