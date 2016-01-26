var
  b,c,m,a,x,y:real;
procedure finish;
begin
  writeln('Mission impossible');
  halt;
end;
begin
  readln(b,c,m);
  a:=(sqr(b)+sqr(c)-2*sqr(m))/2;
  if a<0 then
    finish;
  a:=sqrt(a);
  if a<>0 then
    y:=(sqr(a)+sqr(m)-sqr(b))/(2*a*m)
  else y:=0;
  if abs(y)>1 then
    finish;
  x:=m*y;
  y:=m*sqrt(1-sqr(y));
  writeln((x+1e-6):0:5,' ',y:0:5);
  writeln(a:0:5,' 0.00000');
  writeln((-a+1e-6):0:5,' 0.00000');
end.
