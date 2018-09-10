% basic gcd procedure used for integers
procedure mygcd(a,b);
begin
	% temp variable r
	scalar r;
	if a < 0 then a := -a;
	if b < 0 then b := -b;
	% division algorithm
	while b neq 0 do
	begin
		r := a mod b;
		a := b;
		b := r;
	end;
	return a;
end;

% procedure to get gcd of all coefficients
procedure CoeffgcdHB(poly,mvar);
begin
	scalar res,ans;
	% get all coefficients
	res := coeff(poly, mvar);
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := HearnBasicgcd(x,ans);
	return ans;
end;

% get primitive primipoly
procedure PrimipolyHB(x, mvar);
begin
	scalar temp;
	% temp is the gcd
	temp:=CoeffgcdHB(x, mvar);
	if temp neq 0 then
	x:=x/temp;
	return x;
end;




procedure HearnBasicgcd(a,b);
begin
	scalar r,l,xx,mvar, temp, coe1, coe2;
	if b=0 then return a;
	if a=0 then return b;
	% if a and b are all numbers, call mygcd directly
	if numberp a and numberp b then return mygcd(a,b);
	% use mainvar to get main variable
	if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);

	% compare degree
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

	% similar to the slide
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r :=second(pseudo_divide(a,b,mvar));
		foreach xx in l do
		begin
			if xx neq 0 and abs(xx) neq 1 and r neq 0 and remainder(r,xx,mvar) eq 0 then
			begin
				while remainder(r,xx,mvar) eq 0
				do
				begin
					r := r / xx;
				end;
			end;
		end;
		l := append(l,{lcof(r,mvar)});
	end;
	return primipolyHB(b,mvar)*HearnBasicgcd(coe1, coe2);
end;
