type
  binary=array[1..64] of integer;
var
  n:int64;
  i,l:longint;
  dou:binary;
  s:array[0..64] of integer;
function check(now:binary):binary;
var
  i,j,z1,z2:longint;
  bl:boolean;
begin
  i:=l-1;
  while (i>0) and (now[i]=0) do
    dec(i);
  z1:=l-i-1;
  s[0]:=0;
  while i>0 do
  begin
    dec(i);z2:=0;
    while (i>0) and (now[i]=0) do
    begin
      dec(i);
      inc(z2);
    end;
    if z2>z1 then
    begin
      now[i+z2+1]:=0;
      for j:=i+z2 downto 1 do
        now[j]:=1;
      check:=check(now);
      exit;
    end;
    if z2=z1 then
    begin
      inc(s[0]);
      s[s[0]]:=i+z2+1;
    end;
  end;
  bl:=false;
  for i:=1 to s[0] do
  begin
    z2:=s[i];
    for j:=l downto 1 do
    begin
      if now[j]<now[z2] then
        break;
      if now[j]>now[z2] then
      begin
        bl:=true;
        break;
      end;
      dec(z2);
      if z2=0 then
        z2:=l;
    end;
    if bl then
      break;
  end;
  if bl then
  begin
    i:=1;
    if z1<>0 then
      while now[i]=1 do
        inc(i);
    while now[i]=0 do
      inc(i);
    now[i]:=0;
    for j:=i-1 downto 1 do
      now[j]:=1;
    check:=check(now);
  end else
    check:=now;
end;
begin
  readln(n);
  l:=0;
  while n<>0 do
  begin
    inc(l);
    dou[l]:=n mod 2;
    n:=n div 2;
  end;
  dou:=check(dou);
  n:=0;
  for i:=l downto 1 do
  begin
    n:=n*2;
    if dou[i]=1 then
      inc(n);
  end;
  writeln(n);
end.
