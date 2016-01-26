var
  n,m,i,x,y,x1,y1,c,c1:longint;
  p,p1,s:array[0..200] of integer;
procedure backx(x:integer);
begin
  if p[x]=x then
  begin
    x1:=x;
    c:=1;
    exit;
  end;
  backx(p[x]);
  p[x]:=x1;
  p1[x]:=p1[x]*c;
  c:=c*(p1[x] div c);
end;
procedure backy(y:integer);
begin
  if p[y]=y then
  begin
    y1:=y;
    c1:=1;
    exit;
  end;
  backy(p[y]);
  p[y]:=y1;
  p1[y]:=p1[y]*c1;
  c1:=c1*(p1[y] div c1);
end;
begin
  readln(n,m);
  for i:=1 to n do
  begin
    p[i]:=i;
    p1[i]:=1;
  end;
  for i:=1 to m do
  begin
    readln(x,y);
    backx(x);
    backy(y);
    if (x1=y1) and (c=c1) then
    begin
      writeln('no');
      halt;
    end;
    if x1<>y1 then
    begin
      p[y1]:=x1;
      p1[y1]:=-c*c1;
    end;
  end;
  writeln('yes');
  s[0]:=0;
  for i:=1 to n do
  begin
    backx(i);
    if c=-1 then
    begin
      inc(s[0]);
      s[s[0]]:=i;
    end;
  end;
  writeln(s[0]);
  for i:=1 to s[0]-1 do
    write(s[i],' ');
  writeln(s[s[0]]);
end.
