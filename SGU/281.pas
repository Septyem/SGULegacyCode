var
  n,i,j,l,m:longint;
  s1,s2,s:array[0..50000] of string[30];
  p,a1,a2:array[0..50000] of longint;
  v:array[1..50000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  r:=random(b-a)+a;i:=a;j:=b;
  s1[0]:=s1[r];s1[r]:=s1[a];
  while i<j do
  begin
    while (i<j) and (s1[j]>s1[0]) do
      dec(j);
    if i<j then
    begin
      s1[i]:=s1[j];
      inc(i);
    end;
    while (i<j) and (s1[i]<s1[0]) do
      inc(i);
    if i<j then
    begin
      s1[j]:=s1[i];
      dec(j);
    end;
  end;
  s1[i]:=s1[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
procedure qsort1(a,b:longint);
var
  i,j,r:longint;
begin
  r:=random(b-a)+a;i:=a;j:=b;
  s1[0]:=s1[r];s1[r]:=s1[a];
  a1[0]:=a1[r];a1[r]:=a1[a];
  while i<j do
  begin
    while (i<j) and (s1[j]>s1[0]) do
      dec(j);
    if i<j then
    begin
      s1[i]:=s1[j];
      a1[i]:=a1[j];
      inc(i);
    end;
    while (i<j) and (s1[i]<s1[0]) do
      inc(i);
    if i<j then
    begin
      s1[j]:=s1[i];
      a1[j]:=a1[i];
      dec(j);
    end;
  end;
  s1[i]:=s1[0];a1[i]:=a1[0];
  if i+1<b then qsort1(i+1,b);
  if i-1>a then qsort1(a,i-1);
end;
procedure qsort2(a,b:longint);
var
  i,j,r:longint;
begin
  r:=random(b-a)+a;i:=a;j:=b;
  s2[0]:=s2[r];s2[r]:=s2[a];
  a2[0]:=a2[r];a2[r]:=a2[a];
  while i<j do
  begin
    while (i<j) and (s2[j]>s2[0]) do
      dec(j);
    if i<j then
    begin
      s2[i]:=s2[j];
      a2[i]:=a2[j];
      inc(i);
    end;
    while (i<j) and (s2[i]<s2[0]) do
      inc(i);
    if i<j then
    begin
      s2[j]:=s2[i];
      a2[j]:=a2[i];
      dec(j);
    end;
  end;
  s2[i]:=s2[0];a2[i]:=a2[0];
  if i+1<b then qsort2(i+1,b);
  if i-1>a then qsort2(a,i-1);
end;
begin
  randomize;
  readln(n);
  for i:=1 to n do
  begin
    readln(s1[i]);
    a1[i]:=i;
  end;
  s:=s1;
  qsort1(1,n);
  for i:=1 to n do
  begin
    readln(s2[i]);
    a2[i]:=i;
  end;
  qsort2(1,n);
  for i:=1 to n do
    p[a1[i]]:=a2[i];
  fillchar(v,sizeof(v),false);
  m:=0;l:=0;
  for i:=1 to n do
  begin
    v[p[i]]:=true;
    while v[m+1] do
    begin
      inc(l);
      inc(m);
      s1[l]:=s[m];
    end;
    if m=i then
    begin
      qsort(1,l);
      for j:=1 to l do
        writeln(s1[j]);
      l:=0;
    end;
  end;
end.
