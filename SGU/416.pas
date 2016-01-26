var
  n,i,l,r,m:longint;
  s:array[1..100] of integer;
  c:boolean;
begin
  readln(n);
  if odd(n div 2) then m:=0
    else m:=n div 2;
  s[1]:=1;s[n]:=2;
  i:=0;
  l:=3;r:=n;
  c:=true;
  while 2*i+2<n do
  begin
    inc(i);
    if 2*i=m then
    begin
      if c then
      begin
        s[2*i]:=r;
        s[2*i+1]:=l;
      end else
      begin
        s[2*i]:=l;
        s[2*i+1]:=r;
      end;
      inc(l,2);dec(r,2);
      continue;
    end;
    if c then
    begin
      s[2*i]:=r;
      s[2*i+1]:=r-2;
      dec(r,4);
    end else
    begin
      s[2*i]:=l;
      s[2*i+1]:=l+2;
      inc(l,4);
    end;
    c:=not c;
  end;
  for i:=1 to n do
  begin
    write(s[i]);
    if i<>n then write(' ')
      else writeln;
  end;
end.
