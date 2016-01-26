const
  max=10000;
var
  n,m,c,i,j,k:longint;
  s,s1:array[0..1,0..3000] of longint;
begin
  readln(n,m);
  c:=0;
  s[c,0]:=1;s[c,1]:=1;
  s1[c,0]:=1;s1[c,1]:=0;
  k:=0;
  for i:=1 to m do
  begin
    c:=1-c;
    fillchar(s[c],sizeof(s[c]),0);
    fillchar(s1[c],sizeof(s1[c]),0);
    s1[c,0]:=s1[1-c,0];
    for j:=1 to s1[c,0] do
    begin
      k:=s1[1-c,j]*2+k;
      s1[c,j]:=k mod max;
      k:=k div max;
    end;
    if k>0 then
    begin
      inc(s1[c,0]);
      s1[c,s1[c,0]]:=k;
      k:=0;
    end;
    if s[1-c,0]>s1[c,0] then
      s1[c,0]:=s[1-c,0];
    for j:=1 to s1[c,0] do
    begin
      k:=k+s1[c,j]+s[1-c,j];
      s1[c,j]:=k mod max;
      k:=k div max;
    end;
    if k>0 then
    begin
      inc(s1[c,0]);
      s1[c,s1[c,0]]:=k;
      k:=0;
    end;
    s[c,0]:=s1[1-c,0];
    for j:=1 to s[c,0] do
    begin
      k:=k+s1[1-c,j]*n;
      s[c,j]:=k mod max;
      k:=k div max;
    end;
    while k<>0 do
    begin
      inc(s[c,0]);
      s[c,s[c,0]]:=k mod max;
      k:=k div max;
    end;
  end;
  write(s[c,s[c,0]]);
  for i:=s[c,0]-1 downto 1 do
    write(s[c,i] div 1000,s[c,i] div 100 mod 10,s[c,i] div 10 mod 10,s[c,i] mod 10);
  writeln;
end.
