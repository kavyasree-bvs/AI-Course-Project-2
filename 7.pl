solve_cryptarithmetic([S,E,N,D,M,O,R,Y]):- 
	select(S,[0,1,2,3,4,5,6,7,8,9],WS), % W means Without
	not(S=0),
	select(E,WS,WES),
	select(N,WES,WNES),
	select(D,WNES,WDNES),
	select(M,WDNES,WMDNES),
	not(M=0),
	select(O,WMDNES,WOMDNES),
	select(R,WOMDNES,WROMDNES),
	select(Y,WROMDNES,WYROMDNES),
	MONEY is 10000*M+1000*O+100*N+10*E+Y,
	SEND is 1000*S+100*E+10*N+D,
	MORE is 1000*M+100*O+10*R+E,
	MONEY is SEND+MORE.