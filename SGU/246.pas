var
  m,ans:int64;
begin
  readln(m);
  ans:=m div 2+1;
  if m mod 3=0 then
    dec(ans);
  writeln(ans);
end.
