var
  n,i,ans,now:longint;
  s:array[0..100,1..2] of longint;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s[0]:=s[r];s[r]:=s[a];
  while i<j do
  begin
    while (i<j) and ((s[j,2]>s[0,2]) or ((s[j,2]=s[0,2]) and (s[j,1]>s[0,1]))) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and ((s[i,2]<s[0,2]) or ((s[i,2]=s[0,2]) and (s[i,1]<s[0,1]))) do
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
begin
  randomize;
  readln(n);
  for i:=1 to n do
    read(s[i,1]);
  for i:=1 to n do
    read(s[i,2]);
  qsort(1,n);
  ans:=0;now:=0;
  for i:=n downto 1 do
  begin
    inc(now,s[i,1]);
    if now+s[i,2]>ans then
      ans:=now+s[i,2];
  end;
  writeln(ans);
end.
