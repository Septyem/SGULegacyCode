var
  n,i,j,l:longint;
  s:string;
begin
  readln(n);
  for i:=1 to n do
  begin
    readln(s);
    l:=length(s);
    if ((s[l-1]='c') and (s[l]='h')) or (s[l]='x') or (s[l]='s') or (s[l]='o') then
    begin
      write(s);
      writeln('es');
    end else
    if s[l]='f' then
    begin
      for j:=1 to l-1 do
        write(s[j]);
      writeln('ves');
    end else
    if (s[l-1]='f') and (s[l]='e') then
    begin
      for j:=1 to l-2 do
        write(s[j]);
      writeln('ves');
    end else
    if s[l]='y' then
    begin
      for j:=1 to l-1 do
        write(s[j]);
      writeln('ies');
    end else
    begin
      write(s);
      writeln('s');
    end;
  end;
end.
