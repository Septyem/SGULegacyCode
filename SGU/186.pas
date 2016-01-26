var
  n,i,j,m,a:longint;
  s:array[0..100] of longint;
begin
  readln(n);
  for i:=1 to n do
    read(s[i]);
  for i:=1 to n do
  begin
    m:=i;
    for j:=i+1 to n do
      if s[j]<s[m] then
        m:=j;
    s[0]:=s[m];
    s[m]:=s[i];
    s[i]:=s[0];
  end;
  a:=0;m:=n-1;
  for i:=1 to n do
  begin
    if m<s[i] then
      inc(a,m)
    else inc(a,s[i]);
    dec(m,s[i]+1);
    if m<0 then
      break;
  end;
  writeln(a);
end. 

