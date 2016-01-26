const
  max=10000;
var
  n,i,l1:longint;
  l2,t,v:int64;
  l:real;
begin
  readln(l,n);
  l1:=trunc(l*max+0.5);
  l2:=0;
  for i:=1 to n do
  begin
    readln(t,v);
    l2:=(l2+t*v*max) mod l1;
  end;
  if l1-l2<l2 then
    l2:=l1-l2;
  writeln(l2/max:0:4);
end.