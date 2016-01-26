var
  n,i,c,a1,a2:longint;
  s:array[0..32000,1..2] of integer;
  p:array[1..16000,1..2] of integer;
  d,tot,a:array[1..16000] of integer;
  v:array[1..16000] of boolean;
procedure qsort(l,r:longint);
var
  i,j,t:longint;
begin
  i:=l;j:=r;
  t:=l+random(r-l);
  s[0]:=s[t];s[t]:=s[i];
  while i<j do
  begin
    while (j>i) and (s[j,1]>=s[0,1]) do
      dec(j);
    if j>i then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and (s[i,1]<=s[0,1]) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if l<i-1 then qsort(l,i-1);
  if r>i+1 then qsort(i+1,r);
end;
procedure dfs(t:integer);
var
  i:integer;
begin
  v[t]:=true;
  for i:=p[t,1] to p[t,2] do
    if not v[s[i,2]] then
    begin
      dfs(s[i,2]);
      if tot[s[i,2]]+1>d[t] then
        d[t]:=tot[s[i,2]]+1;
      inc(tot[t],tot[s[i,2]]+1);
    end;
end;
begin
  randomize;
  fillchar(d,sizeof(d),0);
  fillchar(tot,sizeof(tot),0);
  fillchar(v,sizeof(v),false);
  readln(n);
  dec(n);
  for i:=1 to n do
    read(s[i,1],s[i,2]);
  for i:=1 to n do
  begin
    s[n+i,1]:=s[i,2];
    s[n+i,2]:=s[i,1];
  end;
  qsort(1,2*n);
  p[s[1,1],1]:=1;
  for i:=2 to 2*n do
    if s[i,1]<>s[i-1,1] then
    begin
      p[s[i-1,1],2]:=i-1;
      p[s[i,1],1]:=i;
    end;
  p[s[2*n,1],2]:=2*n;
  dfs(1);
  a1:=n+1;
  for i:=1 to n+1 do
  begin
    a2:=n-tot[i];
    if d[i]>a2 then
      a2:=d[i];
    if a2<a1 then
    begin
      c:=1;
      a[c]:=i;
      a1:=a2;
    end else
    if a2=a1 then
    begin
      inc(c);
      a[c]:=i;
    end;
  end;
  writeln(a1,' ',c);
  for i:=1 to c-1 do
    write(a[i],' ');
  writeln(a[c]);
end.
