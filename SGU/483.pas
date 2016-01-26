var
  n,h,i,a:longint;
begin
  readln(n,h);
  inc(h);
  a:=trunc(sqrt(n));
  if n-sqr(a)>=h then
    write(sqr(a)+h,' ');
  for i:=a downto h+1 do
    write(sqr(i-1)+h,' ');
  write(sqr(h));
  if h<>a then write(' ');
  for i:=h+1 to a do
  begin
    write(sqr(i-1)+i-1+h);
    if i<>a then write(' ');
  end;
  if sqr(a)+a+h<=n then
    write(' ',sqr(a)+a+h);
  writeln;
end.
