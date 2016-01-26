var
  a,b,c,x1,x2,y1,y2,x,y,g,t,xmin,xmax,ym:int64;
function gcd(a,b:int64):int64;
begin
  if b=0 then
  begin
    gcd:=a;
    x:=1;
    y:=0;
    exit;
  end;
  gcd:=gcd(b,a mod b);
  t:=x;
  x:=y;
  y:=t-a div b*y;
end;
begin
  read(a,b,c,x1,x2,y1,y2);
  if (a=0) and (b=0) then
  begin
    if c<>0 then
      writeln(0)
    else writeln((y2-y1+1)*(x2-x1+1));
    halt;
  end;
  if a=0 then
  begin
    if (c mod b=0) and (-c div b>=y1) and (-c div b<=y2) then
      writeln(x2-x1+1)
    else writeln(0);
    halt;
  end;
  if b=0 then
  begin
    if (c mod a=0) and (-c div a>=x1) and (-c div a<=x2) then
      writeln(y2-y1+1)
    else writeln(0);
    halt;
  end;
  if a<0 then
  begin
    a:=-a;
    ym:=-x1;
    x1:=-x2;
    x2:=ym;
  end;
  if b<0 then
  begin
    b:=-b;
    ym:=-y1;
    y1:=-y2;
    y2:=ym;
  end;
  g:=gcd(a,b);
  if c mod g<>0 then
  begin
    writeln(0);
    halt;
  end;
  x:=x*-c div g;
  y:=y*-c div g;
  a:=a div g;
  b:=b div g;
  xmin:=(x1-x) div b*b+x;
  if x1>xmin then
    inc(xmin,b);
  xmax:=(x2-x) div b*b+x;
  if xmax>x2 then
    dec(xmax,b);
  if a*b>0 then
  begin
    ym:=x+(y-y2) div a*b;
    if y2<y-(y-y2) div a*a then
      inc(ym,b);
  end else
  begin
    ym:=x+(y-y1) div a*b;
    if y1>y-(y-y1) div a*a then
      inc(ym,b);
  end;
  if ym>xmin then
    xmin:=ym;
  if a*b>0 then
  begin
    ym:=x+(y-y1) div a*b;
    if y1>y-(y-y1) div a*a then
      dec(ym,b);
  end else
  begin
    ym:=x+(y-y2) div a*b;
    if y2<y-(y-y2) div a*a then
      dec(ym,b);
  end;
  if ym<xmax then
    xmax:=ym;
  ym:=(xmax-xmin) div b+1;
  if ym<0 then
    ym:=0;
  writeln(ym);
end.
