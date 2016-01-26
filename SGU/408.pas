var
  n,i,j,ans:longint;
  d:array[0..1000,0..1000] of longint;
begin
  fillchar(d,sizeof(d),0);
  readln(n);
  d[0,0]:=0;
  d[1,1]:=1;
  d[2,2]:=5;
  for i:=3 to n do
  begin
    d[i,2]:=d[i-1,2]+2*i;
    for j:=3 to n do
    begin
      if d[i-1,j]>d[i-1,j-1] then
        d[i,j]:=d[i-1,j]
      else d[i,j]:=d[i-1,j-1];
      inc(d[i,j],j*(i+2-j));
    end;
  end;
  ans:=0;
  for j:=0 to n do
    if d[n,j]>ans then
      ans:=d[n,j];
  writeln(ans,'.000');
end.
