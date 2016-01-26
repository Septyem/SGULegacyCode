var
  x,y,r,p,ans:double;
begin
  readln(x,y,r);
  p:=ln(sqr(x)+sqr(y));
  ans:=pi*sqr(r)*p;
  writeln(ans:0:12);
end.
