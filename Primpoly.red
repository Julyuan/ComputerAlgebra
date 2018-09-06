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
end;