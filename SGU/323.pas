type
  flight=array[0..4] of longint;
var
  n,m,k,i,j,j1,pm,now,ans,a1,x,y:longint;
  p:array[1..2000] of integer;
  d,d1:array[0..200000] of longint;
  min:array[1..2000] of flight;
  f,f1:array[0..200000] of flight;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  f[0]:=f[r];f[r]:=f[a];
  while i<j do
  begin
    while (i<j) and (f[0,4]<f[j,4]) do
      dec(j);
    if i<j then
    begin
      f[i]:=f[j];
      inc(i);
    end;
    while (i<j) and (f[0,4]>f[i,4]) do
      inc(i);
    if i<j then
    begin
      f[j]:=f[i];
      dec(j);
    end;
  end;
  f[i]:=f[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
procedure qsort1(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  f1[0]:=f1[r];f1[r]:=f1[a];
  while i<j do
  begin
    while (i<j) and (f1[0,3]<f1[j,3]) do
      dec(j);
    if i<j then
    begin
      f1[i]:=f1[j];
      inc(i);
    end;
    while (i<j) and (f1[0,3]>f1[i,3]) do
      inc(i);
    if i<j then
    begin
      f1[j]:=f1[i];
      dec(j);
    end;
  end;
  f1[i]:=f1[0];
  if i+1<b then qsort1(i+1,b);
  if i-1>a then qsort1(a,i-1);
end;
procedure backx(t:integer);
begin
  if p[t]=t then
  begin
    x:=t;
    exit;
  end;
  backx(p[t]);
  p[t]:=x;
end;
procedure backy(t:integer);
begin
  if p[t]=t then
  begin
    y:=t;
    exit;
  end;
  backy(p[t]);
  p[t]:=y;
end;
begin
  randomize;
  readln(n,m,k);
  for i:=1 to k do
  begin
    f[i,0]:=i;
    for j:=1 to 4 do
      read(f[i,j]);
    f1[i]:=f[i];
  end;
  if k>1 then
  begin
    qsort(1,k);
    qsort1(1,k);
  end;
  pm:=0;
  for j:=1 to n do
    p[j]:=j;
  for j:=1 to k do
  begin
    backx(f[j,1]);
    backy(f[j,2]);
    if x<>y then
    begin
      p[y]:=x;
      inc(pm);
      min[pm]:=f[j];
      if pm=n-1 then
        break;
    end;
  end;
  ans:=maxlongint;
  j1:=1;
  for i:=1 to m do
  begin
    for j:=1 to n do
      p[j]:=j;
    while (j1<=k) and (f1[j1,3]=i) do
    begin
      backx(f1[j1,1]);
      backy(f1[j1,2]);
      if x<>y then
        p[y]:=x;
      inc(j1);
    end;
    now:=0;d1[0]:=0;
    for j:=1 to pm do
      if min[j,3]<>i then
      begin
        backx(min[j,1]);
        backy(min[j,2]);
        if x<>y then
        begin
          p[y]:=x;
          inc(now,min[j,4]);
          inc(d1[0]);
          d1[d1[0]]:=min[j,0];
        end;
      end;
    if now<ans then
    begin
      ans:=now;
      a1:=i;
      for j:=0 to d1[0] do
        d[j]:=d1[j];
    end;
  end;
  writeln(ans,' ',a1,' ',d[0]);
  for i:=1 to d[0] do
    writeln(d[i]);
end.
