var
  n,m,y,i,j,t,p,p1,p2:longint;
  x,a:array[1..1000] of longint;
begin
  readln(n,m,y);
  for i:=1 to n do
    read(x[i]);
  t:=0;
  for i:=1 to n do
  begin
    a[i]:=x[i]*m div y;
    inc(t,a[i]);
  end;
  for i:=1 to m-t do
  begin
    p1:=0;
    for j:=1 to n do
    begin
      p2:=x[j]*m-a[j]*y;
      if p2>p1 then
      begin
        p:=j;
        p1:=p2;
      end;
    end;
    inc(a[p]);
  end;
  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end.

