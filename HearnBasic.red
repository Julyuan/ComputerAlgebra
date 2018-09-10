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

procedure CoeffgcdHB(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	%write res;
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := HeuclidBasic(x,ans);
	return ans;
end;

procedure PrimipolyHB(x, mvar);
begin
	scalar temp;
	temp:=CoeffgcdHB(x, mvar);
	%write temp;
	if temp neq 0 then
	x:=x/temp;
	return x;
end;




procedure HEuclidBasic(a,b);
begin
	scalar r,l,xx,mvar, temp, coe1, coe2;
	if b=0 then return a;
	if a=0 then return b;
	if numberp a and numberp b then return mygcd(a,b);

	if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);

	
	if deg(a, mvar) < deg(b, mvar) then 
	begin
		temp := a; a := b; b := temp
	end;
	
	coe1 := CoeffgcdHB(a,mvar);
	coe2 := CoeffgcdHB(b,mvar);
	a := a/coe1;
	b := b/coe2;
	r:=second(pseudo_divide(a,b,mvar));

	l:=list(lcof(a,mvar),lcof(b,mvar),lcof(r,mvar));
	
	%write r,l;
	while r neq 0 do
	begin
		%write l;
		a:=b;
		b:=r;
		%if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);
		r :=second(pseudo_divide(a,b,mvar));
		foreach xx in l do
		begin
			if xx neq 0 and abs(xx) neq 1 and r neq 0 and remainder(r,xx,mvar) eq 0 then
			begin
				while remainder(r,xx,mvar) eq 0
				do
				begin
					%write second(divide(r,xx,mvar));
					%write r;
					%write xx;
					r := r / xx;
				end;
			end;
		end;
		%write r;
		%r := PrimipolyHB(r,mvar);
		l := append(l,{lcof(r,mvar)});
	end;
	return primipolyHB(b,mvar)*HEuclidBasic(coe1, coe2);
end;
	






