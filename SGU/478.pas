var
  a,b,n,i,m,m1,ta,tb:longint;
  ans:array[1..100,1..2] of integer;
begin
  readln(a,b);
  m1:=b;
  readln(n);
  ta:=0;tb:=0;
  for i:=1 to n do
  begin
    read(m);
    if m1>m then
    begin
      ans[i,1]:=0;
      ans[i,2]:=m1-m;
      inc(tb,m1-m);
    end else
    begin
      ans[i,1]:=m-m1;
      ans[i,2]:=0;
      inc(ta,m-m1);
    end;
    if (ta>a) or (tb>b) then
    begin
      writeln('ERROR');
      halt;
    end;
    m1:=m;
  end;
  for i:=1 to n do
    writeln(ans[i,1],' ',ans[i,2]);
end.
