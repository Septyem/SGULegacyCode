var
  n,m,i,j,p:longint;
  s:array[0..1,0..10000] of int64;
begin
  readln(n,m);
  fillchar(s,sizeof(s),0);
  if n=1 then
  begin
    writeln(1 mod m);
    halt;
  end;
  p:=1;
  s[p,1]:=1;
  for i:=2 to n do
  begin
    p:=1-p;
    for j:=1 to i do
    begin
      s[p,j]:=s[p,j-1]+s[1-p,i-j];
      if s[p,j]>=m then
        s[p,j]:=s[p,j] mod m;
    end;
  end;
  writeln(s[p,n]*2 mod m)
end.
