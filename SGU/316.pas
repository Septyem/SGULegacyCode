var
  n,m,i,x,y:longint;
  s:array[1..6,1..2] of longint;
begin
  readln(n,m);
  for i:=1 to n do
  begin
    s[i,1]:=100;
    s[i,2]:=0;
  end;
  for i:=1 to m do
  begin
    read(x,y);
    if s[x,1]>0 then
    begin
      if s[y,1]>0 then
        inc(s[x,2],3);
      dec(s[y,1],8);
    end;
  end;
  for i:=1 to n do
    if s[i,1]>0 then
      inc(s[i,2],s[i,1] div 2);
  for i:=1 to n do
    writeln(s[i,1],' ', s[i,2]);
end.
