var
  a,i,i1:longint;
  bl:array[1..5000] of boolean;
  s1,s2:array[0..5000] of integer;
  st:ansistring;
begin
  readln(st);
  i1:=length(st);
  for i:=1 to i1 do
    if st[i]='+' then
      bl[i]:=true
    else bl[i]:=false;
  s1[0]:=0;s2[0]:=0;
  readln(st);
  if length(st)<>i1 then
  begin
    writeln(-1);
    halt;
  end;
  for i:=1 to i1 do
  begin
    if (st[i]='+') and not bl[i] then
    begin
      inc(s1[0]);
      s1[s1[0]]:=i;
    end;
    if (st[i]='-') and bl[i] then
    begin
      inc(s2[0]);
      s2[s2[0]]:=i;
    end;
  end;
  if (s1[0]<>s2[0]) then
  begin
    writeln(-1);
    halt;
  end;
  a:=0;
  for i:=1 to s1[0] do
    inc(a,abs(s1[i]-s2[i]));
  writeln(a);
end.
