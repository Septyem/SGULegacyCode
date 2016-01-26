var
  n,i,j,m:longint;
  s:array[1..2006,1..2006] of integer;
begin
  fillchar(s,sizeof(s),0);
  readln(n);
  if odd(n) then
    m:=n+1
  else m:=n;
  for i:=1 to m div 2 do
    for j:=i+1 to m-i+1 do
      s[i,j]:=i+j-2;
  for i:=2 to m div 2 do
    s[i,m]:=i*2-2;
  for i:=m div 2+1 to m-1 do
    s[i,m]:=(i-m div 2)*2-1;
  for i:=2 to m div 2-1 do
    for j:=i+1 to m-i do
      s[j,m-i+1]:=j-i;
  if n=1 then writeln(0)
    else writeln(m-1);
  for i:=1 to n do
    for j:=1 to n do
    begin
      if i>j then write(s[j,i])
      else write(s[i,j]);
      if j=n then writeln
        else write(' ');
    end;
end.
