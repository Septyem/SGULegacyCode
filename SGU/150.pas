const
  lit=1e-6;
var
  x1,y1,x2,y2,n,i,c:longint;
  my,mx,mi,ax,ay:real;
begin
  readln(x1,y1,x2,y2,n);
  if (x1=x2) or (y1=y2) then
  begin
    writeln('no solution');
    halt;
  end;
  my:=x1;mx:=my;
  if x1>x2 then
    c:=-1
  else c:=1;
  mi:=(x2-x1)/(y2-y1);
  if c*mi<0 then
    mi:=-mi;
  i:=0;
  while i<n do
  begin
    inc(i);
    if abs(mx-my)<lit then
    begin
      ax:=mx;
      mx:=mx+c;
      my:=my+mi;
    end else
      if abs(mx-x1)<abs(my-x1) then
      begin
        ax:=mx;
        mx:=mx+c;
      end else
      begin
        ax:=my;
        my:=my+mi;
      end;
    if abs(ax-x2)<lit then
    begin
      i:=-1;
      break;
    end;
  end;
  if i=n then
  begin
    ay:=(ax-x1)*(y2-y1)/(x2-x1)+y1;
    if abs(ay-round(ay))<lit then
      if y2<y1 then
        ay:=ay-lit
      else ay:=ay+lit;
    if abs(ax-round(ax))<lit then
      ax:=ax+c*lit;
    if ay<0 then
      ay:=ay-1;
    if ax<0 then
      ax:=ax-1;
    writeln(trunc(ax),' ',trunc(ay));
  end else
    writeln('no solution');
end.
