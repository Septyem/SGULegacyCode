var
  n,x,i,j,j1:longint;
  bl:array[0..10000,0..200] of boolean;
  s,a:array[0..200] of longint;
begin
  readln(n,x);
  for i:=1 to n do
    read(s[i]);
  fillchar(bl,sizeof(bl),true);
  fillchar(bl[0],sizeof(bl[0]),false);
  for i:=1 to n do
    for j:=x downto s[i] do
      for j1:=1 to n do
        if (j1<>i) and (not bl[j-s[i],j1]) then
          bl[j,j1]:=false;
  a[0]:=0;
  for i:=1 to n do
    if bl[x,i] then
    begin
      inc(a[0]);
      a[a[0]]:=s[i];
    end;
  writeln(a[0]);
  for i:=1 to a[0] do
  begin
    write(a[i]);
    if i<>a[0] then write(' ')
      else writeln;
  end
end.
