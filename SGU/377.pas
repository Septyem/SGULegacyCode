const
  max=10000;
type
  bignum=array[0..100] of longint;
var
  n,m,k,i,j:longint;
  s,ans:bignum;
begin
  readln(n,m);
  if n<m then
  begin
    k:=n;n:=m;m:=k;
  end;
  s[0]:=1;s[1]:=1;
  k:=0;
  for i:=1 to m do
  begin
    for j:=1 to s[0] do
    begin
      k:=s[j]*2+k;
      s[j]:=k mod max;
      k:=k div max;
    end;
    if k<>0 then
    begin
      inc(s[0]);
      s[s[0]]:=k;
      k:=0;
    end;
  end;
  ans:=s;
  for i:=m+1 to n do
  begin
    for j:=1 to s[0] do
    begin
      k:=s[j]*2+k;
      s[j]:=k mod max;
      k:=k div max;
    end;
    if k<>0 then
    begin
      inc(s[0]);
      s[s[0]]:=k;
      k:=0;
    end;
  end;
  ans[0]:=s[0];
  for i:=1 to ans[0] do
  begin
    k:=ans[i]+s[i]+k;
    ans[i]:=k mod max;
    k:=k div max;
  end;
  if k<>0 then
  begin
    inc(ans[0]);
    ans[ans[0]]:=k;
  end;
  j:=1;
  dec(ans[j],2);
  while ans[j]<0 do
  begin
    dec(ans[j+1]);
    inc(ans[j],10000);
    inc(j);
  end;
  while ans[ans[0]]=0 do
    dec(ans[0]);
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    write(ans[i] div 1000,ans[i] div 100 mod 10,ans[i] div 10 mod 10,ans[i] mod 10);
  writeln;
end.
