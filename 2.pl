occupation(joe,oral_surgeon).
occupation(sam,patent_laywer).
occupation(bill,trial_laywer).
occupation(cindy,investment_banker).
occupation(joan,civil_laywer).
occupation(len,plastic_surgeon).
occupation(lance,heart_surgeon).
occupation(frank,brain_surgeon).
occupation(charlie,plastic_surgeon).
occupation(lisa,oral_surgeon).

address(joe,houston).
address(sam,pittsburgh).
address(bill,dallas).
address(cindy,omaha).
address(joan,chicago).
address(len,college_station).
address(lance,los_angeles).
address(frank,dallas).
address(charlie,houston).
address(lisa,san_antonio).

salary(joe,50000).
salary(sam,150000).
salary(bill,200000).
salary(cindy,140000).
salary(joan,80000).
salary(len,70000).
salary(lance,650000).
salary(frank,85000).
salary(charlie,120000).
salary(lisa,190000).

cityInTexas(houston).
cityinTexas(college_station).
cityinTexas(dallas).
cityinTexas(san_antonio).

isASurgeon(oral_surgeon).
isASurgeon(plastic_surgeon).
isASurgeon(heart_surgeon).
isASurgeon(brain_surgeon).

findAllSurgeonsInTexasWithSalaryMoreThanHundredGrand(X) :-
	occupation(X,Y),
	isASurgeon(Y),
	address(X,Z),
	cityinTexas(Z),
	salary(X,W),
	W>100000.