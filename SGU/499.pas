var
  n,x,i,j,now,max:longint;
  s:array[1..1000000] of integer;
begin
  fillchar(s,sizeof(s),0);
  readln(n);
  max:=0;
  for i:=1 to n do
  begin
    read(x);
    inc(s[x]);
    if x>max then max:=x;
  end;
  for i:=max downto 1 do
  begin
    j:=i;now:=0;
    while j<=max do
    begin
      inc(now,s[j]);
      if now>=2 then break;
      inc(j,i);
    end;
    if now>=2 then
    begin
      writeln(i);
      halt;
    end;
  end;
end.
