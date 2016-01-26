var
  n,i,j,l1,l2,a1,a2:longint;
  now,p:double;
  s:array[-1..50] of double;
function comb(a,b:longint):double;
var
  i:longint;
  d:double;
begin
  d:=1;
  for i:=a downto a-b+1 do
    d:=d*i;
  for i:=b downto 2 do
    d:=d/i;
  comb:=d;
end;
begin
  fillchar(s,sizeof(s),0);
  readln(n,l1,l2,p);
  a1:=l1;
  a2:=n-l2;
  for i:=a1 to a2 do
    s[i]:=comb(i,l1)*comb(n-i,l2)/comb(n,l1+l2);
  for i:=0 to n do
    s[i]:=s[i-1]+s[i];
  p:=p/100;
  for i:=0 to n do
    for j:=0 to n-i do
    begin
      now:=(s[j+i]-s[j-1])/(s[a2]-s[a1-1]);
      if (now>=p) or (abs(now-p)<1e-15) then
      begin
        writeln(j,' ',j+i);
        halt;
      end;
    end;
end.
