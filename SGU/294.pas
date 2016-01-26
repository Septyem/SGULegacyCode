const
  max=10000;
type
  bignum=array[0..15100] of longint;
var
  n,i,i1,j,j1,k,c,c1,t:longint;
  s:array[1..400001] of longint;
  tmp:array[1..19] of bignum;
  ans:bignum;
  dou:array[1..20] of integer;
function gcd(a,b:longint):longint;
begin
  if a mod b=0 then
    gcd:=b
  else gcd:=gcd(b,a mod b);
end;
procedure h_mul(a,b:bignum;var ab:bignum);
var
  j,j1,k:longint;
begin
  fillchar(ab,sizeof(ab),0);
  k:=0;
  for j:=1 to a[0] do
  begin
    for j1:=1 to b[0] do
    begin
      k:=k+a[j]*b[j1]+ab[j+j1-1];
      ab[j+j1-1]:=k mod max;
      k:=k div max;
    end;
    if k<>0 then
    begin
      inc(ab[j+b[0]],k);
      k:=0;
    end;
  end;
  ab[0]:=a[0]+b[0];
  while (ab[0]>1) and (ab[ab[0]]=0) do
    dec(ab[0]);
end;
procedure dfs(m,m1:longint);
var
  j,k,x:longint;
begin
  if tmp[m,0]>ans[0] then
    ans[0]:=tmp[m,0];
  k:=0;x:=s[m1]-s[2*m1]-s[2*m1+1];
  for j:=1 to ans[0] do
  begin
    k:=k+ans[j]+tmp[m,j]*x;
    ans[j]:=k mod max;
    k:=k div max;
  end;
  while k<>0 do
  begin
    inc(ans[0]);
    ans[ans[0]]:=k mod max;
    k:=k div max;
  end;
  if x<>s[m1] then
  begin
    h_mul(tmp[m],tmp[m],tmp[m+1]);
    if s[2*m1]>0 then
      dfs(m+1,2*m1);
    if s[2*m1+1]>0 then
    begin
      k:=0;
      for j:=1 to tmp[m+1,0] do
      begin
        k:=k+tmp[m+1,j]*2;
        tmp[m+1,j]:=k mod max;
        k:=k div max;
      end;
      while k<>0 do
      begin
        inc(tmp[m+1,0]);
        tmp[m+1,tmp[m+1,0]]:=k mod max;
        k:=k div max;
      end;
      dfs(m+1,2*m1+1);
    end;
  end;
end;
begin
  fillchar(s,sizeof(s),0);
  readln(n);
  for i:=1 to n do
  begin
    c:=gcd(n,i);
    while c<>0 do
    begin
      inc(s[c]);
      c:=c div 2;
    end;
  end;
  fillchar(ans,sizeof(ans),0);
  tmp[1,0]:=1;tmp[1,1]:=2;
  dfs(1,1);
  k:=0;
  for i:=ans[0] downto 1 do
  begin
    k:=k+ans[i];
    ans[i]:=k div n;
    k:=k mod n*max;
  end;
  while ans[ans[0]]=0 do
    dec(ans[0]);
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    write(ans[i] div 1000,ans[i] div 100 mod 10,ans[i] div 10 mod 10,ans[i] mod 10);
  writeln;
end.
