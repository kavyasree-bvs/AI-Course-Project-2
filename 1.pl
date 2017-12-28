%facts
parent(bart,homer).
parent(bart,marge).
parent(lisa,homer).
parent(lisa,marge).
parent(maggie,homer).
parent(maggie,marge).
parent(homer,abraham).
parent(herb,abraham).
parent(tod,ned).
parent(rod,ned).
parent(marge,jackie).
parent(patty,jackie).
parent(selma,jackie).
female(maggie).
female(lisa).
female(marge).
female(patty).
female(selma).
female(jackie).
male(bart).
male(homer).
male(herb).
male(burns).
male(smithers).
male(tod).
male(rod).
male(ned).
male(abraham).

%rules
%the brother of X is Y
brother(X,Y) :- 
	male(Y),
	parent(X,Z),
	parent(Y,Z),
	not(X=Y).
%the sister of X is Y
sister(X,Y) :- 
	female(Y),
	parent(X,Z),
	parent(Y,Z),
	not(X=Y).
%the aunt of X is Y
aunt(X,Y) :- 
	female(Y),
	parent(X,Z),
	sister(Z,Y),
	not(X=Y).
%the uncle of X is Y
uncle(X,Y) :- 
	male(Y),
	parent(X,Z),
	brother(Z,Y),
	not(X=Y).
%the grandfather of X is Y
grandfather(X,Y) :- 
	male(Y),
	parent(X,Z),
	parent(Z,Y),
	not(X=Y).
%the granddaughter of X is Y
granddaughter(X,Y) :- 
	female(Y),
	parent(Y,Z),
	parent(Z,X),
	not(X=Y).
%the ancestor of X is Y
ancestor(X,Y) :- 
	parent(X,Y),
	not(X=Y).
ancestor(X,Y) :- 
	parent(X,Z),
	ancestor(Z,Y),
	not(X=Y).
%the descendant of X is Y
descendant(X,Y) :- 
	ancestor(Y,X),
	not(X=Y).
%the unrelated of X is Y
unrelated(X,Y) :- 
	not(brother(X,Y)),
	not(sister(X,Y)),
	not(aunt(X,Y)),
	not(uncle(X,Y)),
	not(ancestor(X,Y)),
	not(descendant(X,Y)),
	not(X=Y).
