var
  n,m,i:int64;
  j:longint;
begin
  readln(n);
  i:=-1;
  repeat
    inc(i);
    m:=i;
    for j:=0 to i do
      m:=m*2+1;
  until m>=n;
  writeln(i);
end.
