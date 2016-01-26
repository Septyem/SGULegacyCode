var
  n,m,x,y,i,j,a,b,c,h,t:longint;
  map:array[1..2000,1..2000] of longint;
  s,p:array[1..2000,0..2000] of integer;
  dis,num,ans:array[1..2000] of longint;
  v:array[1..2000] of boolean;
  q:array[1..20000] of integer;
procedure dfs(t:integer);
var
  i,a:integer;
begin
  v[t]:=true;
  for i:=1 to n do
    if p[t,i]=1 then
    begin
      inc(p[t,0]);
      inc(s[i,0]);
      s[i,s[i,0]]:=t;
      if not v[i] then
          dfs(i);
    end;
  num[t]:=p[t,0];
end;
begin
  fillchar(map,sizeof(map),0);
  readln(n,x,y);
  readln(m);
  for i:=1 to m do
  begin
    read(a,b,c);
    map[a,b]:=c;
    map[b,a]:=c;
  end;
  fillchar(p,sizeof(p),0);
  fillchar(dis,sizeof(dis),$6f);
  fillchar(v,sizeof(v),false);
  dis[x]:=0;v[x]:=true;
  h:=0;t:=1;
  q[t]:=x;
  while h<t do
  begin
    inc(h);
    a:=q[h];
    for i:=1 to n do
      if map[a,i]>0 then
      begin
        if dis[i]>dis[a]+map[a,i] then
        begin
          fillchar(p[i],sizeof(p[i]),0);
          p[i,a]:=1;
          dis[i]:=dis[a]+map[a,i];
          if not v[i] then
          begin
            v[i]:=true;
            inc(t);
            q[t]:=i;
          end;
        end;
        if dis[i]=dis[a]+map[a,i] then
          p[i,a]:=1;
      end;
    v[a]:=false;
  end;
  fillchar(s,sizeof(s),0);
  fillchar(num,sizeof(num),$ff);
  fillchar(v,sizeof(v),false);
  fillchar(ans,sizeof(ans),0);
  dfs(y);
  if (p[y,0]=0) and (x<>y) then
    num[y]:=-1;
  a:=1;p[x,0]:=1;
  while num[y]>=0 do
  begin
    h:=0;
    for i:=1 to n do
      if num[i]=0 then
        if (h=0) or (dis[q[h]]>dis[i]) then
        begin
          h:=1;
          q[h]:=i;
        end else
        if (h<>0) and (dis[q[h]]=dis[i]) then
        begin
          inc(h);
          q[h]:=i;
        end;
    for i:=1 to h do
    begin
      dec(a,p[q[i],0]-1);
      for j:=1 to s[q[i],0] do
        dec(num[s[q[i],j]]);
      num[q[i]]:=-1;
    end;
    for i:=1 to h do
      ans[q[i]]:=a;
    for i:=1 to h do
      inc(a,s[q[i],0]-1);
  end;
  for i:=1 to n do
  begin
    write(ans[i]);
    if i<>n then write(' ')
      else writeln;
  end;
end.
