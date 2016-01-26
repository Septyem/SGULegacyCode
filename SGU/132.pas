var
  m,n,i,j,l,j1,ans,max:longint;
  er:array[1..8] of longint;
  c:array[-1..70] of longint;
  d,d1:array[0..127,0..127] of longint;
  ch:char;
procedure work(t,nu,nm,nd,a:longint);
begin
  if (t>1) and (er[t-1] and nu=0) and (er[t-1] and nm=0) then
    exit;
  if (t>2) then
  begin
    if (er[t-1] and nu=0) and (er[t-2] and nu=0) then
      exit;
    if (er[t-1] and nm=0) and (er[t-2] and nm=0) then
      exit;
  end;
  if t>m then
  begin
    if d1[j,l]+a<d[nm,nd] then
      d[nm,nd]:=d1[j,l]+a;
    if (i+1=n) and (d[nm,nd]<ans) then
    begin
      for j1:=1 to m-1 do
        if (er[j1] and nd=0) and (er[j1+1] and nd=0) then
          exit;
      for j1:=1 to m do
        if (er[j1] and nm=0) and (er[j1] and nd=0) then
          exit;
      ans:=d[nm,nd];
    end;
    exit;
  end;
  work(t+1,nu,nm,nd,a);
  if (nm and er[t]=0) and (nd and er[t]=0) then
    work(t+1,nu,nm+er[t],nd+er[t],a+1);
  if (t<m) then
  begin
    if (nm and er[t]=0) and (nm and er[t+1]=0) then
      work(t+1,nu,nm+er[t]+er[t+1],nd,a+1);
    if (nd and er[t]=0) and (nd and er[t+1]=0) then
      work(t+1,nu,nm,nd+er[t]+er[t+1],a+1);
  end;
end;
begin
  fillchar(d,sizeof(d),$7f);
  max:=d[0,0];
  readln(n,m);
  er[1]:=1;
  for i:=2 to m do
    er[i]:=er[i-1]*2;
  er[m+1]:=er[m]*2-1;
  c[0]:=0;c[-1]:=0;
  for i:=1 to n do
  begin
    c[i]:=0;
    for j:=1 to m do
    begin
      read(ch);
      if ch='*' then
        c[i]:=c[i]+er[j];
    end;
    readln;
  end;
  ans:=maxlongint;
  i:=0;j:=er[m+1];l:=er[m+1];
  d1[j,l]:=0;
  work(1,j,l,c[1],0);
  if n>1 then
  begin
    i:=1;d1:=d;
    fillchar(d,sizeof(d),$7f);
    for l:=0 to er[m+1] do
      if d1[j,l]<max then
        work(1,j,l,c[2],0);
  end;
  for i:=2 to n-1 do
  begin
    d1:=d;
    fillchar(d,sizeof(d),$7f);
    for j:=0 to er[m+1] do
      if (c[i-1]=0) or (c[i-1] and j<>0) then
        for l:=0 to er[m+1] do
          if d1[j,l]<max then
            work(1,j,l,c[i+1],0);
  end;
  writeln(ans);
end.
