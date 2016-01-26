var
  n,m,i,j,ans:longint;
  c:array[1..10000] of longint;
  d:array[1..10000,1..100] of longint;
begin
  fillchar(d,sizeof(d),0);
  readln(n,m);
  for i:=1 to n do
    read(c[i]);
  for i:=1 to m do
  begin
    for j:=1 to m-1 do
    begin
      if j>=i then
        break;
      d[i,j]:=c[i]+c[i-j];
    end;
    for j:=2 to m-1 do
      if d[i,j-1]<d[i,j] then
        d[i,j]:=d[i,j-1];
  end;
  for i:=m+1 to n do
  begin
    for j:=1 to m-1 do
      d[i,j]:=c[i]+d[i-j,m-j];
    for j:=2 to m-1 do
      if d[i,j-1]<d[i,j] then
        d[i,j]:=d[i,j-1];
  end;
  ans:=maxlongint;
  for i:=n-m+2 to n do
    if d[i,i-n+m-1]<ans then
      ans:=d[i,i-n+m-1];
  writeln(ans);
end.

