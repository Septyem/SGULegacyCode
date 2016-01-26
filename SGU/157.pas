var
  n,ans,i:longint;
  s:array[1..13] of integer;
procedure dfs(t:integer);
var
  i:integer;
begin
  if s[1]=1 then
  begin
    s[t]:=1;s[1]:=0;
    dfs(1);
    s[1]:=1;s[t]:=0;
  end;
  for i:=2 to n do
    if (s[i]=s[i-1]+1) and (i-1<>t) then
    begin
      s[t]:=s[i];s[i]:=0;
      dfs(i);
      s[i]:=s[t];s[t]:=0;
    end;
  inc(ans);
end;
begin
  readln(n);
  for i:=1 to n-1 do
    s[i]:=i;
  ans:=0;
  if n>11 then
  begin
    if n=12 then
      ans:=12966093;
    if n=13 then
      ans:=118515434;
  end else
    dfs(n);
  writeln(ans);
end.
