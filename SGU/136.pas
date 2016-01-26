const
  lit=1e-6;
var
  n,i,c:longint;
  s:array[1..10000,1..2] of extended;
  x,y:extended;
begin
  readln(n);
  x:=0;y:=0;
  c:=-1;
  for i:=1 to n do
  begin
    readln(s[i,1],s[i,2]);
    c:=-c;
    x:=x+c*s[i,1]*2;
    y:=y+c*s[i,2]*2;
  end;
  x:=x/2;y:=y/2;
  if not odd(n) and ((abs(x)>lit) or (abs(y)>lit)) then
  begin
    writeln('NO');
    halt;
  end;
  if (abs(x-s[1,1])<lit) then
    x:=1;
  writeln('YES');
  writeln(x+lit:0:3,' ',y+lit:0:3);
  for i:=2 to n do
  begin
    x:=s[i-1,1]*2-x;
    y:=s[i-1,2]*2-y;
    writeln(x+lit:0:3,' ',y+lit:0:3);
  end;
end.
