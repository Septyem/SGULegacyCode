var
  n,m,i,j,x,y:longint;
  s:array[1..10000] of int64;
  ans:int64;
begin
  fillchar(s,sizeof(s),0);
  readln(n,m);
  for i:=1 to m do
  begin
    read(x,y);
    inc(s[x]);
    inc(s[y]);
  end;
  ans:=0;
  for i:=1 to n do
    inc(ans,sqr(s[i]));
  writeln(ans);
end.
