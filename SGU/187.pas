var
  n,m,i,j,px,py,p1,p2,ch1,ch2:longint;
  l:array[0..130001,1..2] of longint;
  s:array[1..2000,1..2] of longint;
procedure back(var p1,ch:longint);
begin
  for j:=i-1 downto 1 do
    if (s[j,1]<=p1) and (s[j,2]>=p1) then
    begin
      p1:=s[j,2]-p1+s[j,1];
      ch:=3-ch;
    end;
end;
begin
  readln(n,m);
  l[0,2]:=1;
  for i:=1 to n do
  begin
    l[i,1]:=i-1;
    l[i,2]:=i+1;
  end;
  for i:=1 to m do
    readln(s[i,1],s[i,2]);
  for i:=1 to m do
  begin
    ch1:=1;ch2:=2;
    px:=s[i,1];py:=s[i,2];
    back(px,ch1);
    back(py,ch2);
    p1:=l[px,ch1];
    p2:=l[py,ch2];
    if l[p1,1]=px then
      l[p1,1]:=py
    else l[p1,2]:=py;
    if l[p2,1]=py then
      l[p2,1]:=px
    else l[p2,2]:=px;
    l[py,ch2]:=p1;
    l[px,ch1]:=p2;
  end;
  px:=0;py:=l[0,2];
  for i:=1 to n do
  begin
    if l[py,1]<>px then
      p1:=l[py,1]
    else p1:=l[py,2];
    px:=py;py:=p1;
    write(px);
    if i<>n then write(' ');
  end;
  writeln;
end.
