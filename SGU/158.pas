var
  l,m,n,i,j,a,ans1,ans2,now:longint;
  d,s,p:array[1..300] of integer;
procedure print(x:longint);
begin
  write(x shr 1);
  if odd(x) then
    write('.5');
end;
begin
  read(l);
  read(m);
  for i:=1 to m do
  begin
    read(s[i]);
    s[i]:=s[i] shl 1;
  end;
  read(n);
  d[1]:=0;
  for i:=2 to n do
  begin
    read(d[i]);
    d[i]:=d[i] shl 1;
  end;
  ans1:=0;ans2:=0;
  for i:=1 to m do
  begin
    a:=1;
    while (a<>n) and (abs(s[i]-d[a])>abs(s[i]-d[a+1])) do
      inc(a);
    p[i]:=a;
    inc(ans2,abs(s[i]-d[a]));
  end;
  for i:=1 to l*2-d[n] do
  begin
    now:=0;
    for j:=1 to m do
    begin
      if (p[j]<>1) and (abs(s[j]-i-d[p[j]])>abs(s[j]-i-d[p[j]-1])) then
        dec(p[j]);
      inc(now,abs(s[j]-i-d[p[j]]));
    end;
    if now>ans2 then
    begin
      ans2:=now;
      ans1:=i;
    end;
  end;
  print(ans1);
  write(' ');
  print(ans2);
  writeln;
end.
