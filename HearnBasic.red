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
		l := append(l,{lcof(r,x)});
	end;
	return b;
end;

aa:=x^8 + x^6 - 3*x^4 - 3*x^3 + 8x^2 + 2*x - 5;
bb:=3x^5 + 5*x^4 - 4*x^2 - 9*x - 21;
heuclid(aa,bb);
%for iter:=1 step 1 until len do
%begin
%if r mod fisrt(l) eq 0 then l:=rest(l) else l := append(rest(l),fisrt(l));
%end;