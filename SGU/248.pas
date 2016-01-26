var
  n,i,j,v:longint;
  c:array[1..3] of longint;
  bl:array[0..1000000] of longint;
begin
  readln(n);
  for i:=1 to n do
    read(c[i]);
  read(v);
  for i:=1 to v do
    bl[i]:=v+1;
  bl[0]:=0;
  for i:=1 to n do
    for j:=c[i] to v do
      if bl[j-c[i]]+1<bl[j] then
        bl[j]:=bl[j-c[i]]+1;
  if bl[v]=v+1 then
    writeln(-1)
  else writeln(bl[v]);
end.
