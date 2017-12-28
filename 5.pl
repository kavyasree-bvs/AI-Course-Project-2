%bitvec(N,X)
%iterating from N to 1
%choose either 0 or 1 every time
%and append it to the list

bitvec(0,[]).
bitvec(N,[D|Ds]) :-
    N > 0,
    member(D,[0,1]),
    N1 is N - 1,
    bitvec(N1,Ds).

count([],X,0).
count([X|T],X,Y):- count(T,X,Z), Y is 1+Z.
count([X1|T],X,Z):- X1\=X,count(T,X,Z).

%code(N,B,L)
%check if no of ones is B or not
code(N,B,L):-
	bitvec(N,L),
	count(L,1,Y),
	Y==B.