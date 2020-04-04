/*����� 3797 �������� ���������� ���������.
������ �������, ����� ���������� ������� ����� ����� �������
� ���������� �������� �� ������ �����: 3797, 797, 97 � 7.
���������� �� ����� �������� ������ ������: 3797, 379, 37 � 3.
������� ����� ������� �����, ������� 1000000 ������� ����� ��������
����� ������� � ������ ������. ����������. 2, 3, 5 � 7 �� ���������
���������� �������� �������.
������ ������ ���� ������ ��� ������������� �������.


1. Make prime (in range (8, 1000000))
2. For each prime check the description


is_prime
cut_right
cut_left
next_prime
sum

*/


sum :- sum(0, 11).
sum(S, X):-
    X < 1000000, next_prime(X, NX), X1 is X, X2 is X,
    cut_right(X1)*cut_left(X2) -> (S1 is S+X, sum(S1, NX)); sum(S, NX).
sum(S, X):-
    X >= 1000000, write("Sum = "), write(S).
