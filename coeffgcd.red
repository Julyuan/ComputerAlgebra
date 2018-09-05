procedure Coeffgcd(poly);
begin
	res := allcoeffs(poly, {x});
	ans := first(res);
	res := rest(res);
	foreach x in res do
		ans := gcd(x,ans);
	return ans;
end;