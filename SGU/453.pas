var
  l,v1,v2,t,d,t1,g,ans:int64;
function gcd(a,b:int64):int64;
begin
  if a mod b=0 then
    gcd:=b
  else gcd:=gcd(b,a mod b);
end;
begin
  readln(l,v1,v2,t);
  if v1<v2 then
  begin
    d:=v1;v1:=v2;v2:=d;
  end;
  d:=v1-v2;
  t1:=(v1+v2)*t div l;
  ans:=(t1+1) div 2;
  g:=gcd(d,v2);
  d:=d div g;
  if d>1 then
  begin
    t1:=d*g*t div l;
    inc(ans,(t1+1) div 2);
    if (d mod 2=1) and (t1>=d) then
      dec(ans,(t1-d) div (2*d)+1);
  end;
  writeln(ans);
end.
