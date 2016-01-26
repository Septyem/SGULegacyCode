var
  n,i:longint;
begin
  readln(n);
  if n=1 then
    writeln('1 0')
  else if n=2 then
  begin
    writeln('2 1');
    writeln('1 2');
  end else
  if n=3 then
  begin
    writeln('3 3');
    writeln('1 2');
    writeln('1 3');
    writeln('2 3');
  end else
  begin
    writeln(n,' ',2*n-4);
    for i:=3 to n do
    begin
      writeln('1 ',i);
      writeln('2 ',i);
    end;
  end;
end. 
