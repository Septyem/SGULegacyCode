var
  n,i,j,x,s:longint;
  a,b,m:int64;
begin
  readln(n);
  for i:=1 to n do
  begin
    read(x);
    if x=0 then
    begin
      writeln('NO');
      continue;
    end;
    a:=round(sqrt(x)*sqrt(2));
    while (a*a+a) div 2>=x do
      dec(a);
    b:=x-(a*a+a) div 2+1;
    inc(a,3);
    if (b=2) and (a<>3) then
      writeln('YES')
    else writeln('NO');
  end;
end.
