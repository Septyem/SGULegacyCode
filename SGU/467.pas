const
  ans:array[0..4] of integer=(0,78,95,99,100);
var
  n,i,j:longint;
begin
  i:=0;
  while not eof do
  begin
    inc(i);
    readln(n);
    j:=0;
    while n>ans[j] do
      inc(j);
    writeln('Case #',i,': ',j);
  end;
end.
