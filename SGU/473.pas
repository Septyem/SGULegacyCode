const
  ss:array[1..17] of integer=(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59);
  max=10000;
type
  bignum=array[0..15000] of longint;
var
  n,la,i:longint;
  a,a1:array[1..17] of longint;
  b,b1,c,c1:bignum;
  mine:real;
procedure search(n,i,l:longint;e:real);
var
  j:longint;
begin
  if n=1 then
  begin
    if e<mine then
    begin
      a:=a1;
      mine:=e;
      la:=i-1;
    end;
    exit;
  end;
  for j:=1 to l do
    if n mod (j+1)=0 then
    begin
      a1[i]:=j;
      search(n div (j+1),i+1,j,e+j*ln(ss[i]));
    end;
end;
procedure mul(var d1,d2,d3:bignum);
var
  i,j,k:longint;
begin
  fillchar(d3,sizeof(d3),0);
  for i:=1 to d1[0] do
    for j:=1 to d2[0] do
    begin
      k:=i+j-1;
      inc(d3[k],d1[i]*d2[j]);
      inc(d3[k+1],d3[k] div max);
      d3[k]:=d3[k] mod max;
    end;
  d3[0]:=d1[0]+d2[0]-1;
  if d3[d3[0]+1]>0 then
    inc(d3[0]);
end;
procedure pow(var x,y:bignum;c2:longint);
var
  j,k:longint;
begin
  if c2=1 then
  begin
    fillchar(x,sizeof(x),0);
    x[0]:=1;
    x[1]:=ss[i];
    exit;
  end;
  pow(y,x,c2 shr 1);
  mul(y,y,x);
  if odd(c2) then
  begin
    k:=0;
    for j:=1 to x[0] do
    begin
      k:=k+x[j]*ss[i];
      x[j]:=k mod max;
      k:=k div max;
    end;
    if k<>0 then
    begin
      inc(x[0]);
      x[x[0]]:=k mod max;
      k:=0;
    end;
  end;
end;
begin
  readln(n);
  mine:=1e10;
  search(n,1,n-1,0);
  fillchar(b,sizeof(b),0);
  b[0]:=1;b[1]:=1;
  for i:=1 to la do
  begin
    pow(c,c1,a[i]);
    mul(b,c,b1);
    b:=b1;
  end;
  write(b[b[0]]);
  for i:=b[0]-1 downto 1 do
    write(b[i] div 1000,b[i] div 100 mod 10,b[i] div 10 mod 10,b[i] mod 10);
  writeln;
end.
