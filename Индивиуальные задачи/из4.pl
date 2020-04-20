in_list([El|_],El).
in_list([_|T],El):-
	in_list(T,El).


/*
Есть четыре боксера: Томас Герберт, Герберт Френсис, Френсис Джеймс
и Джеймс Томас. 
Герберт намного сильнее Томаса. 
Френсис сильнее и Томаса и Герберта. 
Герберт слабее Джеймса, но сильнее Френсиса. 
В каком порядке нужно расположить боксеров от слабейшего к сильнейшему?
 */


 boxers:-
	Boxers = [_, _, _, _], 	% weak, strong, stronger, strongest
	(
		%Герберт намного сильнее Томаса. Имена
		in_list(Boxers, [thomas_herbert, _, herbert_francis, _]);
		in_list(Boxers, [thomas_herbert, _, _, herbert_francis]);
		in_list(Boxers, [_, thomas_herbert, _, herbert_francis]);

		%Герберт намного сильнее Томаса. Фамилии
		in_list(Boxers, [james_thomas, _, thomas_herbert, _]);
		in_list(Boxers, [james_thomas, _, _, thomas_herbert]);
		in_list(Boxers, [_, james_thomas, _, thomas_herbert])
	),

	(
		(
			(
				%Френсис сильнее Томаса. Имена
				in_list(Boxers, [thomas_herbert, _, francis_james, _]);
				in_list(Boxers, [_, thomas_herbert, francis_james, _]);
				in_list(Boxers, [thomas_herbert, _, _, francis_james]);
				in_list(Boxers, [_, thomas_herbert, _, francis_james]);
				in_list(Boxers, [_, _, thomas_herbert, francis_james])
			),

			(
				%Френсис сильнее Герберта. Имена
				in_list(Boxers, [herbert_francis, _, francis_james, _]);
				in_list(Boxers, [_, herbert_francis, francis_james, _]);
				in_list(Boxers, [herbert_francis, _, _, francis_james]);
				in_list(Boxers, [_, herbert_francis, _, francis_james]);
				in_list(Boxers, [_, _, herbert_francis, francis_james])
			)
		);

		(
			(
				%Френсис сильнее Томаса. Фамилии
				in_list(Boxers, [james_thomas, _, herbert_francis, _]);
				in_list(Boxers, [_, james_thomas, herbert_francis, _]);
				in_list(Boxers, [james_thomas, _, _, herbert_francis]);
				in_list(Boxers, [_, james_thomas, _, herbert_francis]);
				in_list(Boxers, [_, _, james_thomas, herbert_francis])
			),

			(
				%Френсис сильнее Герберта. Фамилии
				in_list(Boxers, [thomas_herbert, _, herbert_francis, _]);
				in_list(Boxers, [_, thomas_herbert, herbert_francis, _]);
				in_list(Boxers, [thomas_herbert, _, _, herbert_francis]);
				in_list(Boxers, [_, thomas_herbert, _, herbert_francis]);
				in_list(Boxers, [_, _, thomas_herbert, herbert_francis])
			)
		)
	),
 
	(
		(
			%Герберт слабее Джеймса, но сильнее Френсиса. Имена
			in_list(Boxers, [francis_james, herbert_francis, james_thomas, _]);
			in_list(Boxers, [francis_james, herbert_francis, _, james_thomas]);
			in_list(Boxers, [francis_james, _, herbert_francis, james_thomas]);
			in_list(Boxers, [_, francis_james, herbert_francis, james_thomas])
		);

		(
			%Герберт слабее Джеймса, но сильнее Френсиса. Фамилии
			in_list(Boxers, [herbert_francis, thomas_herbert, francis_james, _]);
			in_list(Boxers, [herbert_francis, thomas_herbert, _, francis_james]);
			in_list(Boxers, [herbert_francis, _, thomas_herbert, francis_james]);
			in_list(Boxers, [_, herbert_francis, thomas_herbert, francis_james])
		)
	),
	writeln(Boxers).
