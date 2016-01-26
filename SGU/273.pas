var
  b,r,y,w,i,j,j1,l,x:longint;
  c1,c2:char;
  rule:array[1..4,1..4,1..4] of boolean;
  d:array[1..200,1..200,1..4] of boolean;
  s:string;
  get:boolean;
procedure init(x,t:longint);
var
  i,x1,x2:integer;
begin
  for i:=1 to t do
  begin
    readln(c1,c2);
    case c1 of
      'b':x1:=1;
      'r':x1:=2;
      'y':x1:=3;
      'w':x1:=4;
    end;
    case c2 of
      'b':x2:=1;
      'r':x2:=2;
      'y':x2:=3;
      'w':x2:=4;
    end;
    rule[x1,x2,x]:=true;
  end;
end;
procedure check(a,b,c:longint);
var
  i1,i2,i3:integer;
begin
  for i1:=1 to 4 do
    if d[a,b,i1] then
      for i2:=1 to 4 do
        if d[b+1,c,i2] then
          for i3:=1 to 4 do
            if rule[i1,i2,i3] then
              d[a,c,i3]:=true;
end;
begin
  fillchar(d,sizeof(d),false);
  fillchar(rule,sizeof(rule),false);
  readln(b,r,y,w);
  init(1,b);
  init(2,r);
  init(3,y);
  init(4,w);
  readln(s);
  l:=length(s);
  for i:=1 to l do
  begin
    case s[i] of
      'b':x:=1;
      'r':x:=2;
      'y':x:=3;
      'w':x:=4;
    end;
    d[i,i,x]:=true;
  end;
  for i:=1 to l-1 do
    for j:=1 to l-i do
      for j1:=0 to i-1 do
        check(j,j+j1,j+i);
  get:=false;
  for i:=1 to 4 do
    if d[1,l,i] then
      get:=true;
  if d[1,l,1] then
    write('b');
  if d[1,l,2] then
    write('r');
  if d[1,l,3] then
    write('y');
  if d[1,l,4] then
    write('w');
  if not get then
    write('Nobody');
  writeln;
end.
