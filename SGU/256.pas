var
  n,m,i:longint;
  a,b:array[0..10] of integer;
  d:array[1..100,0..10,0..10,0..10,0..10] of longint;
function dfs(m,p1,p2,p3,p4:integer):longint;
var
  tmp,t1,i:longint;
begin
  if m<=0 then
  begin
    dfs:=0;
    exit;
  end;
  if d[m,p1,p2,p3,p4]<>-1 then
  begin
    dfs:=d[m,p1,p2,p3,p4];
    exit;
  end;
  tmp:=maxlongint;
  for i:=1 to n do
  begin
    if (i=p1) and (b[i]>3) then
      continue;
    if (i=p2) and (b[i]>2) then
      continue;
    if (i=p3) and (b[i]>1) then
      continue;
    if (i=p4) and (b[i]>0) then
      continue;
    t1:=dfs(m-a[i],p2,p3,p4,i)+1;
    if t1<tmp then
      tmp:=t1;
  end;
  if tmp=maxlongint then
    tmp:=dfs(m,p2,p3,p4,0)+1;
  d[m,p1,p2,p3,p4]:=tmp;
  dfs:=tmp;
end;
begin
  readln(m,n);
  for i:=1 to n do
    read(a[i],b[i]);
  a[0]:=0;b[0]:=0;
  fillchar(d,sizeof(d),$ff);
  writeln(dfs(m,0,0,0,0));
end.
