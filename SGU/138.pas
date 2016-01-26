var
  n,i,j,m,tot:longint;
  s:array[0..100,1..2] of longint;
begin
  readln(n);
  tot:=0;
  for i:=1 to n do
  begin
    read(s[i,1]);
    s[i,2]:=i;
    inc(tot,s[i,1]);
  end;
  for i:=1 to n do
  begin
    m:=i;
    for j:=i+1 to n do
      if s[m,1]>s[j,1] then
        m:=j;
    s[0]:=s[m];
    s[m]:=s[i];
    s[i]:=s[0];
  end;
  tot:=tot shr 1;
  writeln(tot);
  while s[n,1]<>tot do
  begin
    m:=2;
    while s[m,1]=0 do
      inc(m);
    if s[1,1]=1 then
      while s[m,1]<2 do
        inc(m);
    if s[1,1]=1 then
      writeln(s[m,2],' ',s[1,2])
    else writeln(s[1,2],' ',s[m,2]);
    dec(s[1,1]);
    dec(s[m,1]);
    if s[1,1]=0 then
    begin
      s[0]:=s[1];
      s[1]:=s[m];
      s[m]:=s[0];
    end;
    dec(tot);
  end;
  m:=1;
  for i:=1 to s[n,1] do
  begin
    while s[m,1]=0 do
      inc(m);
    writeln(s[n,2],' ',s[m,2]);
    dec(s[m,1]);
  end;
end.
