var
  n,m,i,j,a,b:longint;
  s:array[1..100,1..100] of integer;
  va:array[1..100] of boolean;
procedure dfs(t:integer);
var
  i:integer;
begin
  for i:=1 to n do
    if (s[t,i]>0) and (not va[i]) then
    begin
      dec(s[t,i]);
      dec(s[i,t]);
      va[i]:=true;
      dfs(i);
      inc(s[t,i]);
      inc(s[i,t]);
    end;
end;
begin
  fillchar(va,sizeof(va),false);
  fillchar(s,sizeof(s),0);
  readln(n,m);
  for i:=1 to m do
  begin
    read(a,b);
    inc(s[a,b]);
    inc(s[b,a]);
  end;
  a:=0;b:=0;
  for i:=2 to n do
  begin
    if s[1,i]>1 then
      inc(a);
    if s[1,i]>0 then
    begin
      b:=1;
      if not odd(s[1,i]) then
        va[1]:=true;
    end;
  end;
  if (a>1) or (b=0) then
    va[1]:=true;
  for i:=2 to n do
    if s[1,i]>0 then
    begin
      s[1,i]:=-s[1,i];
      s[i,1]:=-s[i,1];
      dfs(i);
      s[1,i]:=-s[1,i];
      s[i,1]:=-s[i,1];
    end;
  if not va[1] then
    for i:=1 to n do
      if (s[1,i]>1) and (va[i]) then
        va[1]:=true;
  for i:=2 to n do
    if s[1,i]>0 then
      if (a>1) or odd(s[1,i]) then
        va[i]:=true;
  j:=1;
  while not va[j] do
    inc(j);
  write(j);
  for i:=j+1 to n do
    if va[i] then
      write(' ',i);
  writeln;
end.
