var
  n,i,j,j1,j2,t,ta,tb,na,nb,p1,tmp:longint;
  a,b,s:array[0..21] of integer;
  da,db,pb:array[0..2200000,1..3] of longint;
  d,pa:array[0..2200000] of longint;
procedure qsort1(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  da[0]:=da[r];da[r]:=da[a];
  while i<j do
  begin
    while (i<j) and (da[0,1]<da[j,1]) do
      dec(j);
    if i<j then
    begin
      da[i]:=da[j];
      inc(i);
    end;
    while (i<j) and (da[i,1]<da[0,1]) do
      inc(i);
    if i<j then
    begin
      da[j]:=da[i];
      dec(j);
    end;
  end;
  da[i]:=da[0];
  if i+1<b then qsort1(i+1,b);
  if i-1>a then qsort1(a,i-1);
end;
procedure qsort2(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  db[0]:=db[r];db[r]:=db[a];
  while i<j do
  begin
    while (i<j) and (db[0,1]<db[j,1]) do
      dec(j);
    if i<j then
    begin
      db[i]:=db[j];
      inc(i);
    end;
    while (i<j) and (db[i,1]<db[0,1]) do
      inc(i);
    if i<j then
    begin
      db[j]:=db[i];
      dec(j);
    end;
  end;
  db[i]:=db[0];
  if i+1<b then qsort2(i+1,b);
  if i-1>a then qsort2(a,i-1);
end;
procedure makeda(n1,n2,n3,n4:longint);
begin
  if n1>a[0] then
  begin
    da[n2,1]:=n3;
    da[n2,2]:=n2;
    da[n2,3]:=n4;
    exit;
  end;
  makeda(n1+1,n2+1 shl (n1-1),n3+a[n1],n4+1);
  makeda(n1+1,n2,n3,n4);
end;
procedure makedb(n1,n2,n3,n4:longint);
begin
  if n1>b[0] then
  begin
    db[n2,1]:=n3;
    db[n2,2]:=n2;
    db[n2,3]:=n4;
    exit;
  end;
  makedb(n1+1,n2+1 shl (n1-1),n3+b[n1],n4+1);
  makedb(n1+1,n2,n3,n4);
end;
begin
  randomize;
  read(n);
  ta:=0;tb:=0;
  for i:=1 to n do
  begin
    read(s[i]);
    inc(ta,s[i]);
  end;
  a[0]:=0;b[0]:=0;
  for i:=1 to n do
  begin
    read(t);
    inc(tb,t);
    if t>s[i] then
    begin
      inc(a[0]);
      a[a[0]]:=t-s[i];
    end;
    if t<s[i] then
    begin
      inc(b[0]);
      b[b[0]]:=s[i]-t;
    end;
  end;
  if ta<>tb then
  begin
    writeln(-1);
    halt;
  end;
  ta:=1 shl a[0]-1;
  tb:=1 shl b[0]-1;
  makeda(1,0,0,0);
  if ta>0 then
    qsort1(1,ta);
  makedb(1,0,0,0);
  if tb>0 then
    qsort2(1,tb);
  t:=0;
  if tb<>0 then
  begin
    inc(t);
    pb[1,1]:=db[1,1];
    pb[1,2]:=1;
  end;
  for i:=2 to tb do
    if db[i-1,1]<>db[i,1] then
    begin
      pb[t,3]:=i-1;
      inc(t);
      pb[t,1]:=db[i,1];
      pb[t,2]:=i;
    end;
  if tb<>0 then
    pb[t,3]:=tb;
  fillchar(d,sizeof(d),$ff);
  d[0]:=0;
  p1:=1;
  for i:=1 to ta do
  begin
    pa[i]:=0;
    while (p1<=t) and (da[i,1]>pb[p1,1]) do
      inc(p1);
    if da[i,1]<>pb[p1,1] then
      continue;
    pa[i]:=p1;
    na:=da[i,2];
    for j:=pb[p1,2] to pb[p1,3] do
    begin
      nb:=db[j,2];
      d[nb*(ta+1)+na]:=da[i,3]+db[j,3]-1;
      for j1:=1 to i do
      begin
        if (pa[j1]=0) or (da[j1,2] and na<>da[j1,2]) then
          continue;
        for j2:=pb[pa[j1],2] to pb[pa[j1],3] do
        begin
          if db[j2,2] and nb<>db[j2,2] then
            continue;
          if (d[db[j2,2]*(ta+1)+da[j1,2]]=-1) or (d[(nb-db[j2,2])*(ta+1)+na-da[j1,2]]=-1) then
            continue;
          tmp:=d[db[j2,2]*(ta+1)+da[j1,2]]+d[(nb-db[j2,2])*(ta+1)+na-da[j1,2]];
          if tmp<d[nb*(ta+1)+na] then
            d[nb*(ta+1)+na]:=tmp;
        end;
      end;
    end;
  end;
  writeln(d[1 shl (a[0]+b[0])-1]);
end.
