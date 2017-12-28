%TC 1
visited(1,1).
visited(2,1).
visited(1,2).
stench(2,1).
breeze(1,2).

%TC 2
%visited(1,1).
%visited(2,1).
%visited(1,2).
%stench(2,1).
%breeze(1,2).
%visited(2,2).


%TC 3
%visited(4,1).
%visited(4,2).
%visited(4,3).
%visited(4,4).
%stench(4,3).
%breeze(4,2).
%breeze(4,1).

%col,row
%col numbering from left to right as 1,2,3,4
%rol numbering from bottom to top as 1,2,3,4

inRange(X,Y):-
	between(1,4,X),
	between(1,4,Y).

%X,Y+1 right
neighbors(X,Y,Z,W):-
	%inRange(X,Y),
	T is Y+1,
	inRange(X,T),
	Z is X,
	W is T.

%X,Y-1 left
neighbors(X,Y,Z,W):-
	%inRange(X,Y),
	B is Y-1,
	inRange(X,B),
	Z is X,
	W is B.

%X-1,Y bottom
neighbors(X,Y,Z,W):-
	%inRange(X,Y),
	L is X-1,
	inRange(L,Y),
	Z is L,
	W is Y.

%X+1,Y top
neighbors(X,Y,Z,W):-
	%inRange(X,Y),
	R is X+1,
	inRange(R,Y),
	Z is R,
	W is Y.

%the unvisited neighbors of visited ones
candidate(X,Y):-
	inRange(X,Y),
	not(visited(X,Y)),
	neighbors(X,Y,Z,W),
	visited(Z,W).

%each neighbor is breeze free
notPit(X,Y):-
	inRange(X,Y),
	visited(C,R),
	inRange(C,R),
	neighbors(X,Y,C,R),
	not(breeze(C,R)).

%each neighbor is stench free
notWumpus(X,Y):-
	inRange(X,Y),
	visited(C,R),
	inRange(C,R),
	neighbors(X,Y,C,R),
	not(stench(C,R)).

move(X,Y):-
	%none of the neighbors of stench or breeze senses
	inRange(X,Y),
	candidate(X,Y),
	notPit(X,Y),
	notWumpus(X,Y).