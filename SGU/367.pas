var
  n,m,tt,nt,i,j,a,b,ta:longint;
  s:array[1..1000,0..1000] of integer;
  s1,ans:array[0..1000] of integer;
  t:array[0..1000,1..2] of integer;
  f:array[1..1000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  t[0,1]:=t[r,1];t[0,2]:=t[r,2];
  t[r,1]:=t[a,1];t[r,2]:=t[a,2];
  while i<j do
  begin
    while (i<j) and (t[j,1]>t[0,1]) do
      dec(j);
    if i<j then
    begin
      t[i,1]:=t[j,1];
      t[i,2]:=t[j,2];
      inc(i);
    end;
    while (i<j) and (t[i,1]<t[0,1]) do
      inc(i);
    if i<j then
    begin
      t[j,1]:=t[i,1];
      t[j,2]:=t[i,2];
      dec(j);
    end;
  end;
  t[i,1]:=t[0,1];t[i,2]:=t[0,2];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
begin
  randomize;
  readln(n,tt);
  for i:=1 to n do
  begin
    read(t[i,1]);
    t[i,2]:=i;
  end;
  read(m);
  for i:=1 to m do
  begin
    read(a,b);
    inc(s1[b]);
    inc(s[a,0]);
    s[a,s[a,0]]:=b;
  end;
  qsort(1,n);
  nt:=0;ta:=0;ans[0]:=0;
  fillchar(f,sizeof(f),false);
  while true do
  begin
    i:=1;
    while (i<=n) and (f[i] or (s1[t[i,2]]<>0)) do
      inc(i);
    if i>n then
      break;
    f[i]:=true;
    inc(nt,t[i,1]);
    if nt>tt then
      break;
    inc(ta,nt);
    inc(ans[0]);
    ans[ans[0]]:=t[i,2];
    for j:=1 to s[t[i,2],0] do
      dec(s1[s[t[i,2],j]]);
  end;
  writeln(ans[0],' ',ta);
  for i:=1 to ans[0] do
  begin
    write(ans[i]);
    if i=ans[0] then
      writeln
    else write(' ');
  end;
end.
