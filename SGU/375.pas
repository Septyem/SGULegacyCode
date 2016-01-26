var
  n,i,c:longint;
  s:array[1..100] of integer;
begin
  readln(n);
  c:=0;
  if odd(n) then
    while n<>1 do
    begin
      inc(c);
      if odd(n shr 1) then
      begin
        s[c]:=2;
        n:=n shr 1;
      end else
      begin
        s[c]:=1;
        n:=(n+1) shr 1;
      end;
    end;
  if n=1 then
  begin
    writeln(c);
    for i:=c downto 1 do
    begin
      write(s[i]);
      if i<>1 then write(' ')
        else writeln;
    end;
  end else
    writeln('No solution');
end.
