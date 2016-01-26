var
  x,y,i,a1,a2:longint;
  s:array[0..1000000] of longint;
begin
  fillchar(s,sizeof(s),$ff);
  readln(x,y);
  x:=x mod y;
  i:=0;a2:=0;
  while x<>0 do
  begin
    s[x]:=i;
    inc(i);
    x:=x*10 mod y;
    if s[x]<>-1 then
    begin
      a1:=s[x];
      a2:=i-s[x];
      break;
    end;
  end;
  if a2=0 then a1:=i;
  writeln(a1,' ',a2);
end.
