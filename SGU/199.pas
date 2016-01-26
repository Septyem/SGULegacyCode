var
  n,i,lq,l,r,m,ans,k:longint;
  s:array[0..100000,1..3] of longint;
  q,p:array[1..100000] of longint;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s[0]:=s[r];s[r]:=s[a];
  while i<j do
  begin
    while (i<j) and ((s[j,1]>s[0,1]) or ((s[j,1]=s[0,1]) and (s[j,2]<s[0,2]))) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and ((s[i,1]<s[0,1]) or  ((s[i,1]=s[0,1]) and (s[i,2]>s[0,2]))) do
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
  for i:=1 to n do
  begin
    read(s[i,1],s[i,2]);
    s[i,3]:=i;
  end;
  qsort(1,n);
  lq:=1;q[lq]:=1;p[lq]:=0;
  ans:=1;k:=1;
  for i:=2 to n do
    if (s[q[lq],2]<s[i,2]) and (s[q[lq],1]<s[i,1]) then
    begin
      inc(lq);
      q[lq]:=i;
      p[i]:=q[lq-1];
      if lq>ans then
      begin
        ans:=lq;
        k:=i;
      end;
    end else
    begin
      l:=1;r:=lq;
      while l<r do
      begin
        m:=(l+r) shr 1;
        if s[q[m],2]<s[i,2] then
          l:=m+1
        else r:=m;
      end;
      q[r]:=i;
      if r=1 then
        p[i]:=0
      else p[i]:=q[r-1];
    end;
  writeln(ans);
  i:=1;
  while k<>0 do
  begin
    write(s[k,3]);
    if i<>ans then write(' ');
    inc(i);
    k:=p[k];
  end;
end.
