var
  a,b,c,d,e,f,m,n,p,v:extended;
begin
  readln(a,b,c,d,e,f);
  m:=sqr(b)+sqr(c)-sqr(f);
  n:=sqr(a)+sqr(c)-sqr(e);
  p:=sqr(a)+sqr(b)-sqr(d);
  v:=sqrt(sqr(a)*sqr(b)*sqr(c)-(sqr(a)*sqr(m)+sqr(b)*sqr(n)+sqr(c)*sqr(p))/4+(m*n*p)/4)/6;
  writeln(v:0:4);
end.
