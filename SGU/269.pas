const
  max=10000;
type
  bignum=array[0..400] of longint;
var
  n,k,i,j,x:longint;
  s,s1:array[0..250] of integer;
  d,d1:array[0..250] of bignum;
  tmp2:bignum;
procedure mul(a:bignum;b:longint;var c:bignum);
var
  i,x:longint;
begin
  fillchar(c,sizeof(c),0);
  c[0]:=a[0];x:=0;
  for i:=1 to c[0] do
  begin
    x:=a[i]*b+x;
    c[i]:=x mod max;
    x:=x div max;
  end;
  while x<>0 do
  begin
    inc(c[0]);
    c[c[0]]:=x mod max;
    x:=x div max;
  end;
end;
procedure plus(a,b:bignum;var c:bignum);
var
  i,x:longint;
begin
  fillchar(c,sizeof(c),0);
  if a[0]>b[0] then
    c[0]:=a[0]
  else c[0]:=b[0];
  x:=0;
  for i:=1 to c[0] do
  begin
    x:=x+a[i]+b[i];
    c[i]:=x mod max;
    x:=x div max;
  end;
  if x<>0 then
  begin
    inc(c[0]);
    c[c[0]]:=x;
  end;
end;
begin
  fillchar(s1,sizeof(s1),0);
  readln(n,k);
  for i:=1 to n do
  begin
    read(x);
    inc(s1[x]);
  end;
  s[0]:=0;
  for i:=1 to 250 do
    while s1[i]<>0 do
    begin
      inc(s[0]);
      s[s[0]]:=i;
      dec(s1[i]);
    end;
  fillchar(d,sizeof(d),0);
  d[0,0]:=1;d[0,1]:=1;
  for i:=1 to n do
  begin
    d1:=d;
    for j:=1 to k do
    begin
      mul(d1[j-1],s[i]-j+1,tmp2);
      plus(tmp2,d1[j],d[j]);
    end;
  end;
  if d[k,0]=0 then
  begin
    d[k,1]:=0;
    d[k,0]:=1;
  end;
  while (d[k,0]>1) and (d[k,d[k,0]]=0) do
    dec(d[k,0]);
  write(d[k,d[k,0]]);
  for i:=d[k,0]-1 downto 1 do
    write(d[k,i] div 1000,d[k,i] div 100 mod 10,d[k,i] div 10 mod 10,d[k,i] mod 10);
  writeln;
end.
