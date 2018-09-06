procedure allcoeffs(q,lis);
	%q:polynomial, lis: list of vars
	allcoeffs1(list q, lis);

procedure allcoeffs1(q, lis);
	if lis={} then q else
		allcoeffs1(foreach qq in q join coeff(qq,first lis),
					rest lis);

procedure Coeffgcd(poly);
begin
	res := allcoeffs(poly, {x});
	ans := first(res);
	res := rest(res);
	foreach x in res do
		ans := gcd(x,ans);
	return ans;
end;

procedure Primipoly(x);
begin
	scalar temp;
	temp:=Coeffgcd(x);
	x:=x/temp;
	return x;
end

procedure Primgcd(a,b);
begin
	if b=0 then
		return a;
	r:=Primipoly(second((pseudo_divide(a,b))));
	while r neq 0 do
	begin
		write a;
		write b;
		a:=b;
		b:=r;
		r:=Primipoly(second((pseudo_divide(a,b))));
	end;
	return b;
end;
	