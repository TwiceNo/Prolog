skip_space([32|T], A1):- skip_space(T, A1), !.
skip_space(A1, A1).

get_word([], [], []):-!.
get_word(A, Word, A2):- get_word(A, [], Word, A2).
get_word([], Word, Word, []).
get_word([32|T], Word, Word, T):-!.
get_word([H|T], W, Word, A2):- append(W, [H], W1), get_word(T, W1, Word, A2).




split_space(A, B, K):- split_space(A, [], B, 0, K).
split_space([], B, B, K, K):-!.
split_space(A, Words, B, I, K):-skip_space(A, A1), get_word(A1, Word, A2),
    Word \=[], append(Words, [word], Words_new), I1 is I+1, split_space(A2, Words_new, B, I1,




                                                                        skip_space([32|T], A1):- skip_space(T, A1), !.
skip_space(A1, A1).

get_word([], [], []):-!.
get_word(A, Word, A2):- get_word(A, [], Word, A2).
get_word([], Word, Word, []).
get_word([32|T], Word, Word, T):-!.
get_word([H|T], W, Word, A2):- append(W, [H], W1), get_word(T, W1, Word, A2).




split_space(A, B, K):- split_space(A, [], B, 0, K).
split_space([], B, B, K, K):-!.
split_space(A, Words, B, I, K):-skip_space(A, A1), get_word(A1, Word, A2),
    Word \=[], append(Words, [word], Words_new), I1 is I+1, split_space(A2, Words_new, B, I1, K), !.
split_space(A,Words, B, I, K):-skip_space(A, A1), split_space(A1, Words, B, I ,K).

