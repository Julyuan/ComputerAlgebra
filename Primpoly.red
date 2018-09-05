proceduce Primipoly(x);
begin
	scalar temp;
	temp:=Coeffgcd(x);
	x:=x/temp;
	return x;
end