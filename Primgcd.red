procedure Coeffgcd(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	%write res;
	if length(res) eq 1 then return first(res);
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := Primgcd(x,ans);
	return ans;
end;

procedure Primipoly(x, mvar);
begin
	scalar temp;
	temp:=Coeffgcd(x, mvar);
	%write temp;
	if temp neq 0 then
	x:=x/temp;
	return x;
end;

procedure Primgcd(a,b);
begin
	scalar coe1,coe2,coef,temp, mvar;
	%write a;
	%write b;
	if b = 0 then return a;
	if a = 0 then return b;
	if numberp b and numberp a then return gcd(a,b);
	
	if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);
	%write mvar;
	if deg(a, mvar) < deg(b, mvar) then
	<<temp:=a;a:=b;b:=temp>>;
	%write 123;
	coe1 := Coeffgcd(a,mvar);
	coe2 := Coeffgcd(b,mvar);
	%write 124;
	coef := Primgcd(coe1, coe2);
	%write 125;
	if coe1 neq 0 then a:=a/coe1;
	if coe2 neq 0 then b:=b/coe2;
	

	r:=Primipoly(second((pseudo_divide(a,b,mvar))),mvar);
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r:=Primipoly(second((pseudo_divide(a,b,mvar))),mvar);
		%write r;
	end;
	return coef * b;
end;
	