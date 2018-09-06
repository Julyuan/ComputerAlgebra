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
	scalar myi:=1;
	while a(myi) neq 0 do
	<<	a(myi+1):=second(pesudo_divide(a(myi-1),a(myi)))/mybeta(myi+1);
		mydelta(myi) := deg(a(myi)) - deg(a(myi+1));
		myi := myi+1;
		mypsi(myi+1) := (-lcof(a(myi-1)))^mydelta(myi-2) * mypsi(myi)^(1-mydelta(myi-2));
		mybeta(myi+1) := -lcof(a(myi-1))*mypsi(myi+1)^mydelta(myi-1)>>;
	temp := Primipoly(a(myi-1));
	return temp;
end;
	
	
	
	
	
	
	
	
	
procedure SREuclid(f,g);
begin
	scalar beta0,
	a0, a1,a2,
	del0, del1, del2,
	psi0, psi1, psi2,myi;
	maxe := max(deg(f,x),deg(g,x));
	%array mybeta(5), a(5),
	%mydel(5), mypsi(5);
	
	if deg(f,x) < deg(g,x) then
	begin
		a0 := Primipoly(g);
		a1 := Primipoly(f);
	end
	else
	begin
		a0 := Primipoly(f);
		a1 := Primipoly(g);
	end;
	del0 := deg(a0,x) - deg(a1,x);
	beta0 := (-1)^(del0+1);
	psi0:=-1;
	while a1 neq 0 do
	<<	
		%write a0;
		%write a1;
		a2 := second(pseudo_divide(a0,a1))/beta0;
		del1 := deg(a1,x) - deg(a2,x);
		myi := myi+1;
		psi1 := (-lcof(a1,x))^del0 * psi0^(1-del0);
		beta0 := -lcof(a1,x)*psi1^del1;
		a0 := a1;
		a1 := a2;
		del0 := del1;
		psi0 := psi1;
		>>;
	temp := Primipoly(a0);
	return temp;
end;
		
	