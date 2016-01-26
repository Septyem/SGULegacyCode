var
  n,i,ans,now,l,r,m,ls:longint;
  w,li,p,tw:array[0..15000] of longint;
  s:array[0..15000,1..2] of integer;
  bln,bla:array[1..15000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,t:longint;
begin
  i:=a;j:=b;m:=random(b-a)+a;
  s[0]:=s[m];s[m]:=s[a];
  while i<j do
  begin
    while (i<j) and (s[j,1]>s[0,1]) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and (s[i,1]<s[0,1]) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
begin
  randomize;
  readln(n);
  tw[0]:=0;
  for i:=1 to n do
  begin
    readln(w[i],li[i],p[i]);
    tw[i]:=tw[i-1]+w[i];
  end;
  for i:=1 to n do
  begin
    s[i,2]:=i;
    if tw[i]>li[i] then
    begin
      l:=1;r:=i;
      while l<r do
      begin
        m:=(l+r+1) shr 1;
        if tw[i]-tw[m-1]<=li[i] then
          r:=m-1
        else l:=m;
      end;
      s[i,1]:=l;
    end else
      s[i,1]:=0;
  end;
  qsort(1,n);
  fillchar(bln,sizeof(bln),false);
  ans:=maxlongint;
  ls:=n;now:=0;
  for i:=n downto 1 do
  begin
    inc(now,p[i]);
    bln[i]:=true;
    while (ls<>0) and (s[ls,1]=i) do
    begin
      bln[s[ls,2]]:=false;
      dec(now,p[s[ls,2]]);
      dec(ls);
    end;
    if now<ans then
    begin
      ans:=now;
      bla:=bln;
    end;
  end;
  for i:=1 to n do
    if bla[i] then
      writeln(i);
end.

