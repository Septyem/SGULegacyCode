const
 zero=1e-6;
var
  h,d,m,x,a,b:double;
procedure finish;
begin
  writeln('NO');
  halt;
end;
begin
  readln(h,d,m);
  a:=sqr(m)-sqr(h);
  b:=sqr(d)-sqr(h);
  if (a<0) or (b<0) then
    finish;
  a:=sqrt(a);b:=sqrt(b);
  if abs(b)>=zero then
    x:=((sqr(h)+a*b)*(a-b))/b
  else
  if abs(a)<zero then
    x:=1
  else finish;
  if (x<0) or (abs(x)<zero) then
    finish;
  x:=sqrt(x);
  writeln('YES');
  writeln('0 ',h:0:6);
  writeln(a-x:0:6,' 0');
  writeln(a+x:0:6,' 0');
end.
