var
  n,m,k,i,j,j1,ans:longint;
  s:array[1..6,1..10,1..10] of char;
  bl,a1:array[1..10,1..10] of boolean;
  d:array[1..6,1..6] of integer;
  find:boolean;
procedure dfs(x,y,c:integer);
var
  i,j:integer;
begin
  if c=ans then
  begin
    for i:=1 to k do
      for j:=i+1 to k do
        if d[i,j]=0 then
          exit;
    writeln(ans);
    for i:=1 to n do
    begin
      for j:=1 to m do
        if a1[i,j] then
          write(1)
        else write(0);
      writeln;
    end;
    halt;
  end;
  if x>n then
    exit;
  if bl[x,y] then
  begin
    a1[x,y]:=true;
    for i:=1 to k do
      for j:=i+1 to k do
        if s[i,x,y]<>s[j,x,y] then
          inc(d[i,j]);
    if y<>m then
      dfs(x,y+1,c+1)
    else dfs(x+1,1,c+1);
    a1[x,y]:=false;
    for i:=1 to k do
      for j:=i+1 to k do
        if s[i,x,y]<>s[j,x,y] then
          dec(d[i,j]);
  end;
  if y<>m then
    dfs(x,y+1,c)
  else dfs(x+1,1,c);
end;
begin
  readln(n,m,k);
  for i:=1 to k do
  begin
    for j:=1 to n do
    begin
      for j1:=1 to m do
        read(s[i,j,j1]);
      readln;
    end;
    if i<>k then readln;
  end;
  for j:=1 to n do
    for j1:=1 to m do
    begin
      bl[j,j1]:=false;
      for i:=2 to k do
        if s[1,j,j1]<>s[i,j,j1] then
        begin
          bl[j,j1]:=true;
          break;
        end;
    end;
  ans:=0;find:=false;
  fillchar(a1,sizeof(a1),false);
  fillchar(d,sizeof(d),0);
  while not find do
  begin
    inc(ans);
    dfs(1,1,0);
  end;
end.
