var
  n,i,j,ans:longint;
  p:array[1..5000,1..4] of longint;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to 4 do
      read(p[i,j]);
  for i:=1 to n do
    for j:=i+1 to n do
    begin
      if (p[i,1]=p[j,1]) and (p[i,2]=p[j,2]) then
        if (p[i,3]-p[i,1])*(p[j,3]-p[j,1])+(p[i,4]-p[i,2])*(p[j,4]-p[j,2])=0 then
          inc(ans);
      if (p[i,3]=p[j,1]) and (p[i,4]=p[j,2]) then
        if (p[i,1]-p[i,3])*(p[j,3]-p[j,1])+(p[i,2]-p[i,4])*(p[j,4]-p[j,2])=0 then
          inc(ans);
      if (p[i,1]=p[j,3]) and (p[i,2]=p[j,4]) then
        if (p[i,3]-p[i,1])*(p[j,1]-p[j,3])+(p[i,4]-p[i,2])*(p[j,2]-p[j,4])=0 then
          inc(ans);
      if (p[i,3]=p[j,3]) and (p[i,4]=p[j,4]) then
        if (p[i,1]-p[i,3])*(p[j,1]-p[j,3])+(p[i,2]-p[i,4])*(p[j,2]-p[j,4])=0 then
          inc(ans);
    end;
  writeln(ans);
end.
