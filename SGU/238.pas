var
  n,i,j,x,y,ans:integer;
  s:array[1..18] of integer;
  v:array[1..18] of boolean;
procedure dfs;
var
  i,j:integer;
  s1,s2:array[0..18] of integer;
begin
  inc(ans);
  s1[0]:=0;
  for i:=1 to n do
    if s[i]=0 then
    begin
      inc(s1[0]);
      s1[s1[0]]:=i;
    end;
  for i:=1 to s1[0] do
  begin
    if v[s1[i]] then
      continue;
    s2[0]:=0;
    for j:=1 to n do
      if s[j]=s1[i] then
      begin
        inc(s2[0]);
        s2[s2[0]]:=j;
      end;
    for j:=1 to s2[0] do
      s[s2[j]]:=0;
    for j:=1 to s1[0] do
      if j<>i then
        s[s1[j]]:=s1[i];
    v[s1[i]]:=true;
    dfs;
    v[s1[i]]:=false;
    for j:=1 to s2[0] do
      s[s2[j]]:=s1[i];
    for j:=1 to s1[0] do
      s[s1[j]]:=0;
  end;
end;
begin
  fillchar(s,sizeof(s),0);
  readln(n);
  for i:=1 to n do
  begin
    read(x);
    for j:=1 to x do
    begin
      read(y);
      s[y]:=i;
    end;
  end;
  fillchar(v,sizeof(v),false);
  ans:=0;
  dfs;
  if n=1 then
    ans:=1;
  writeln(ans);
end.
