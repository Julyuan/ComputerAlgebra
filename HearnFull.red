procedure HEuclid(a,b);
begin
	scalar r,l,iter,xx;
	if b=0 then return a;
	r:=second(pseudo_divide(a,b));
	l:=list(lcof(a,x),lcof(b,x),lcof(r,x));
	%write r,l;
	while r neq 0 do
	begin
		%write l;
		a:=b;
		b:=r;
		r :=second(pseudo_divide(a,b));
		foreach xx in l do
		begin
			if xx neq 0 and xx neq 1 and (r mod abs(xx)) eq 0 then
			begin
				while (r mod abs(xx)) eq 0
				do
					r := r / xx;
			end;
		end;
		%write r;
		r := Primipoly(r);
		l := append(l,{lcof(r,x)});
	end;
	return b;
end;
	
