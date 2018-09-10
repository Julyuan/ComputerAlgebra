procedure mygcd(a,b);
begin
	scalar r;
	if a < 0 then a := -a;
	if b < 0 then b := -b;
	while b neq 0 do
	begin
		r := a mod b;
		a := b;
		b := r;
	end;
	return a;
end;

procedure CoeffgcdPR(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	if length(res) eq 1 then return first(res);
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := Primgcd(x,ans);
	return ans;
end;

procedure PrimipolyPR(x, mvar);
begin
	scalar temp;
	temp:=CoeffgcdPR(x, mvar);
	if temp neq 0 then
	x:=x/temp;
	return x;
end;

procedure Primgcd(a,b);
begin
	scalar coe1,coe2,coef,temp, mvar;
	if b = 0 then return a;
	if a = 0 then return b;
	if numberp b and numberp a then return mygcd(a,b);
	
	if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);
	if deg(a, mvar) < deg(b, mvar) then
	<<temp:=a;a:=b;b:=temp>>;
	coe1 := CoeffgcdPR(a,mvar);
	coe2 := CoeffgcdPR(b,mvar);
	coef := Primgcd(coe1, coe2);
	if coe1 neq 0 then a:=a/coe1;
	if coe2 neq 0 then b:=b/coe2;
	

	r:=PrimipolyPR(second((pseudo_divide(a,b,mvar))),mvar);
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r:=PrimipolyPR(second((pseudo_divide(a,b,mvar))),mvar);
	end;
	return coef * b;
end;
	