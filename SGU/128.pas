var
  n,i,l,c,x,y,z,lsr,lsc,p1,p2,p3,nt:longint;
  s:array[0..10000,0..2] of integer;
  s1,s2:array[0..10000,0..1] of integer;
  s3:array[1..10000,1..4] of integer;
  link:array[1..10000,1..2] of integer;
  tree:array[1..40000] of record
    dat,l,r,lson,rson:longint;
  end;
procedure finish;
begin
  writeln(0);
  halt;
end;
procedure add(a,b:integer);
begin
  if link[a,1]=0 then
    link[a,1]:=b
  else link[a,2]:=b;
end;
procedure qsort(a,b,t:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s[0]:=s[r];s[r]:=s[a];
  while i<j do
  begin
    while (i<j) and ((s[j,t]>s[0,t]) or ((s[j,t]=s[0,t]) and (s[j,1-t]>s[0,1-t]))) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and ((s[i,t]<s[0,t]) or ((s[i,t]=s[0,t]) and (s[i,1-t]<s[0,1-t]))) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b,t);
  if i-1>a then qsort(a,i-1,t);
end;
procedure qsort1(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s1[0]:=s1[r];s1[r]:=s1[a];
  while i<j do
  begin
    while (i<j) and (s1[j,1]>s1[0,1]) do
      dec(j);
    if i<j then
    begin
      s1[i]:=s1[j];
      inc(i);
    end;
    while (i<j) and (s1[i,1]<s1[0,1]) do
      inc(i);
    if i<j then
    begin
      s1[j]:=s1[i];
      dec(j);
    end;
  end;
  s1[i]:=s1[0];
  if i+1<b then qsort1(i+1,b);
  if i-1>a then qsort1(a,i-1);
end;
procedure qsort2(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s2[0]:=s2[r];s2[r]:=s2[a];
  while i<j do
  begin
    while (i<j) and (s2[j,1]>s2[0,1]) do
      dec(j);
    if i<j then
    begin
      s2[i]:=s2[j];
      inc(i);
    end;
    while (i<j) and (s2[i,1]<s2[0,1]) do
      inc(i);
    if i<j then
    begin
      s2[j]:=s2[i];
      dec(j);
    end;
  end;
  s2[i]:=s2[0];
  if i+1<b then qsort2(i+1,b);
  if i-1>a then qsort2(a,i-1);
end;
procedure ins(p,d,t:longint);
var
  m:integer;
begin
  if tree[t].l=tree[t].r then
  begin
    inc(tree[t].dat,d);
    exit;
  end;
  m:=(tree[t].l+tree[t].r) div 2;
  if p<=m then
  begin
    if tree[t].lson=0 then
    begin
      inc(nt);
      tree[t].lson:=nt;
      tree[nt].l:=tree[t].l;
      tree[nt].r:=m;
    end;
    ins(p,d,tree[t].lson);
  end else
  begin
    if tree[t].rson=0 then
    begin
      inc(nt);
      tree[t].rson:=nt;
      tree[nt].l:=m+1;
      tree[nt].r:=tree[t].r;
    end;
    ins(p,d,tree[t].rson);
  end;
end;
function check(l,r,t:longint):boolean;
var
  m,tmp:integer;
begin
  if tree[t].l=tree[t].r then
  begin
    if tree[t].dat<>0 then
      check:=true
    else check:=false;
    exit;
  end;
  m:=(tree[t].l+tree[t].r) div 2;
  if (l<=m) and (tree[t].lson<>0) then
  begin
    tmp:=m;
    if r<tmp then
      tmp:=r;
    if check(l,tmp,tree[t].lson) then
    begin
      check:=true;
      exit;
    end;
  end;
  if (r>m) and (tree[t].rson<>0) then
  begin
    tmp:=m+1;
    if l>tmp then
      tmp:=l;
    if check(tmp,r,tree[t].rson) then
    begin
      check:=true;
      exit;
    end;
  end;
  check:=false;
end;
begin
  randomize;
  fillchar(link,sizeof(link),0);
  readln(n);
  for i:=1 to n do
  begin
    read(s[i,0],s[i,1]);
    s[i,2]:=i;
  end;
  l:=0;
  qsort(1,n,0);
  i:=1;lsr:=0;
  while i<=n do
  begin
    if (s[i,0]=s[i+1,0]) and (s[i,1]<>s[i+1,1]) then
    begin
      inc(l,s[i+1,1]-s[i,1]);
      add(s[i,2],s[i+1,2]);
      add(s[i+1,2],s[i,2]);
      inc(lsr);
      s1[lsr,0]:=s[i,0]+10000;s1[lsr,1]:=s[i,1]+10000;
      s2[lsr,0]:=s[i+1,0]+10000;s2[lsr,1]:=s[i+1,1]+10000;
    end else
      finish;
    inc(i,2);
  end;
  qsort(1,n,1);
  i:=1;lsc:=0;
  while i<=n do
  begin
    if (s[i,1]=s[i+1,1]) and (s[i,0]<>s[i+1,0]) then
    begin
      inc(l,s[i+1,0]-s[i,0]);
      add(s[i,2],s[i+1,2]);
      add(s[i+1,2],s[i,2]);
      inc(lsc);
      s3[lsc,1]:=s[i,0]+10000;s3[lsc,2]:=s[i,1]+10000;
      s3[lsc,3]:=s[i+1,0]+10000;s3[lsc,4]:=s[i+1,1]+10000;
    end else
      finish;
    inc(i,2);
  end;
  x:=1;y:=link[x,1];c:=1;
  repeat
    if link[y,1]=x then
      z:=link[y,2]
    else z:=link[y,1];
    x:=y;y:=z;
    inc(c);
  until y=1;
  if c<>n then
    finish;
  qsort1(1,lsr);
  qsort2(1,lsr);
  p1:=1;p2:=1;p3:=1;
  fillchar(tree,sizeof(tree),0);
  nt:=1;
  tree[nt].l:=0;
  tree[nt].r:=20000;
  for i:=-10000 to 10000 do
  begin
    while (p2<lsr) and (s2[p2,1]=i) do
    begin
      ins(s2[p2,0],-1,1);
      inc(p2);
    end;
    while (p3<lsc) and (s3[p3,2]=i) do
    begin
      if check(s3[p3,1],s3[p3,3],1) then
        finish;
      inc(p3);
    end;
    while (p1<lsr) and (s1[p1,1]=i) do
    begin
      ins(s1[p1,0],1,1);
      inc(p1);
    end;
  end;
  writeln(l);
end.
