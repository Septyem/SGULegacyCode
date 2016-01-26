var
  n,i,j,b,a1:longint;
  d,p,s:array[0..100000] of longint;
  a:array[1..3] of longint;
begin
  readln(n);
  for i:=1 to n do
    read(s[i]);
  fillchar(a,sizeof(a),0);
  d[0]:=0;b:=n;
  for i:=n downto 1 do
  begin
    j:=1;
    while (a[j]<>0) and (abs(s[a[j]]-s[i])=1) do
      inc(j);
    d[i]:=d[a[j]]+1;
    p[i]:=a[j];
    j:=1;
    while (j<=3) and (a[j]<>0) and (d[a[j]]>d[i]) do
      inc(j);
    if j<=3 then
    begin
      a1:=j;
      while (a1<=2) and (a[a1]<>0) and (s[a[a1]]<>s[i]) do
        inc(a1);
      while a1<>j do
      begin
        a[a1]:=a[a1-1];
        dec(a1);
      end;
      a[j]:=i;
    end;
    if d[i]>d[b] then
      b:=i;
  end;
  writeln(n-d[b]);
  while b<>0 do
  begin
    write(s[b]);
    if p[b]<>0 then
      write(' ');
    b:=p[b];
  end;
  writeln;
end.
