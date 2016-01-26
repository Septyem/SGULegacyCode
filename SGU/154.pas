var
  n,l,r,m,nn,x:longint;
begin
  readln(n);
  l:=1;r:=5*n;
  while l<r do
  begin
    m:=(l+r) shr 1;
    nn:=0;
    x:=m;
    while x<>0 do
    begin
      inc(nn,x div 5);
      x:=x div 5;
    end;
    if nn<n then l:=m+1
      else r:=m;
  end;
  x:=l;nn:=0;
  while x<>0 do
  begin
    inc(nn,x div 5);
    x:=x div 5;
  end;
  if nn=n then
    writeln(l)
  else writeln('No solution');
end.