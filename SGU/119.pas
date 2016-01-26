var
  n,a0,b0,tot,i,gt:longint;
  s:array[0..10000,1..2] of longint;
function gcd(a,b:longint):longint;
begin
  if a mod b=0 then
    gcd:=b
  else gcd:=gcd(b,a mod b);
end;
procedure qsort(a,b:longint);
var
  i,j,m:longint;
begin
  i:=a;j:=b;m:=random(b-a)+a;
  s[0]:=s[m];s[m]:=s[a];
  while i<j do
  begin
    while (i<j) and ((s[j,1]>s[0,1]) or ((s[j,1]=s[0,1]) and (s[j,2]>s[0,2]))) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and ((s[i,1]<s[0,1]) or ((s[i,1]=s[0,1]) and (s[i,2]<s[0,2]))) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b);
  if j-1>a then qsort(a,j-1);
end;
begin
  randomize;
  read(n,a0,b0);
  if a0=0 then
    gt:=gcd(b0,n)
  else
  if b0=0 then
    gt:=gcd(a0,n)
  else
    gt:=gcd(gcd(a0,b0),n);
  n:=n div gt;
  a0:=a0 div gt;
  b0:=b0 div gt;
  writeln(n);
  for i:=0 to n-1 do
  begin
    s[i+1,1]:=a0*i mod n;
    s[i+1,2]:=b0*i mod n;
  end;
  qsort(1,n);
  for i:=1 to n do
    writeln(s[i,1]*gt,' ',s[i,2]*gt);
end.