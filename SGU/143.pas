var
  n,i,j,ans:longint;
  v,f:array[1..16000] of longint;
  r:array[0..32000,1..2] of integer;
  p:array[1..16000,1..2] of integer;
  bl:array[1..16000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,m,m1,ra:longint;
begin
  i:=a;j:=b;
  ra:=random(b-a)+a;
  r[0]:=r[ra];r[ra]:=r[a];r[a]:=r[0];
  m:=r[a,1];m1:=r[a,2];
  while i<j do
  begin
    while (i<j) and ((m<r[j,1]) or ((m=r[j,1]) and (m1<r[j,2]))) do
      dec(j);
    if i<j then
    begin
      r[i]:=r[j];
      inc(i);
    end;
    while (i<j) and ((m>r[i,1]) or ((m=r[i,1]) and (m1>r[i,2]))) do
      inc(i);
    if i<j then
    begin
      r[j]:=r[i];
      dec(j);
    end;
  end;
  r[i,1]:=m;r[i,2]:=m1;
  if i+1<b then qsort(i+1,b);
  if j-1>a then qsort(a,j-1);
end;
procedure tdp(t:longint);
var
  i:longint;
begin
  bl[t]:=false;
  f[t]:=v[t];
  for i:=p[t,1] to p[t,2] do
    if bl[r[i,2]] then
    begin
      tdp(r[i,2]);
      if f[r[i,2]]>0 then
        inc(f[t],f[r[i,2]]);
    end;
  if f[t]>ans then
    ans:=f[t];
end;
begin
  randomize;
  readln(n);
  for i:=1 to n do
    read(v[i]);
  dec(n);
  for i:=1 to n do
  begin
    readln(r[2*i-1,1],r[2*i-1,2]);
    r[2*i,1]:=r[2*i-1,2];
    r[2*i,2]:=r[2*i-1,1];
  end;
  qsort(1,2*n);
  p[r[1,1],1]:=1;
  for i:=2 to 2*n do
    if r[i,1]<>r[i-1,1] then
    begin
      p[r[i-1,1],2]:=i-1;
      p[r[i,1],1]:=i;
    end;
  p[r[2*n,1],2]:=2*n;
  ans:=-maxlongint;
  fillchar(bl,sizeof(bl),true);
  tdp(1);
  writeln(ans);
end.
