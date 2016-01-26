var
  n,m,i,j,min:longint;
  a:array[1..1000,1..1000] of integer;
begin
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do
      read(a[i,j]);
  for i:=n+m downto 2 do
  begin
    min:=maxint;
    if i-1<m then
      min:=a[1,i];
    for j:=i-1 downto 1 do
      if (j<=m) and (i-j<=n) then
      begin
        if a[i-j,j]>min then
          a[i-j,j]:=min;
        if (i-j<>n) and (a[i-j+1,j]<a[i-j,j]) then
          a[i-j,j]:=a[i-j+1,j];
        if a[i-j,j]<min then
          min:=a[i-j,j];
      end;
  end;
  for i:=1 to n do
  begin
    for j:=1 to m-1 do
      write(a[i,j],' ');
    writeln(a[i,m]);
  end;
end. 

