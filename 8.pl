%ttt matrix
%11 12 13
%21 22 23
%31 32 33

% assert these facts as the state description

%TC 1
p(x,1,1).
p(x,1,3).
p(o,3,1).
p(o,3,3).

%TC 2
%p(x,1,1).
%p(x,2,3).
%p(o,3,1).
%p(o,3,3).

%TC 3
%p(x,1,3).
%p(x,3,1).
%p(o,1,1).
%p(o,3,3).

b(I,J):-
	between(1,3,I),
	between(1,3,J),
	not(p(x,I,J)),
	not(p(o,I,J)).

twoInARow(P,R):-
	p(P,R,J1),
	p(P,R,J2),
	not(J1=J2),
	J1>J2,
	T is 6-J1-J2,
	b(R,T),
	between(1,3,J1),
	between(1,3,J2).

twoInACol(P,C):-
	p(P,I1,C),
	p(P,I2,C),
	not(I1=I2),
	I1>I2,
	T is 6-I1-I2,
	b(T,C),
	between(1,3,I1),
	between(1,3,I2).

twoInADiag(P,R,C):-
	between(1,3,R),
	between(1,3,C),
	between(-2,2,K1),
	between(-2,2,K2),
	not(K1=K2),
	K1>K2,
	I1 is R+K1,
	I2 is R+K2,
	J1 is C+K1,
	J2 is C+K2,
	between(1,3,I1),
	between(1,3,I2),
	between(1,3,J1),
	between(1,3,J2),
	p(P,I1,J1),
	p(P,I2,J2),
	b(R,C),
	R==C.

twoInADiag(P,R,C):-
	between(1,3,R),
	between(1,3,C),
	b(R,C),
	S is R+C,
	S = 4,
	between(-2,2,K1),
	between(-2,2,K2),
	not(K1=K2),
	K1>K2,
	I1 is R-K1,
	I2 is R-K2,
	J1 is C+K1,
	J2 is C+K2,
	between(1,3,I1),
	between(1,3,I2),
	between(1,3,J1),
	between(1,3,J2),
	p(P,I1,J1),
	p(P,I2,J2).

canWin(P,R,C):-
	twoInARow(P,R).

canWin(P,R,C):-	
	twoInACol(P,C).

canWin(P,R,C):-
	twoInADiag(P,R,C).

ttt_move(P,R,C):-
	between(1,3,R),
	between(1,3,C),
	b(R,C),
	canWin(P,R,C),
	print('go for win!').

ttt_move(P,R,C):-
	between(1,3,R),
	between(1,3,C),
	b(R,C),
	not(canWin(P,R,C)),
	P=x,
	canWin(o,R,C),
	print('move to block opponent!').

ttt_move(P,R,C):-
	between(1,3,R),
	between(1,3,C),
	b(R,C),
	not(canWin(P,R,C)),
	P=o,
	canWin(x,R,C),
	print('move to block opponent!').

