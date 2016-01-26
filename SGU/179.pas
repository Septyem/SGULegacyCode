var
  i,j:longint;
  a:array[0..10000] of integer;
  s:ansistring;
begin
  readln(s);
  a[0]:=0;
  for i:=1 to length(s) do
    if s[i]='(' then
    begin
      inc(a[0]);
      a[a[0]]:=i;
    end;
  j:=a[0];
  while (j>0) and (a[j]=j*2-1) do
    dec(j);
  if j=0 then
  begin
    writeln('No solution');
    halt;
  end;
  inc(a[j]);
  for i:=j+1 to a[0] do
    a[i]:=a[j]+i-j;
  j:=1;
  for i:=1 to length(s) do
    if (j<=a[0]) and (i=a[j]) then
    begin
      write('(');
      inc(j);
    end else
      write(')');
  writeln;
end.