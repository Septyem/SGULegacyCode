var
  n,i,j,p:longint;
  s:array[1..100000] of longint;
  d:array[-1..1,0..2] of longint;
  f:boolean;
begin
  readln(n);
  for i:=1 to n do
    read(s[i]);
  d[1,0]:=1;d[-1,0]:=n;
  d[1,1]:=s[1];d[1,2]:=s[1];
  d[-1,1]:=s[n];d[-1,2]:=s[n];
  p:=1;f:=true;
  while d[1,0]<d[-1,0] do
  begin
    j:=d[p,0]+p;
    while (s[j]<=d[-p,2]) and (s[j]>=d[-p,1]) do
    begin
      if s[j]<d[p,1] then
        d[p,1]:=s[j];
      if s[j]>d[p,2] then
        d[p,2]:=s[j];
      inc(j,p);
      inc(d[p,0],p);
      if d[1,0]>=d[-1,0] then
        break;
    end;
    d[p,0]:=j-p;
    if d[1,0]>=d[-1,0] then
      break;
    if s[j]<d[p,1] then
      d[p,1]:=s[j];
    if s[j]>d[p,2] then
      d[p,2]:=s[j];
    if ((s[d[-p,0]-p]<d[p,1]) or (s[d[-p,0]-p]>d[p,2])) and (not f) then
    begin
      writeln('NO');
      halt;
    end else
    begin
      p:=-p;
      f:=false;
    end;
  end;
  writeln('YES');
end.
