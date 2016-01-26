var
  i,j,j1,a:longint;
  s:array[1..16] of integer;
begin
  for i:=0 to 3 do
    for j:=1 to 4 do
    begin
      read(s[i*4+j]);
      if s[i*4+j]=0 then
      begin
        a:=7-i-j;
        s[i*4+j]:=16;
      end;
    end;
  for i:=1 to 16 do
    if s[i]<>i then
    begin
      j:=i;j1:=s[i];
      repeat
        s[j]:=j;
        j:=j1;
        j1:=s[j];
        inc(a);
      until j=i;
      dec(a);
    end;
  if odd(a) then
    writeln('NO')
  else writeln('YES');
end.

