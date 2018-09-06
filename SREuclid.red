procedure SREuclid(f,g);
begin
	maxe := max(deg(f,x),deg(g,x));
	array mybeta(maxe+5), a(maxe+5),
	mydel(maxe+5), mypsi(maxe+5);
	%array mybeta(5), a(5),
	%mydel(5), mypsi(5);
	if deg(f,x) < deg(g,x) then
	begin
		a(0) := Primipoly(g);
		a(1) := Primipoly(f);
	end;
	else
	begin
		a(0) := Primipoly(f);
		a(1) := Primipoly(g);
	end;
		
	mydel(0) := deg(a(0),x) - deg(a(1),x);
	mybeta(2) := (-1)^(mydelta(0)+1);
	mypsi(2):=-1;
	myi:=1;
	while a(myi) neq 0 do
	<<	a(myi+1):=second(pesudo_divide(a(myi-1),a(myi)))/mybeta(myi+1);
		mydelta(myi) := deg(a(myi)) - deg(a(myi+1));
		myi := myi+1;
		mypsi(myi+1) := (-lcof(a(myi-1)))^mydelta(myi-2) * mypsi(myi)^(1-mydelta(myi-2));
		mybeta(myi+1) := -lcof(a(myi-1))*mypsi(myi+1)^mydelta(myi-1)>>;
	temp := Primipoly(a(myi-1));
	return temp;
end;
	
	
		
	