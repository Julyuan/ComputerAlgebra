proceduce Primgcd(a,b);
	if b=0 then
		return a;
	r:=Primpoly(second((pesudo_divide(a,b)));
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r:=Primpoly(second((pesudo_divide(a,b)));
	end
	return b;
	
	