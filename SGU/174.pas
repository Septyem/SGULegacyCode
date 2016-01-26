var
  n,i,j,lh,a,b,c,d,x,y,x1,y1:longint;
  s:array[1..200000,1..4] of longint;
  s1,h:array[0..400000,1..2] of longint;
  p:array[1..400000] of longint;
function com(a,b,c,d:longint):longint;
begin
  if a>c then
    com:=1
  else
  if a<c then
    com:=-1
  else
  if b>d then
    com:=1
  else
  if b<d then
    com:=-1
  else com:=0;
end;
procedure qsort(l,r:longint);
var
  i,j,t:longint;
begin
  i:=l;j:=r;t:=random(r-l)+l;
  s1[0]:=s1[t];s1[t]:=s1[l];
  while i<j do
  begin
    while (i<j) and (com(s1[j,1],s1[j,2],s1[0,1],s1[0,2])=1) do
      dec(j);
    if i<j then
    begin
      s1[i]:=s1[j];
      inc(i);
    end;
    while (i<j) and (com(s1[i,1],s1[i,2],s1[0,1],s1[0,2])=-1) do
      inc(i);
    if i<j then
    begin
      s1[j]:=s1[i];
      dec(j);
    end;
  end;
  s1[i]:=s1[0];
  if i+1<r then qsort(i+1,r);
  if i-1>l then qsort(l,i-1);
end;
procedure back(t:longint);
begin
  if p[t]=t then
  begin
    y1:=t;
    exit;
  end;
  back(p[t]);
  p[t]:=y1;
end;
begin
  randomize;
  readln(n);
  for i:=1 to n do
  begin
    for j:=1 to 4 do
      read(s[i,j]);
    s1[i*2-1,1]:=s[i,1];
    s1[i*2-1,2]:=s[i,2];
    s1[i*2,1]:=s[i,3];
    s1[i*2,2]:=s[i,4];
  end;
  qsort(1,2*n);
  j:=1;lh:=0;
  while j<=2*n do
  begin
    while (j<=2*n) and (s1[j,1]=s1[j+1,1]) and (s1[j,2]=s1[j+1,2]) do
      inc(j);
    if j<=2*n then
    begin
      inc(lh);
      h[lh]:=s1[j];
      p[lh]:=lh;
    end;
    inc(j);
  end;
  for i:=1 to n do
  begin
    a:=1;b:=lh;
    while a<=b do
    begin
      c:=(a+b) shr 1;
      d:=com(h[c,1],h[c,2],s[i,1],s[i,2]);
      if d=0 then
      begin
        x:=c;
        break;
      end;
      if d>0 then
        b:=c
      else a:=c+1;
    end;
    a:=1;b:=lh;
    while a<=b do
    begin
      c:=(a+b) shr 1;
      d:=com(h[c,1],h[c,2],s[i,3],s[i,4]);
      if d=0 then
      begin
        y:=c;
        break;
      end;
      if d>0 then
        b:=c
      else a:=c+1;
    end;
    back(x);
    x1:=y1;
    back(y);
    if x1=y1 then
    begin
      writeln(i);
      halt;
    end;
    p[y1]:=x1;
  end;
  writeln(0);
end.

