var
  n,k1,k2,p1,p2,p3,ans:int64;
begin
  readln(n,k1,k2,p1,p2,p3);
  ans:=0;
  dec(n,p1);
  if n>=0 then
    inc(ans,k1);
  if n>0 then
  begin
    if n>=k2*p2 then
    begin
      dec(n,k2*p2);
      inc(ans,k2);
    end else
    begin
      inc(ans,(n-1) div p2+1);
      n:=-1;
    end;
  end;
  if n>0 then
    inc(ans,(n-1) div p3+1);
  writeln(ans);
end.
