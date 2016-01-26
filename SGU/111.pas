var
  k,i,j,l:longint;
  a,b,d:array[-1..1002] of integer;
  s:ansistring;
function check(n:integer):boolean;
var
  i:integer;
begin
  k:=0;
  for i:=n downto 0 do
  begin
    k:=b[i]*j+k;
    d[i]:=k mod 10;
    k:=k div 10;
  end;
  d[-1]:=k;
  for i:=-1 to n do
  begin
    if d[i]>a[i+n] then
    begin
      check:=false;
      exit;
    end;
    if d[i]<a[i+n] then
    begin
      check:=true;
      exit;
    end;
  end;
  check:=true;
end;
begin
  fillchar(b,sizeof(b),0);
  readln(s);
  l:=length(s);
  for i:=1 to l do
    a[i]:=ord(s[i])-48;
  if odd(l) then
  begin
    for i:=l downto 1 do
      a[i+1]:=a[i];
    a[1]:=0;
    inc(l);
  end;
  for i:=1 to l shr 1 do
  begin
    b[i-1]:=b[i-1]*2;
    if b[i-1]>9 then
    begin
      inc(b[i-2]);
      dec(b[i-1],10);
    end;
    for j:=9 downto 0 do
    begin
      b[i]:=j;
      if check(i) then
      begin
        write(j);
        break;
      end;
    end;
    for j:=2*i downto i-1 do
    begin
      dec(a[j],d[j-i]);
      if a[j]<0 then
      begin
        inc(a[j],10);
        dec(a[j-1]);
      end;
    end;
  end;
  writeln;
end.