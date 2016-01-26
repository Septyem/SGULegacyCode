var
  n,i,p1,p2:longint;
  ans:int64;
  a,a1,a2:array[0..66000] of longint;
procedure sort(l,r:longint);
var
  m,i:longint;
begin
  if l=r then
    exit;
  m:=(l+r) shr 1;
  sort(l,m);sort(m+1,r);
  a1[0]:=0;a2[0]:=0;
  for i:=l to m do
  begin
    inc(a1[0]);
    a1[a1[0]]:=a[i];
  end;
  for i:=m+1 to r do
  begin
    inc(a2[0]);
    a2[a2[0]]:=a[i];
  end;
  p1:=1;p2:=1;
  for i:=l to r do
  begin
    if (p2>a2[0]) or ((p1<=a1[0]) and (a1[p1]>a2[p2])) then
    begin
      a[i]:=a1[p1];
      inc(p1);
    end else
    begin
      a[i]:=a2[p2];
      inc(p2);
      inc(ans,p1-1);
    end;
  end;
end;
begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  ans:=0;
  sort(1,n);
  writeln(ans);
end.