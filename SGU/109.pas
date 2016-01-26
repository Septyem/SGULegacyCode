var
  n,i,j,k:integer;
begin
  readln(n);
  if n=2 then
  begin
    writeln(3,' ',1);
    writeln(5,' ',2,' ',3);
    halt;
  end;
  k:=n;
  write(k);
  for i:=3 to n do
    for j:=n-i+3 to n do
      write(' ',(i-1)*n+j);
  writeln;
  if odd(n) then inc(k,2)
    else inc(k);
  write(k);
  inc(k,2);
  for i:=2 to n do
    write(' ',(i-1)*n+n-i+2);
  writeln;
  for i:=n downto 2 do
  begin
    write(k);
    inc(k,2);
    for j:=1 to i do
      write(' ',(j-1)*n+i-j+1);
    writeln;
  end;
end.