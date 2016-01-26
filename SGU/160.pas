var
  n,m,i,j,x:longint;
  bl,p,a:array[0..1000] of integer;
begin
  fillchar(bl,sizeof(bl),$ff);
  readln(n,m);
  for i:=1 to n do
  begin
    read(x);
    x:=x mod m;
    if bl[x]=-1 then
    begin
      p[x]:=-1;
      bl[x]:=i;
    end;
    for j:=1 to m-1 do
      if (bl[j]<>-1) and (bl[j]<>i) and (bl[j*x mod m]=-1) then
      begin
        p[j*x mod m]:=j;
        bl[j*x mod m]:=i;
      end;
  end;
  x:=m-1;
  while (x>1) and (bl[x]=-1) do
    dec(x);
  writeln(x);
  if x<>1 then
  begin
    a[0]:=0;
    while x<>-1 do
    begin
      inc(a[0]);
      a[a[0]]:=bl[x];
      x:=p[x];
    end;
    for i:=a[0] downto 2 do
      write(a[i],' ');
    writeln(a[1]);
  end;
end.

