var
  n,i,k:longint;
  a,a1:array[0..10000] of longint;
  d:array[0..10000,1..2] of longint;
  s:ansistring;
begin
  readln(s);
  readln(n);
  close(input);
  if n=1 then
  begin
    writeln(s);
    halt;
  end;
  a1[0]:=length(s);
  for i:=1 to a1[0] do
    a1[i]:=ord(s[a1[0]-i+1])-48;
  a[0]:=0;
  while not ((a1[0]=1) and (a1[a1[0]]=0)) do
  begin
    k:=0;
    for i:=a1[0] downto 1 do
    begin
      k:=k*10+a1[i];
      a1[i]:=k div n;
      k:=k mod n;
    end;
    inc(a[0]);
    a[a[0]]:=k;
    while (a1[0]>1) and (a1[a1[0]]=0) do
      dec(a1[0]);
  end;
  d[0,1]:=0;d[0,2]:=2;
  for i:=1 to a[0] do
  begin
    if d[i-1,1]<d[i-1,2] then
      d[i,1]:=d[i-1,1]+a[i]
    else d[i,1]:=d[i-1,2]+a[i];
    if d[i-1,1]+1+n-a[i]<d[i-1,2]+n-a[i]-1 then
      d[i,2]:=d[i-1,1]+1+n-a[i]
    else d[i,2]:=d[i-1,2]+n-a[i]-1;
  end;
  if d[a[0],1]<d[a[0],2] then
    writeln(d[a[0],1])
  else writeln(d[a[0],2]);
end.
