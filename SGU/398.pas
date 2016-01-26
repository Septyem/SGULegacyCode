var
  n,x,i,j:longint;
  s,ans:array[0..50] of integer;
  d:array[1..50,0..50] of integer;
begin
  fillchar(s,sizeof(s),0);
  readln(n,x);
  for i:=1 to n do
  begin
    read(d[i,0]);
    for j:=1 to d[i,0] do
      read(d[i,j]);
  end;
  s[x]:=1;
  for i:=1 to d[x,0] do
    s[d[x,i]]:=1;
  for i:=1 to n do
    if (i<>x) and (s[i]=1) then
      for j:=1 to d[i,0] do
        if s[d[i,j]]=0 then
          s[d[i,j]]:=2;
  ans[0]:=0;
  for i:=1 to n do
    if s[i]=2 then
    begin
      inc(ans[0]);
      ans[ans[0]]:=i;
    end;
  writeln(ans[0]);
  for i:=1 to ans[0] do
  begin
    write(ans[i]);
    if i=ans[0] then
      writeln
    else write(' ');
  end;
end.
