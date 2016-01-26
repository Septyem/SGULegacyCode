var
  n,m,i,j,k,a,b:longint;
begin
  readln(n,m);
  a:=0;b:=0;
  if m mod 3>=n mod 3 then
    inc(a);
  if m mod 3>=n mod 3+1 then
    dec(b);
  if m mod 3>=1 then
    inc(b);
  if a=1 then k:=0
  else
  if b=1 then k:=2
  else k:=1;
  for i:=1 to n do
  begin
    for j:=1 to m do
      if j mod 3=k then
        write('#')
      else write('0');
    k:=(k+1) mod 3;
    writeln;
  end;
end.
