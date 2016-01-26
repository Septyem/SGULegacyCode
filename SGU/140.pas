var
  n,p,b,i,j,x,y,t,g:longint;
  a:array[1..100] of longint;
  c:array[1..100] of int64;
function gcd(a,b:longint):longint;
begin
  if a mod b=0 then
  begin
    y:=1;x:=0;
    gcd:=b;
    exit;
  end;
  gcd:=gcd(b,a mod b);
  t:=x;
  x:=y;
  y:=t-(a div b)*x;
end;
begin
  readln(n,p,b);
  for i:=1 to n do
    read(a[i]);
  c[1]:=1;g:=a[1];
  for i:=2 to n do
    if a[i]<>0 then
    begin
      g:=gcd(g,a[i]);
      for j:=1 to i-1 do
        c[j]:=c[j]*x mod p;
      c[i]:=y mod p;
    end;
  g:=gcd(g,p);
  if b mod g=0 then
  begin
    writeln('YES');
    for i:=1 to n do
    begin
      c[i]:=c[i]*x*b div g mod p;
      if c[i]<0 then
        inc(c[i],p);
    end;
    for i:=1 to n-1 do
      write(c[i],' ');
    writeln(c[n]);
  end else
    writeln('NO');
end.