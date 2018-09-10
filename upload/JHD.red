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
	ans := lcof(poly, mvar);
	foreach x in res do
		ans := JHDgcd(x,ans);
	return ans;
end;

procedure PrimipolyJH(x, mvar);
begin
	scalar temp;
	temp:=CoeffgcdJH(x, mvar);
	if temp neq 0 then
	x:=x/temp;
	return x;
end;

% lis is the previous list, ele is the new element(leading coeffient of r)
procedure process(lis, ele);
begin
	scalar a,iter,queue,temp,l,pos;
	if ele eq 0 then return lis;
	
	%shrink ele
	foreach iter in lis do
	begin
		while abs(iter) neq 1 and iter neq 0 and (remainder(ele,abs(iter)) eq 0)do 
			ele := ele / iter;
	end;
	
	lis := append(lis,{ele});
	queue := {ele,length(lis)};

	% It is similar to SPFA, stop condition is that the queue is empty
	while length(queue) neq 0 do 
	begin
		a := first(queue);
		queue := rest(queue);
		pos := first(queue);
		queue := rest(queue);
		if a neq 0 and abs(a) neq 1 then 
		begin
			for iter := 1 step 1 until length(lis) do
			begin
				if (remainder(part(lis,iter),a) eq 0) and (iter neq pos) then
				begin
					while (remainder(part(lis,iter),a) eq 0) do
					begin
						lis:=(part(lis, iter) := part(lis, iter) / a);
					end;
					queue := append(queue,{part(lis,iter),iter});
				end;		
			end;
		end;
	end;
	
	% delete 1s and 0s in the list
	for iter := 0 step 1 until length(lis) do
	begin
		if first(lis) eq 0 or abs(first(lis)) eq 1 then
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
	r:=second(pseudo_divide(a,b,mvar));

	l:=list(lcof(a,mvar));
	l:=process(l,lcof(b,mvar));
	l:=process(l,lcof(r,mvar));
	
	while r neq 0 do
	begin
		a:=b;
		b:=r;
		r :=second(pseudo_divide(a,b,mvar));
		foreach xx in l do
		begin
			if xx neq 0 and abs(xx) neq 1 and r neq 0 and pseudo_divide(r,xx,mvar) eq 0 then
			begin
				while remainder(r,xx,mvar) eq 0
				do
				begin
					r := r / xx;
				end;
			end;
		end;
		l := process(l, lcof(r,mvar));
	end;
	b := PrimipolyJH(b,mvar);
	return b*JHDgcd(coe1, coe2);
end;
	
