const
  max=5000000;
var
  r1,r2,i:longint;
  ans,s1,s2,del:double;
begin
  readln(r1,r2);
  if r1<r2 then
  begin
    i:=r1;r1:=r2;r2:=i;
  end;
  del:=r2/max;
  ans:=0;
  for i:=1 to max do
  begin
    s1:=sqrt(abs(sqr(r1)-sqr(del*(i-1)))*abs(sqr(r2)-sqr(del*(i-1))));
    s2:=sqrt(abs(sqr(r1)-sqr(del*i))*abs(sqr(r2)-sqr(del*i)));
    ans:=ans+del*(s1+s2)/2;
  end;
  writeln(ans*8:0:4);
end.
