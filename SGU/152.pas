var
  n,i,tot,tn,x:longint;
  r:real;
  a:array[1..10000] of longint;
begin
  readln(n);
  tot:=0;
  for i:=1 to n do
  begin
    read(a[i]);
    inc(tot,a[i]);
  end;
  tn:=100;r:=tn;
  for i:=1 to n do
    if a[i]*100 mod tot=0 then
    begin
      a[i]:=a[i]*100 div tot;
      dec(tn,a[i]);
      r:=r-a[i];
    end else
    begin
      if tn<r then
      begin
        r:=r-a[i]*100/tot;
        a[i]:=a[i]*100 div tot;
      end else
      begin
        r:=r-a[i]*100/tot;
        a[i]:=a[i]*100 div tot+1;
      end;
      dec(tn,a[i]);
    end;
  if tn=0 then
  begin
    for i:=1 to n-1 do
      write(a[i],' ');
    writeln(a[n]);
  end else
    writeln('No solution');
end.
