const
  max=100003;
var
  n,m,i,j:longint;
  s,link:array[0..100002] of longint;
  v:array[0..100002] of boolean;
  a,b:array[1..300] of longint;
  used,get:array[1..300] of boolean;
  bl:boolean;
function find(t:longint):boolean;
var
  i,p:longint;
begin
  i:=b[t];
  if (a[t]>0) and (i<=0) then
  begin
    p:=(-i) div a[t]+1;
    inc(i,a[t]*p);
  end;
  if (a[t]<0) and (i>m) then
  begin
    p:=(i-m) div (-a[t]);
    inc(i,a[t]*p);
    if i>m then
      inc(i,a[t]);
  end;
  while (i<=m) and (i>0) do
  begin
    p:=i mod max;
    while (s[p]<>0) and (s[p]<>i) do
    begin
      inc(p);
      if p>max then
        p:=0;
    end;
    s[p]:=i;
    if not v[p] then
    begin
      v[p]:=true;
      if ((link[p]=0) or find(link[p])) then
      begin
        link[p]:=t;
        find:=true;
        exit;
      end;
    end;
    inc(i,a[t]);
    if a[t]=0 then
      break;
  end;
  find:=false;
end;
begin
  read(n,m);
  for i:=1 to n do
    read(a[i],b[i]);
  fillchar(s,sizeof(s),0);
  fillchar(link,sizeof(link),0);
  for i:=1 to n do
  begin
    fillchar(v,sizeof(v),false);
    bl:=find(i);
  end;
  fillchar(get,sizeof(get),false);
  fillchar(used,sizeof(used),false);
  for i:=0 to max-1 do
    if link[i]<>0 then
    begin
      a[link[i]]:=s[i];
      get[link[i]]:=true;
      if s[i]<=n then
        used[i]:=true;
    end;
  j:=1;
  for i:=1 to n do
    if not get[i] then
    begin
      while used[j] do inc(j);
      a[i]:=j;
      used[j]:=true;
    end;
  for i:=1 to n do
  begin
    write(a[i]);
    if i<>n then write(' ')
      else writeln;
  end;
end.
