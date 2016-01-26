var
  n,q,p,i,j,d,m,tot,t1:longint;
  s:array[1..2000000] of longint;
begin
  readln(n,q);
  for i:=1 to n do
    s[i]:=i;
  p:=1;d:=1;
  tot:=n;m:=n div 10+1;
  for i:=1 to n-1 do
  begin
    for j:=2 to q do
    begin
      inc(p,d);
      if p>tot then
        dec(p,tot);
      if p<=0 then
        inc(p,tot);
      while s[p]<0 do
      begin
        inc(p,d);
        if p>tot then
          dec(p,tot);
        if p<=0 then
          inc(p,tot);
      end;
    end;
    s[p]:=-s[p];
    p:=p mod tot+1;
    while s[p]<0 do
      p:=p mod tot+1;
    if odd(s[p]) then d:=1
      else d:=-1;
    if i mod m=0 then
    begin
      t1:=0;
      for j:=1 to tot do
        if s[j]>0 then
        begin
          inc(t1);
          s[t1]:=s[j];
          if j=p then
            p:=t1;
        end;
      tot:=t1;
    end;
  end;
  writeln(s[p]);
end.
