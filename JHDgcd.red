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
	
