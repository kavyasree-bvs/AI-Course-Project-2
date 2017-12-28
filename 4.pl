divisible(N,X) :- M is N mod X,M=0.

factor(1,[]).

factor(X,[Factor1|T]) :-
   X > 1,
   between(2,X,Factor1), 
   NewX is X // Factor1,
   prime(Factor1),
   divisible(X,Factor1),
   factor(NewX,T),
   msort([Factor1|T], [Factor1|T]).

prime(N) :-
	D is N-1,
	has_no_divisors_below(N,D).

has_no_divisors_below(_, 1).

has_no_divisors_below(N,D) :-
	D>0,
	R is N mod D,
	not(R=0),
	NewD is D-1,
	has_no_divisors_below(N,NewD).