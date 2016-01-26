const
  max=10000000;
var
  n,m,i,j,x,y,h,t,d1:longint;
  r:array[1..400,1..400] of longint;
  q:array[1..40000] of integer;
  p,a:array[0..400] of integer;
  v:array[1..400] of boolean;
  dis:array[1..400] of longint;
procedure spfa;
var
  i:integer;
begin
  for i:=2 to n do
    dis[i]:=max;
  fillchar(v,sizeof(v),false);
  v[1]:=true;dis[1]:=0;
  h:=0;t:=1;q[t]:=1;
  while h<t do
  begin
    inc(h);
    x:=q[h];
    for i:=1 to n do
      if (r[x,i]<>0) and (dis[x]+r[x,i]<dis[i]) then
      begin
        dis[i]:=dis[x]+r[x,i];
        p[i]:=x;
        if not v[i] then
        begin
          v[i]:=true;
          inc(t);
          q[t]:=i;
        end;
      end;
    v[x]:=false;
  end;
end;
procedure dfs(t:integer);
var
  i:integer;
begin
  v[t]:=true;
  inc(a[0]);
  a[a[0]]:=t;
  if t=n then
    exit;
  for i:=1 to n do
    if not v[i] and (r[t,i]=max) then
      dfs(i);
  if a[a[0]]<>n then
    dec(a[0]);
end;
begin
  fillchar(r,sizeof(r),0);
  readln(n,m);
  for i:=1 to m do
  begin
    read(x,y);
    read(r[x,y]);
    r[y,x]:=r[x,y];
  end;
  for i:=1 to n do
    r[i,i]:=0;
  spfa;
  x:=n;
  while x<>1 do
  begin
    y:=p[x];
    r[x,y]:=-r[x,y];
    r[y,x]:=max;
    x:=y;
  end;
  d1:=dis[n];
  spfa;
  if (dis[n]<>d1) or (dis[n]=max) then
  begin
    writeln('No solution');
    halt;
  end;
  x:=n;
  while x<>1 do
  begin
    y:=p[x];
    if r[y,x]<0 then
    begin
      r[y,x]:=-r[y,x];
      r[x,y]:=r[y,x];
    end else
      r[y,x]:=max;
    x:=y;
  end;
  fillchar(v,sizeof(v),false);
  a[0]:=0;dfs(1);
  for i:=1 to a[0]-1 do
  begin
    r[a[i],a[i+1]]:=0;
    write(a[i],' ');
  end;
  writeln(n);
  fillchar(v,sizeof(v),false);
  a[0]:=0;dfs(1);
  for i:=1 to a[0]-1 do
    write(a[i],' ');
  writeln(n);
end.
