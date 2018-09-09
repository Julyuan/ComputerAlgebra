%test code
a:=x^8 + x^6 - 3*x^4 - 3*x^3 + 8x^2 + 2*x - 5;
b:=3*x^6 + 5*x^4 - 4*x^2 - 9*x - 21;
Primgcd(a,b);
	
	
	
f:=(x1+x2-1)*(x1+x2+2);
g:=(x1+x2+1)*(-3*x2*x1^2+x2^2-1)^2;

gcd(f,g);
sreuclid(f,g);

f:=(x1+x2+x3-1)*(x1+x2+x3+2);
g:=(x1+x2+x3+1)*(-3*x2*x1^2+x2^2-1)^2;

gcd(f,g);
sreuclid(f,g);

f:=(x1+x2+x3+x4-1)*(x1+x2+x3+x4+2);
g:=(x1+x2+x3+x4+1)*(-3*x2*x1^2+x2^2-1)^2;

gcd(f,g);
sreuclid(f,g);

h:=(x1^2+x2^2+1);
f:=h*(x1^2+x2^2-2);
g:=h*(x1^2+x2^2+2);

gcd(f,g);
sreuclid(f,g);

h:=(x1^3+x2^3+x3^3+1);
f:=h*(x1^3+x2^3+x3^3+2);
g:=h*(x1^3+x2^3+x3^3-1);

gcd(f,g);
sreuclid(f,g);

h:=7*z*(x1^4+x2^4+x4^4+x4^4+1);
f:=h*(x1^4+x2^4+x4^4+x4^4+2);
g:=h*(x1^4+x2^4+x4^4+x4^4-2);

gcd(f,g);
sreuclid(f,g);

h:=(x1^3+x2^3+x3^3+1);
f:=h*(x1^3+x2^3+x3^3+2);
g:=h*(x1^2+x2^2+x3^2-1);

gcd(f,g);
sreuclid(f,g);

h:=7*z*(x1^4+x2^4+x4^4+x4^4+1);
f:=h*(x1^4+x2^4+x4^4+x4^4-2);
g:=h*(x1^3+x2^3+x4^3+x4^3+2);

gcd(f,g);
sreuclid(f,g);
