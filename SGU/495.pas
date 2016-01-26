var
  n,i,m:longint;
  a:extended;
begin
  readln(n,m);
  a:=(n-1)/n;
  if a=0 then a:=1
    else a:=1-exp(m*ln(a));
  a:=n*a;
  writeln(a:0:10);
end.
