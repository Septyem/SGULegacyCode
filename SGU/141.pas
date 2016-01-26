var
  x1,x2,p,k,x,y,xi,yi,xj,g,p1,p2,n1,n2,t:int64;
function gcd(a,b:int64):int64;
begin
  if a mod b=0 then
  begin
    x:=0;y:=1;
    gcd:=b;
    exit;
  end;
  gcd:=gcd(b,a mod b);
  t:=x;
  x:=y;
  y:=t-a div b*x;
end;
begin
  readln(x1,x2,p,k);
  g:=gcd(x1,x2);
  if p mod g<>0 then
  begin
    writeln('NO');
    halt;
  end;
  x:=x*p div g;
  y:=y*p div g;
  x1:=x1 div g;
  x2:=x2 div g;
  xi:=x mod x2;
  if abs(xi+x2)<abs(xi) then
    xi:=xi+x2;
  if abs(xi-x2)<abs(xi) then
    xi:=xi-x2;
  yi:=y mod x1;
  if abs(yi+x1)<abs(yi) then
    yi:=yi+x1;
  if abs(yi-x1)<abs(yi) then
    yi:=yi-x1;
  xj:=x+(y-yi) div x1*x2;
  if xi>xj then
  begin
    yi:=xi;xi:=xj;xj:=yi;
  end;
  dec(xi,x2);inc(xj,x2);
  yi:=y+(x-xi) div x2*x1;
  while xi<=xj do
  begin
    if not odd(k-abs(xi)-abs(yi)) and (abs(xi)+abs(yi)<=k) then
    begin
      x:=xi;y:=yi;
      if x<0 then
      begin
        p1:=0;n1:=-x;
      end else
      begin
        p1:=x;n1:=0;
      end;
      if y<0 then
      begin
        p2:=0;n2:=-y;
      end else
      begin
        p2:=y;n2:=0;
      end;
      k:=(k-abs(x)-abs(y)) shr 1;
      inc(p2,k);inc(n2,k);
      writeln('YES');
      writeln(p1,' ',n1,' ',p2,' ',n2);
      halt;
    end;
    inc(xi,x2);
    dec(yi,x1);
  end;
  writeln('NO');
end.
