var
  n,i,now:longint;
  s1,s2,p1,p2,a:array[0..6000] of longint;
  tmp:real;
begin
  readln(n);
  s1[0]:=0;s2[0]:=0;
  for i:=1 to n do
  begin
    read(tmp);
    if tmp<2 then
    begin
      inc(s2[0]);
      s2[s2[0]]:=round(tmp*1e6)-2000000;
      p2[s2[0]]:=i;
    end else
    begin
      inc(s1[0]);
      s1[s1[0]]:=round(tmp*1e6)-2000000;
      p1[s1[0]]:=i;
    end;
  end;
  now:=0;
  for i:=1 to n do
    if (s1[0]>0) and (now+s1[s1[0]]<100000) then
    begin
      inc(now,s1[s1[0]]);
      a[i]:=p1[s1[0]];
      dec(s1[0]);
    end else
    begin
      inc(now,s2[s2[0]]);
      a[i]:=p2[s2[0]];
      dec(s2[0]);
    end;
  writeln('yes');
  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end.
