% FINAL CODE
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

procedure CoeffgcdHF(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	%write res;
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := HeuclidFull(x,ans);
	return ans;
end;

procedure PrimipolyHF(x, mvar);
begin
	scalar temp;
	temp:=CoeffgcdHF(x, mvar);
	%write temp;
	if temp neq 0 then
	x:=x/temp;
	return x;
end;




procedure HEuclidFull(a,b);
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
	
	coe1 := CoeffgcdHF(a,mvar);
	coe2 := CoeffgcdHF(b,mvar);
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
		r := PrimipolyHF(r,mvar);
		l := append(l,{lcof(r,mvar)});
	end;
	return primipolyHF(b,mvar)*HEuclidFull(coe1, coe2);
end;
	


%aa:=x^8 + x^6 - 3*x^4 - 3*x^3 + 8x^2 + 2*x - 5;
%bb:=3x^5 + 5*x^4 - 4*x^2 - 9*x - 21;
%heuclidbasic(aa,bb);
%for iter:=1 step 1 until len do
%begin
%if r mod fisrt(l) eq 0 then l:=rest(l) else l := append(rest(l),fisrt(l));
%end;

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

procedure CoeffgcdJH(poly,mvar);
begin
	scalar res,ans;
	res := coeff(poly, mvar);
	%write res;
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := JHDgcd(x,ans);
	return ans;
end;

procedure PrimipolyJH(x, mvar);
begin
	scalar temp;
	temp:=CoeffgcdJH(x, mvar);
	%write temp;
	if temp neq 0 then
	x:=x/temp;
	return x;
end;

procedure process(lis, ele);
begin
	scalar a,iter,queue,temp,l,pos;
	if ele eq 0 then return lis;
	%write 127;
	foreach iter in lis do
	begin
		%write "iter = ",iter," ele = ",ele;
		while abs(iter) neq 1 and iter neq 0 and (remainder(ele,abs(iter)) eq 0)do 
			ele := ele / iter;
	end;
	
	%write 128;
	lis := append(lis,{ele});
	queue := {ele,length(lis)};

	%write 129;
	while length(queue) neq 0 do 
	begin
		%write queue;
		a := first(queue);
		queue := rest(queue);
		pos := first(queue);
		queue := rest(queue);
		%write a;
		if a neq 0 and abs(a) neq 1 then 
		begin
			for iter := 1 step 1 until length(lis) do
			begin
				if (remainder(part(lis,iter),a) eq 0) and (iter neq pos) then
				begin
					%while ((part(lis,iter) mod abs(a)) eq 0) do
					while (remainder(part(lis,iter),a) eq 0) do
					begin
						lis:=(part(lis, iter) := part(lis, iter) / a);
	%					write "127 ", (part(lis,iter));
					end;
					queue := append(queue,{part(lis,iter),iter});
				end;		
			end;
		end;
	end;
	for iter := 0 step 1 until length(lis) do
	begin
	%	write(lis);
	%	write("jly = ",rest(lis));
		if first(lis) eq 0 or first(lis) eq 1 then
			lis := rest(lis)
		else
			lis := append(rest(lis),{first(lis)});
	end;
	return lis;
	
end;	


procedure JHDgcd(a,b);
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
	
	coe1 := CoeffgcdJH(a,mvar);
	coe2 := CoeffgcdJH(b,mvar);
	a := a/coe1;
	b := b/coe2;
	%write "a = ",a," b = ",b;
	r:=second(pseudo_divide(a,b,mvar));
	%	write "r = ",r;
	%write "a = ",a," b = ",b," r = ",r;
	l:=list(lcof(a,mvar));
	l:=process(l,lcof(b,mvar));
	l:=process(l,lcof(r,mvar));
	
	%write r,l;
	while r neq 0 do
	begin
		%write l;
		a:=b;
		b:=r;
		r :=second(pseudo_divide(a,b,mvar));
	%	write "a = ",a," b = ",b," r = ",r;
		foreach xx in l do
		begin
			if xx neq 0 and abs(xx) neq 1 and r neq 0 and pseudo_divide(r,xx,mvar) eq 0 then
			begin
				while remainder(r,xx,mvar) eq 0
				do
				begin
					%write second(divide(r,xx,mvar));
	%				write r;
	%				write xx;
					r := r / xx;
				end;
			end;
		end;
		%write r;
		%r := PrimipolyJH(r,mvar);
		%l := append(l,{lcof(r,mvar)});
		l := process(l, lcof(r,mvar));
	end;
	b := PrimipolyJH(b,mvar);
	%write "coe1 = ",coe1, " coe2 = ",coe2;
	return b*JHDgcd(coe1, coe2);
end;
	
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
	%write res;
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
	if numberp b and numberp a then return mygcd(a,b);
	
	if mainvar(b) = 0 then mvar := mainvar(a) else mvar:=mainvar(b);
	%write mvar;
	if deg(a, mvar) < deg(b, mvar) then
	<<temp:=a;a:=b;b:=temp>>;
	%write 123;
	coe1 := CoeffgcdPR(a,mvar);
	coe2 := CoeffgcdPR(b,mvar);
	%write 124;
	coef := Primgcd(coe1, coe2);
	%write 125;
	if coe1 neq 0 then a:=a/coe1;
	if coe2 neq 0 then b:=b/coe2;
	

	r:=PrimipolyPR(second((pseudo_divide(a,b,mvar))),mvar);
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r:=PrimipolyPR(second((pseudo_divide(a,b,mvar))),mvar);
		%write r;
	end;
	return coef * b;
end;
	
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

procedure CoeffgcdSR(poly,mvar);
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

procedure PrimipolySR(x, mvar);
begin
	scalar temp;
	if mvar eq 0 then return x;

	temp:=CoeffgcdSR(x, mvar);
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
		a0 := PrimipolySR(g,mvar);
		a1 := PrimipolySR(f,mvar);
		coe1 := g/a0;
		coe2 := f/a1;
	%	write coe1;
	%	write coe2;
	end
	else
	begin
		a0 := PrimipolySR(f,mvar);
		a1 := PrimipolySR(g,mvar);
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
	temp := PrimipolySR(a0,mvar)
	else 
	temp:=1;

	%write 127;
	return temp*SREuclid(coe1,coe2);
end;
		