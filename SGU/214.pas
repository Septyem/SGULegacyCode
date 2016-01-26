var
  i,j,x:longint;
  d,p:array[0..2000,0..2000] of longint;
  dis:array[1..200,1..200] of longint;
  besta,bestb:array[1..200] of longint;
  a,b:array[0..2000] of longint;
  s,s1,s2:ansistring;
begin
  readln(s);
  readln(s1);
  a[0]:=length(s1);
  for i:=1 to a[0] do
  begin
    j:=1;
    while s1[i]<>s[j] do
      inc(j);
    a[i]:=j;
  end;
  readln(s1);
  b[0]:=length(s1);
  for i:=1 to b[0] do
  begin
    j:=1;
    while s1[i]<>s[j] do
      inc(j);
    b[i]:=j;
  end;
  x:=length(s);
  for i:=1 to x do
    for j:=1 to x do
      read(dis[i,j]);
  for i:=1 to x do
  begin
    besta[i]:=1;
    for j:=2 to x do
      if dis[i,j]<dis[i,besta[i]] then
        besta[i]:=j;
  end;
  for i:=1 to x do
  begin
    bestb[i]:=1;
    for j:=2 to x do
      if dis[j,i]<dis[bestb[i],i] then
        bestb[i]:=j;
  end;
  d[0,0]:=0;
  for i:=1 to a[0] do
  begin
    d[i,0]:=d[i-1,0]+dis[a[i],besta[a[i]]];
    p[i,0]:=1;
  end;
  for i:=1 to b[0] do
  begin
    d[0,i]:=d[0,i-1]+dis[bestb[b[i]],b[i]];
    p[0,i]:=2;
  end;
  for i:=1 to a[0] do
    for j:=1 to b[0] do
    begin
      d[i,j]:=d[i-1,j]+dis[a[i],besta[a[i]]];
      p[i,j]:=1;
      if d[i,j-1]+dis[bestb[b[j]],b[j]]<d[i,j] then
      begin
        d[i,j]:=d[i,j-1]+dis[bestb[b[j]],b[j]];
        p[i,j]:=2;
      end;
      if d[i-1,j-1]+dis[a[i],b[j]]<d[i,j] then
      begin
        d[i,j]:=d[i-1,j-1]+dis[a[i],b[j]];
        p[i,j]:=3;
      end;
    end;
  s1:='';s2:='';
  i:=a[0];j:=b[0];
  while (i<>0) or (j<>0) do
  begin
    if p[i,j]=1 then
    begin
      s1:=s[a[i]]+s1;
      s2:=s[besta[a[i]]]+s2;
      dec(i);
    end;
    if p[i,j]=2 then
    begin
      s1:=s[bestb[b[j]]]+s1;
      s2:=s[b[j]]+s2;
      dec(j);
    end;
    if p[i,j]=3 then
    begin
      s1:=s[a[i]]+s1;
      s2:=s[b[j]]+s2;
      dec(i);dec(j);
    end;
  end;
  writeln(d[a[0],b[0]]);
  writeln(s1);
  writeln(s2);
end.
