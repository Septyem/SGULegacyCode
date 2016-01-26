var
  n,i,j,p:longint;
  ans,x:int64;
  s:array[1..100] of int64;
begin
  readln(n);
  for i:=1 to n do
  begin
    read(s[i]);
 end;
  ans:=0;
  x:=1 shl 62;
  for i:=61 downto 0 do
  begin
    x:=x shr 1;
    p:=1;
    while (p<=n) and (s[p] and x=0) do
      inc(p);
    if p>n then
      continue;
    if ans and x=0 then
      ans:=ans xor s[p];
    for j:=p+1 to n do
      if s[j] and x<>0 then
        s[j]:=s[j] xor s[p];
    s[p]:=0;
  end;
  writeln(ans);
end.
