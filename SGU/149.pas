var
  n,i,x,y:longint;
  r:array[0..20000,1..3] of longint;
  p,d:array[1..10000,1..2] of longint;
  up:array[1..10000] of longint;
  v:array[1..10000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,m:longint;
begin
  i:=a;j:=b;m:=random(b-a)+a;
  r[0]:=r[m];r[m]:=r[i];
  while i<j do
  begin
    while (i<j) and ((r[j,1]>r[0,1]) or ((r[j,1]=r[0,1]) and (r[j,2]>r[0,2]))) do
      dec(j);
    if i<j then
    begin
      r[i]:=r[j];
      inc(i);
    end;
    while (i<j) and ((r[i,1]<r[0,1]) or ((r[i,1]=r[0,1]) and (r[i,2]<r[0,2]))) do
      inc(i);
    if i<j then
    begin
      r[j]:=r[i];
      dec(j);
    end;
  end;
  r[i]:=r[0];
  if i-1>a then qsort(a,i-1);
  if i+1<b then qsort(i+1,b);
end;
procedure dfs1(t:longint);
var
  i:longint;
begin
  v[t]:=true;
  for i:=p[t,1] to p[t,2] do
    if not v[r[i,2]] then
    begin
      dfs1(r[i,2]);
      if d[r[i,2],1]+r[i,3]>d[t,1] then
      begin
        d[t,2]:=d[t,1];
        d[t,1]:=d[r[i,2],1]+r[i,3];
      end else
      if d[r[i,2],1]+r[i,3]>d[t,2] then
        d[t,2]:=d[r[i,2],1]+r[i,3];
    end;
end;
procedure dfs2(t:longint);
var
  i:longint;
begin
  v[t]:=false;
  for i:=p[t,1] to p[t,2] do
    if v[r[i,2]] then
    begin
      up[r[i,2]]:=up[t]+r[i,3];
      if d[t,1]=d[r[i,2],1]+r[i,3] then
      begin
        if d[t,2]+r[i,3]>up[r[i,2]] then
          up[r[i,2]]:=d[t,2]+r[i,3];
      end else
        if d[t,1]+r[i,3]>up[r[i,2]] then
          up[r[i,2]]:=d[t,1]+r[i,3];
      dfs2(r[i,2]);
    end;
end;
begin
  fillchar(d,sizeof(d),0);
  fillchar(up,sizeof(up),0);
  randomize;
  readln(n);
  if n=1 then
  begin
    writeln(0);
    halt;
  end;
  for i:=1 to n-1 do
  begin
    readln(x,y);
    r[2*i-1,1]:=i+1;
    r[2*i-1,2]:=x;
    r[2*i-1,3]:=y;
    r[2*i,1]:=x;
    r[2*i,2]:=i+1;
    r[2*i,3]:=y;
  end;
  qsort(1,2*(n-1));
  p[r[1,1],1]:=1;
  for i:=2 to 2*n-2 do
    if r[i,1]<>r[i-1,1] then
    begin
      p[r[i-1,1],2]:=i-1;
      p[r[i,1],1]:=i;
    end;
  p[r[2*n-2,1],2]:=2*n-2;
  fillchar(v,sizeof(v),false);
  dfs1(1);
  dfs2(1);
  for i:=1 to n do
  begin
    if up[i]<d[i,1] then
      up[i]:=d[i,1];
    writeln(up[i]);
  end;
end.
