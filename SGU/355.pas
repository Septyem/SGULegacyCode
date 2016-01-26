var
  n,i,j,m:longint;
  s:array[1..10000] of integer;
  c:array[1..20] of boolean;
begin
  readln(n);
  m:=1;s[1]:=1;
  for i:=2 to n do
  begin
    fillchar(c,sizeof(c),true);
    c[1]:=false;
    for j:=2 to trunc(sqrt(i)) do
      if i mod j=0 then
      begin
        c[s[j]]:=false;
        c[s[i div j]]:=false;
      end;
    j:=1;
    while (j<=m) and (not c[j]) do
      inc(j);
    if j>m then
      inc(m);
    s[i]:=j;
  end;
  writeln(m);
  for i:=1 to n do
  begin
    write(s[i]);
    if i<>n then write(' ')
      else writeln;
  end;
end.
