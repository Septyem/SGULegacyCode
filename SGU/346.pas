var
  i,j,ans:longint;
  c:array[1..7] of integer;
  s:string;
begin
  for i:=1 to 7 do
    read(c[i]);
  readln;
  readln(s);
  ans:=0;
  j:=7;
  while (j>=2) and (c[j]=0) do
    dec(j);
  if (s='RED') and (j>=2) then
    inc(ans,j);
  inc(ans,c[1]*(j+1));
  j:=2;
  while (j<=7) and (c[j]=0) do
    inc(j);
  for i:=j to 7 do
    inc(ans,i);
  writeln(ans);
end.
