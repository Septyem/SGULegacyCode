var
  n,m,i,tot:longint;
  s:array[1..5000,1..4] of integer;
  bl:array[1..5000] of boolean;
  ch:char;
procedure work(x1,y1,x2,y2,c:integer);
begin
  inc(c);
  while (c<=m) and ((x1>=s[c,3]) or (x2<=s[c,1]) or (y1>=s[c,4]) or (y2<=s[c,2])) do
    inc(c);
  if c>m then
  begin
    inc(tot,(y2-y1)*(x2-x1));
    exit;
  end;
  if x1<s[c,1] then
  begin
    work(x1,y1,s[c,1],y2,c);
    x1:=s[c,1];
  end;
  if x2>s[c,3] then
  begin
    work(s[c,3],y1,x2,y2,c);
    x2:=s[c,3];
  end;
  if y1<s[c,2] then
    work(x1,y1,x2,s[c,2],c);
  if y2>s[c,4] then
    work(x1,s[c,4],x2,y2,c);
end;
begin
  readln(n,m);
  for i:=1 to m do
  begin
    read(s[i,1],s[i,2],s[i,3],s[i,4]);
    if s[i,1]>s[i,3] then
    begin
      tot:=s[i,1];
      s[i,1]:=s[i,3];
      s[i,3]:=tot;
    end;
    if s[i,2]>s[i,4] then
    begin
      tot:=s[i,2];
      s[i,2]:=s[i,4];
      s[i,4]:=tot;
    end;
    dec(s[i,1]);dec(s[i,2]);
    read(ch);
    read(ch);
    if ch='b' then
      bl[i]:=true
    else bl[i]:=false;
  end;
  tot:=0;
  for i:=1 to m do
    if bl[i] then
      work(s[i,1],s[i,2],s[i,3],s[i,4],i);
  writeln(sqr(n)-tot);
end.
