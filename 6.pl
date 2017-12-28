f_X(A,B):-
	B is A -(sin(A)/cos(A)).

sin_zero(X,Y):-
	X_i is X,
	f_X( X_i, Z),
	W is sin(Z),
	W > -0.0001,
	W < 0.0001,
	Y = Z.

sin_zero(X,Y):-
	X_i is X,
	f_X( X_i, Z),
	%print(Z),
	W is sin(Z),
	W < -0.0001,
	sin_zero(Z,Y).

sin_zero(X,Y):-
	X_i is X,
	f_X( X_i, Z),
	%print(Z),
	W is sin(Z),
	W > 0.0001,
	sin_zero(Z,Y).
