var
  k,i,j,c,x,y:longint;
  s:array[0..10000,1..4] of integer;
begin
  readln(k);
  for i:=1 to k do
  begin
    for j:=1 to 4 do
      read(s[i,j]);
    if (s[i,4]<s[i,2]) or (s[i,3]<s[i,1]) then
    begin
      s[0]:=s[i];
      s[i,1]:=s[0,3];s[i,2]:=s[0,4];
      s[i,3]:=s[0,1];s[i,4]:=s[0,2];
    end;
  end;
  read(x,y);
  c:=0;
  for i:=1 to k do
    if ((x=s[i,1]) and (s[i,2]<=y) and (s[i,4]>=y)) or
    ((y=s[i,2]) and (s[i,1]<=x) and (s[i,3]>=x)) then
    begin
      writeln('BORDER');
      halt;
    end;
  for i:=1 to k do
    if (s[i,2]<>s[i,4]) and (s[i,1]>x) then
      if (s[i,4]>y) and (s[i,2]<=y) then
        inc(c);
  if odd(c) then
    writeln('INSIDE')
  else writeln('OUTSIDE');
end.
