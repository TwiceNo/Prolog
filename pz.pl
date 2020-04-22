
max(X,Y,X):-X>Y.
max(X,Y,Y):-Y>=X.
max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

fact(0,1):-!.
fact(N,X):- N1 is N-1, fact(N1,X1), X is X1*N.
fact1(N,X):-fact2(1,N,1,X).
fact2(N,N,X,X):-!.
fact2(I,N,Y,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,N,Y1,X).

fib(1,1):-!.
fib(2,1):-!.
fib(N,X):- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.

fib1(N,X):-fib2(2,N,1,1,X).
fib2(N,N,_,X,X):-!.
fib2(I,N,A1,A2,X):- I1 is I+1, A3 is A1+A2, fib2(I1,N,A2,A3,X).

pr(2):-!.
pr(A):-pr1(2,A).
pr1(A,A):-!.
pr1(I,A):-R is A mod I, R=0,!,fail.
pr1(I,A):-I1 is I+1, pr1(I1,A).

nprdel(A,X):-n_pr(A,A,X).
n_pr(I,A,I):-pr(I),R is A mod I,R=0,!.
n_pr(I,A,X):-I1 is I-1,n_pr(I1,A,X).

pr3_1:-read(N),read_list(A,N),sum_list(A,S),write(S).
read_list(A,N):-r_l([],A,0,N).
r_l(A,A,N,N):-!.
r_l(B,A,I,N):-I1 is I+1, read(X), append(B,[X],B1), r_l(B1,A,I1,N).

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1),S is S1+Head.

pr3_2:-read(N),read_list(A,N),read(Ind),el_list(Ind,A,Elem),write(Elem).
el_list(0,[Head|_],Head):-!.
el_list(Ind,[_|Tail],Elem):-NextInd is Ind-1,el_list(NextInd,Tail,Elem).


pr3_4:-read(N),read_list(A,N),read(El),find(A,El).
find([X|_],X):-!.
find([_|Y],El):-find(Y,El).

write_list([]):-!.
write_list([H|T]):-write(H),write_list(T).

pr3_3:-read(N),read_list(A,N),min_list(A,M), write(M).
min_list([H|T],M):-m_l(T,H,M).
m_l([],M,M):-!.
m_l([H|T],Min,M):-H<Min,!,m_l(T,H,M).
m_l([_|T],Min,M):-m_l(T,Min,M).

pr3_5:-read(N),read_list(A,N),read(X),num_list(A,X,M), write(M).
num_list(A,X,M):-num_list(A,X,0,M).
num_list([X|_],X,I,I):-!.
num_list([],_,_,-1):-!.
num_list([_|T],X,I,M):-I1 is I+1,num_list(T,X,I1,M).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).
write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).


pr5_1:-read_str(A,N),write_str(A),write(","),write_str(A),write(","),write_str(A),nl,write(N).
pr5_2:-read_str(A,N),count_words(A,K),write(K).
count_words(A,K):-count_words(A,0,K).
count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(A,I,K):-skip_space(A,A1),count_words(A1,I,K).
skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).
get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).
get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).


sublist_count(List,Sublist,Count):-sublist_count(List,Sublist,Sublist,0,Count,0).
sublist_count([],_,_,Count,Count,_):-!.
sublist_count(List,[],Sublist,K,Count,1):-K1 is K+1,sublist_count(List,Sublist,Sublist,K1,Count,0).
sublist_count([H|T1],[H|T2],Sublist,K,Count,_):-sublist_count(T1,T2,Sublist,K,Count,1),!.
sublist_count([_|T1],_,Sublist,K,Count,_):-sublist_count(T1,Sublist,Sublist,K,Count,0).




count_words([],I,K,Flag,_):-K is I+1-Flag,!.
count_words([32|T],I,K,0,F):-count_words(T,I,K,1,F),!.
count_words([32|T],I,K,1,F):-count_words(T,I,K,1,F),!.
count_words([_|T],I,K,_,0):-I1 is I+1,count_words(T,I1,K,0,1).
count_words([_|T],I,K,_,1):-count_words(T,I,K,0,0).

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

r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).

pr_subset:-read(N),r_list(A,N),sub_set(B,A),write(B),nl,fail.

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[H|Set]):-sochet(Sub_set,K,Set).


make_alot(A,Set,K):-make_alot(A,Set,K,K).
make_alot([],[],_,_):-!.
make_alot(Sub_set,[H|T],K,0):-make_alot(Sub_set,T,K,K),!.
make_alot([H|Tail],[H|T],K,I):-I1 is I-1,make_alot(Tail,[H|T],K,I1).


sochet_rep(Sub_set,Set,K):-
		make_alot(Set_rep,Set,K),sochet(Sub_set,K,Set_rep).


pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),nl,
		write(WHO1),nl,write(WHO2).

/*
Имеется четыре котенка – Дружок, Елисей, Фантик и Мурлыка и четыре мальчика – Миша, Максим, Леня и Дима.
Каждый мальчик взял себе котенка любимого цвета. При этом:
1. Фантик – не рыжий, Мурлыка – не серый
2. Дружок – не белый, Елисей – не серый
3. У Миши – черный котенок, У Максима – Мурлыка
4. У Лени – Елисей, У Димы – белый котенок
5. Дима не взял Фантика, Дружок – не серый
Одно из этих пяти утверждений ложное, У какого мальчика какой котенок?
*/

in_list([El|_],El).
in_list([_|T],El):-
	in_list(T,El).

cats:-
      List = [_,_,_,_],
      (
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white])
	);
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,_]))
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,_]))

	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,_]))

	);
	(
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,_]))
	)
      ),
      write(List).


















