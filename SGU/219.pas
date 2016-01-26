var
  n,m,i,j,a,b,c,ph,pt,no:longint;
  d,d1,s,s1:array[1..1000,0..1000] of longint;
  v,q:array[1..1000] of longint;
  ans:array[1..1000] of boolean;
procedure dfs(t:integer);
var
  i:integer;
begin
  v[t]:=1;
  for i:=1 to s[t,0] do
    if (v[s[t,i]]=0) and ans[s[t,i]] then
      dfs(s[t,i]);
end;
procedure rdfs(t:integer);
var
  i:integer;
begin
  inc(no);
  v[t]:=0;
  for i:=1 to s1[t,0] do
    if (v[s1[t,i]]=1) then
      rdfs(s1[t,i]);
  if no>1 then
  begin
    ans[t]:=false;
    inc(pt);
    q[pt]:=t;
  end;
end;
begin
  fillchar(d,sizeof(d),$ff);
  fillchar(d1,sizeof(d1),0);
  fillchar(s,sizeof(s),0);
  fillchar(s1,sizeof(s1),0);
  fillchar(ans,sizeof(ans),true);
  readln(n,m);
  ph:=0;pt:=0;
  for i:=1 to m do
  begin
    read(a,b,c);
    if (d[a,b]=-1) or (d[a,b]>c) then
    begin
      d[a,b]:=c;
      if c=0 then
      begin
        inc(s[a,0]);
        s[a,s[a,0]]:=b;
        inc(s1[b,0]);
        s1[b,s1[b,0]]:=a;
      end;
    end;
    inc(d1[a,b]);
    if (a=b) and (c=0) then
    begin
      ans[a]:=false;
      inc(pt);
      q[pt]:=a;
    end;
  end;
  for i:=1 to n do
    if ans[i] then
    begin
      fillchar(v,sizeof(v),0);
      dfs(i);
      no:=0;
      rdfs(i);
    end;
  while ph<pt do
  begin
    inc(ph);
    for i:=1 to n do
      if ans[i] and (d1[q[ph],i]>0) then
      begin
        ans[i]:=false;
        inc(pt);
        q[pt]:=i;
      end;
  end;
  for i:=1 to n do
    if ans[i] then
      writeln(1)
    else writeln(0);
end.
