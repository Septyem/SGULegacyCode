const
  max=10000;
type
  bignum=array[0..60] of longint;
var
  n,k,s1,l,ls,i,j,j1,j2,x,tmp:longint;
  t:array[1..1000] of boolean;
  map,oldmap,s:array[1..1000,1..50] of longint;
  d:array[0..60,1..1000] of bignum;
  v:array[1..1000] of boolean;
  c:char;
procedure changemap(a,b:integer);
begin
  if v[a] then
  begin
    map[a,b]:=-1;
    exit;
  end;
  v[a]:=true;
  if s[a,b]<>0 then
  begin
    if map[oldmap[a,b],b]=0 then
      changemap(oldmap[a,b],b);
    map[a,b]:=map[oldmap[a,b],b];
  end else
    map[a,b]:=oldmap[a,b];
end;
begin
  ls:=0;
  while not seekeoln do
  begin
    inc(ls);
    read(c);
  end;
  fillchar(t,sizeof(t),false);
  read(k,s1,l);
  for i:=1 to l do
  begin
    read(x);
    t[x]:=true;
  end;
  for i:=1 to k do
    for j:=1 to ls do
      read(oldmap[i,j]);
  for i:=1 to k do
    for j:=1 to ls do
      read(s[i,j]);
  read(n);
  fillchar(map,sizeof(map),0);
  for i:=1 to ls do
  begin
    fillchar(v,sizeof(v),false);
    for j:=1 to k do
      if not v[j] then
        changemap(j,i);
  end;
  fillchar(d,sizeof(d),0);
  for j:=1 to k do
    if t[j] then
    begin
      d[0,j,0]:=1;d[0,j,1]:=1;
    end;
  x:=0;
  for i:=1 to n do
    for j:=1 to k do
      for j1:=1 to ls do
        if map[j,j1]>0 then
        begin
          tmp:=map[j,j1];
          if d[i,j,0]<d[i-1,tmp,0] then
            d[i,j,0]:=d[i-1,tmp,0];
          for j2:=1 to d[i,j,0] do
          begin
            x:=d[i,j,j2]+d[i-1,tmp,j2]+x;
            d[i,j,j2]:=x mod max;
            x:=x div max;
          end;
          if x<>0 then
          begin
            inc(d[i,j,0]);
            d[i,j,d[i,j,0]]:=x;
            x:=0;
          end;
        end;
  write(d[n,s1,d[n,s1,0]]);
  for i:=d[n,s1,0]-1 downto 1 do
    write(d[n,s1,i] div 1000,d[n,s1,i] div 100 mod 10,d[n,s1,i] div 10 mod 10,d[n,s1,i] mod 10);
  writeln;
end.
