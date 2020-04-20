read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr5:-read_str(A,N),name(Term,A),call(dynamic pr/1),asserta(pr(Term)),listing(pr).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).

b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_razm:-
		read_str(A,N),read(K),b_a_r(A,[]).
in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).
b_a_r([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,Perm):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm]).


sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

r_list(A,N):- r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).

pr_subset:-read(N),r_list(A,N),sub_set(B,A),write(B),nl,fail.


%%сочетание по к элементов

sochet([], _, 0):-!.
sochet([H|Sub_set], [H|Set], K):-
		K>0, K1 is K-1, sochet(Sub_set, Set, K1).
sochet(Sub_set, [_|Set], K):-
		sochet(Sub_set, Set, K).

%%сочетание с повторениями НА ДЗ

make_set([H|T], Set, I, N, K, M):-
		I<N, I1 is I+1, make_set([H|T],[H|Set], I1, N, K, M).
make_set([_|T], _, N, N, M, M):-
		make_set(T, [], 0, N, 0, M).
make_set([H|T], [H|Set], N, N, K, M):-
		K<M, K1 is K+1, make_set(T, Set, N, N, K1, M).
make_set([_|T], Set, N, N, K, M):-
		make_set(T, Set, N, N, K, M).






rcomb(Source, Set, N):-
		rcomb(Source, Set, N, 0).
rcomb([], _, _, _):-!.
rcomb([H|T], Set, N, N):-
		make_set(Set, H, 0, N), rcomb([T|_], [], N, 0).
rcomb([H|T], Set, N, I):-
		K is N-I, sochet([H|T], Set, K), make_set(Set, H, 0, K),
		I1 is I+1, rcomb([H|T], [], N, I1).
