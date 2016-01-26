var
  n,i,x,x1,x2,h,t,t1:longint;
  bl:array[1..1000,1..1000] of boolean;
  l,r:array[1..1000] of integer;
  use:array[1..1000] of boolean;
procedure s_r(x:integer);
var
  i:integer;
begin
  use[x]:=true;
  i:=1;
  while (i<=n) and (use[i] or not bl[x,i]) do
    inc(i);
  if i<=n then
  begin
    l[i]:=x;
    r[x]:=i;
    s_r(i);
  end else
    t:=x;
end;
procedure s_l(x:integer);
var
  i:integer;
begin
  use[x]:=true;
  i:=1;
  while (i<=n) and (use[i] or not bl[x,i]) do
    inc(i);
  if i<=n then
  begin
    r[i]:=x;
    l[x]:=i;
    s_l(i);
  end else
    h:=x;
end;
begin
  fillchar(bl,sizeof(bl),false);
  readln(n);
  for i:=1 to n do
  begin
    while not eoln do
    begin
      read(x);
      if (x<>i) and not bl[x,i] then
      begin
        bl[i,x]:=true;
        bl[x,i]:=true;
      end;
    end;
    readln;
  end;
  fillchar(use,sizeof(use),false);
  s_r(1);
  s_l(1);
  if not bl[h,t] then
  begin
    x1:=h;
    repeat
      x:=x1;
      x1:=r[x1];
      if bl[x1,h] and bl[x,t] then
        break;
    until false;
    l[t]:=x;r[x]:=t;
    x:=r[x1];r[x1]:=h;
    t1:=t;t:=x1;
    while x1<>t1 do
    begin
      l[x1]:=x;
      x2:=r[x];
      r[x]:=x1;
      x1:=x;
      x:=x2;
    end;
  end;
  r[t]:=h;l[h]:=t;
  for i:=1 to n do
    if not use[i] then
    begin
      x:=h;
      while true do
      begin
        if bl[x,i] and bl[r[x],i] then
        begin
          l[r[x]]:=i;r[i]:=r[x];
          l[i]:=x;r[x]:=i;
          break;
        end;
        x:=r[x];
      end;
    end;
  write(1);
  x:=r[1];
  while x<>1 do
  begin
    write(' ',x);
    x:=r[x];
  end;
  writeln(' ',1);
end.
