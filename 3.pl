remdups([],[]).

remdups([H|T],L) :- 
	member(H,T),
	remdups(T,L).

remdups([H|T],[H|T1]) :- 
	\+member(H,T),
    remdups(T,T1).