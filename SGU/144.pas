var
  x,y:integer;
  z,t,s,st,h,l:real;
begin
  readln(x,y,z);
  t:=(y-x)*60;
  if z>t then
    z:=t;
  st:=sqr(t);
  if 2*z>t then
    h:=t
  else h:=2*z;
  l:=abs(2*z-t);
  s:=(t-l)/2*(z+h)+h*l;
  writeln(s/st:0:7);
end.
