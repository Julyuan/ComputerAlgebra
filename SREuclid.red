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

procedure Coeffgcd(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	%write res;
	if length(res) eq 1 then return first(res);
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := SREuclid(x,ans);
	return ans;
end;

procedure Primipoly(x, mvar);
begin
	scalar temp;
	if mvar eq 0 then return x;

	temp:=Coeffgcd(x, mvar);
	%write temp;
	if temp neq 0 then
	x:=x/temp;
	return x;
end;


procedure SREuclid(f,g);
begin
	scalar beta0,
	a0, a1,a2,coe1,coe2,
	del0, del1, del2,
	psi0, psi1, psi2,mvar;
	if g = 0 then return f;
	if f = 0 then return g;	
	if numberp g and numberp f then return mygcd(g,f);

	%array mybeta(5), a(5),
	%mydel(5), mypsi(5);
	if mainvar(g) = 0 then mvar := mainvar(f) else mvar:=mainvar(g);

	if deg(f,mvar) < deg(g,mvar) then
	begin
		a0 := Primipoly(g,mvar);
		a1 := Primipoly(f,mvar);
		coe1 := g/a0;
		coe2 := f/a1;
	%	write coe1;
	%	write coe2;
	end
	else
	begin
		a0 := Primipoly(f,mvar);
		a1 := Primipoly(g,mvar);
		coe2 := f/a0;
		coe1 := g/a1;
	%	write coe1;
	%	write coe2;
	end;
	
	del0 := deg(a0,mvar) - deg(a1,mvar);
	beta0 := (-1)^(del0+1);
	psi0:=-1;
	while a1 neq 0 do
	<<	
		%write "a0=",a0;
		%write "a1=",a1;
		%write "mvar=",mvar;
		%write pseudo_remainder(a0,a1,mvar);
		a2 := first divide(pseudo_remainder(a0, a1, mvar), beta0, mvar);;
		%write a2," ",beta0;
		%write 127;
		del1 := deg(a1,mvar) - deg(a2,mvar);
		psi1 := (-lcof(a1,mvar))^del0 * psi0^(1-del0);
		%write 128;
		beta0 := -lcof(a1,mvar)*psi1^del1;
		%write 129;
		a0 := a1;
		a1 := a2;
		del0 := del1;
		psi0 := psi1;
		>>;
	%write 130;
	%write a0;
	%write mvar;
	%write coe1;
%	write coe2;
	if mvar neq 0 then
	temp := Primipoly(a0,mvar)
	else 
	temp:=1;

	%write 127;
	return temp*SREuclid(coe1,coe2);
end;
		