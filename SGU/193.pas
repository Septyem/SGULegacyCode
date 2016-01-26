var
  i,k,k1,d:longint;
  s:ansistring;
  a:array[0..2001] of integer;
begin
  fillchar(a,sizeof(a),0);
  readln(s);
  a[0]:=length(s);
  for i:=1 to a[0] do
    a[i]:=ord(s[a[0]-i+1])-48;
  if odd(a[1]) then
    d:=0
  else d:=1;
  if d<>0 then
  begin
    k:=a[1]+a[2]*10;
    if (k-2) mod 100 mod 4=0 then
      d:=2;
  end;
  k:=0;
  for i:=a[0] downto 1 do
  begin
    k1:=a[i] mod 2;
    a[i]:=a[i] div 2+k*5;
    k:=k1;
  end;
  k1:=1;
  dec(a[k1],d);
  while a[k1]<0 do
  begin
    dec(a[k1+1]);
    inc(a[k1],10);
    inc(k1);
  end;
  while a[a[0]]=0 do
    dec(a[0]);
  for i:=a[0] downto 1 do
    write(a[i]);
  writeln;
end. 

