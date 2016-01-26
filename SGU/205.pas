const
  max=1000000001;
var
  n,m,m1,i,j,j1,k:longint;
  s:array[1..1000] of longint;
  a:array[1..130,1..130] of longint;
  d,p:array[1..1000,1..130] of longint;
procedure print(n1,k1:integer);
begin
  if n1>1 then
    print(n1-1,p[n1,k1]);
  write(k1-1);
  if n1<>n then
    write(' ')
  else writeln;
end;
begin
  readln(n);
  for i:=1 to n do
    read(s[i]);
  readln(m,m1);
  for i:=1 to m do
    for j:=1 to m1 do
      read(a[i,j]);
  fillchar(d,sizeof(d),0);
  for j:=1 to m1 do
    d[1,j]:=abs(a[1,j]-s[1]);
  for i:=2 to n do
    for j:=1 to m1 do
    begin
      d[i,j]:=max;
      for j1:=1 to m do
      begin
        k:=j1;
        while k<=m1 do
        begin
          if d[i-1,k]+abs(s[i]-a[j1,j])<d[i,j] then
          begin
            d[i,j]:=d[i-1,k]+abs(s[i]-a[j1,j]);
            p[i,j]:=k;
          end;
          inc(k,m);
        end;
      end;
    end;
  k:=1;
  for i:=2 to m1 do
    if d[n,k]>d[n,i] then
      k:=i;
  writeln(d[n,k]);
  print(n,k);
end.
