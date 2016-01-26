var
  n,m,k,i,j:longint;
  map:array[1..200,1..200] of integer;
  v:array[1..200] of integer;
  find:boolean;
procedure dfs(t,c:integer);
var
  i:integer;
begin
  v[t]:=c;
  if c=3 then
    exit;
  for i:=1 to n do
    if (map[t,i]<=k) and ((v[i]=-1) or (v[i]>c+1)) then
      dfs(i,c+1);
end;
begin
  readln(n,m);
  k:=(m+1) div 2;
  for i:=1 to n do
    for j:=1 to n do
      read(map[i,j]);
  find:=true;
  for i:=1 to n do
  begin
    fillchar(v,sizeof(v),$ff);
    dfs(i,0);
    for j:=1 to n do
      if v[j]=-1 then
      begin
        find:=false;
        break;
      end;
    if not find then
      break;
  end;
  if find then
  begin
    writeln(k);
    for i:=1 to k do
      write(i,' ');
  end else
  begin
    writeln(m-k);
    for i:=k+1 to m do
      write(i,' ');
  end;
  writeln;
end.
