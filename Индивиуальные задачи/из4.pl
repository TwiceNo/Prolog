in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


/*
Есть четыре боксера: Томас Герберт, Герберт Френсис, Френсис Джеймс
и Джеймс Томас. Герберт намного сильнее Томаса. Френсис сильнее и Томаса
и Герберта. Герберт слабее Джеймса, но сильнее Френсиса. В каком порядке
 нужно расположить боксеров от слабейшего к сильнейшему?
 */


 boxers:-
 	Boxers = [_, _, _, _],	% [name, much stronger than, stronger than, weaker than]
 	(
 		in_list(Boxers, [thomas_herbert, james_thomas, _, _]);
 		in_list(Boxers, [herbert_francis, thomas_herbert, _, _])
 	),
 	
 	(
 		in_list(Boxers, [herbert_francis, james_thomas, thomas_herbert, _]);
 		in_list(Boxers, [herbert_francis, thomas_herbert, james_thomas, _]);
 		in_list(Boxers, [francis_james, thomas_herbert, herbert_francis]);
 		in_list(Boxers, [francis_james, herbert_francis, thomas_herbert])
 	),

 	(
 		in_list(Boxers, [herbert_francis,])
 	)