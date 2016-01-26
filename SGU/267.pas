const
  zero=1e-7;
var
  n,k,i,j,l,r,t,ls1,num:longint;
  mx,my,x1,y1,x2,y2,a,a1:double;
  p:array[1..6,1..2] of longint;
  s,s1:array[0..1000] of double;
  c:array[0..1000] of boolean;
begin
  readln(n,k);
  for i:=1 to n do
  begin
    for j:=1 to 6 do
      read(p[j,1],p[j,2]);
    mx:=0;my:=0;
    for j:=1 to 4 do
    begin
      mx:=mx+p[j,1];
      my:=my+p[j,2];
    end;
    mx:=mx/4;my:=my/4;
    x1:=mx-p[5,1];y1:=my-p[5,2];
    x2:=mx-p[6,1];y2:=my-p[6,2];
    if (abs(x1*y2-x2*y1)>zero) or (x1*x2<-zero) or (y1*y2<-zero) then
      c[i]:=true
    else c[i]:=false;
    x1:=p[2,1]-p[1,1];y1:=p[2,2]-p[1,2];
    x2:=p[3,1]-p[1,1];y2:=p[3,2]-p[1,2];
    if abs(x1*x2+y1*y2)>zero then
    begin
      x2:=p[4,1]-p[1,1];y2:=p[4,2]-p[1,2];
      if abs(x1*x2+y1*y2)>zero then
      begin
        x1:=p[3,1]-p[1,1];y1:=p[3,2]-p[1,2];
      end;
    end;
    s[i]:=sqrt(sqr(x1)+sqr(y1))*sqrt(sqr(x2)+sqr(y2))/2;
  end;
  for i:=1 to n do
  begin
    t:=i;
    for j:=i+1 to n do
      if s[j]<s[t] then
        t:=j;
    s[0]:=s[i];s[i]:=s[t];s[t]:=s[0];
    c[0]:=c[i];c[i]:=c[t];c[t]:=c[0];
  end;
  l:=n-k+1;r:=l;
  while (l>1) and (abs(s[l]-s[l-1])<zero) do
    dec(l);
  while (r<n) and (abs(s[r]-s[r+1])<zero) do
    inc(r);
  a1:=0;dec(k,n-r);
  for i:=n downto r+1 do
    if c[i] then
      a1:=a1+s[i];
  ls1:=0;num:=0;
  for i:=l to r do
    if c[i] then
    begin
      inc(ls1);
      s1[ls1]:=s[i];
    end else
      inc(num);
  a:=a1;
  for i:=1 to k-num do
    a:=a+s1[i];
  write(a:0:3,' ');
  a:=a1;
  for i:=ls1 downto ls1-k+1 do
  begin
    if i<=0 then break;
    a:=a+s1[i];
  end;
  writeln(a:0:3);
end.
