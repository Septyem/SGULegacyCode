var
  n,i,p1,p2:longint;
  ans,x,y:int64;
  s,q:array[0..500000] of int64;
begin
  readln(n);
  ans:=0;
  for i:=1 to n do
    read(s[i]);
  p1:=1;p2:=1;
  q[0]:=0;
  for i:=1 to n-1 do
  begin
    if (p1>n) or ((p2<=q[0]) and (q[p2]<s[p1])) then
    begin
      x:=q[p2];
      inc(p2);
    end else
    begin
      x:=s[p1];
      inc(p1);
    end;
    if (p1>n) or ((p2<=q[0]) and (q[p2]<s[p1])) then
    begin
      y:=q[p2];
      inc(p2);
    end else
    begin
      y:=s[p1];
      inc(p1);
    end;
    inc(q[0]);
    q[q[0]]:=x+y;
    inc(ans,x+y);
  end;
  writeln(ans);
end.

