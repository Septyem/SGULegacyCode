var
  n,i,ch:longint;
  s,ans:array[0..50000,1..3] of integer;
  l,r,f:array[1..50000] of integer;
procedure qsort(a,b:longint);
var
  i,j,m:longint;
begin
  i:=a;j:=b;m:=random(b-a)+a;
  s[0]:=s[m];s[m]:=s[a];
  while i<j do
  begin
    while (i<j) and (s[j,1]>s[0,1]) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and (s[i,1]<s[0,1]) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
procedure change(x:longint);
begin
  ch:=f[x];
  f[x]:=f[ch];
  if f[ch]<>0 then
    r[f[ch]]:=x;
  r[ch]:=l[x];
  l[x]:=ch;f[ch]:=x;
end;
begin
  fillchar(f,sizeof(f),0);
  fillchar(l,sizeof(l),0);
  fillchar(r,sizeof(r),0);
  randomize;
  readln(n);
  for i:=1 to n do
  begin
    s[i,3]:=i;
    readln(s[i,1],s[i,2]);
  end;
  qsort(1,n);
  for i:=2 to n do
  begin
    r[i-1]:=i;f[i]:=i-1;
    while (f[i]<>0) and (s[f[i],2]>s[i,2]) do
      change(i);
  end;
  writeln('YES');
  s[0,3]:=0;
  fillchar(ans,sizeof(ans),0);
  for i:=1 to n do
  begin
    ans[s[i,3],2]:=s[l[i],3];
    ans[s[l[i],3],1]:=s[i,3];
    ans[s[i,3],3]:=s[r[i],3];
    ans[s[r[i],3],1]:=s[i,3];
  end;
  for i:=1 to n do
    writeln(ans[i,1],' ',ans[i,2],' ',ans[i,3]);
end.

