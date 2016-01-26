var
  n,i,j1,j2,ans:longint;
  s:array[1..1000] of integer;
  d:array[0..1000,0..1,0..1] of longint;
begin
  readln(n);
  for i:=1 to n do
    read(s[i]);
  fillchar(d,sizeof(d),0);
  d[1,0,0]:=1;d[1,0,1]:=1;
  for i:=2 to n do
    for j1:=0 to 1 do
      for j2:=0 to 1 do
      begin
        if s[i-1]-j1-j2=0 then
          inc(d[i,j2,0],d[i-1,j1,j2]);
        if s[i-1]-j1-j2=1 then
          inc(d[i,j2,1],d[i-1,j1,j2]);
      end;
  ans:=0;
  for j1:=0 to 1 do
    for j2:=0 to 1 do
      if j1+j2=s[n] then
        inc(ans,d[n,j1,j2]);
  writeln(ans);
end.
