const
  max=10000;
var
  n,m,i,j,x,y,x1,y1,a,sum:longint;
  s,s1:array[1..20,1..20] of integer;
  v:array[1..20,1..20] of boolean;
  c:array[1..400] of longint;
  ans,p,a1:array[0..1000] of longint;
procedure check;
var
  i,j,i1,j1:longint;
begin
  for i:=0 to n-1 do
    for j:=0 to m-1 do
    begin
      inc(sum);
      for i1:=1 to n do
        for j1:=1 to m do
        begin
          x:=(i1+i-1) mod n+1;
          y:=(j1+j-1) mod m+1;
          s1[i1,j1]:=s[x,y];
        end;
      fillchar(v,sizeof(v),false);
      a:=0;
      for i1:=1 to n do
        for j1:=1 to m do
          if not v[i1,j1] then
          begin
            x:=i1;y:=j1;
            inc(a);
            while not v[x,y] do
            begin
              v[x,y]:=true;
              x1:=(s1[x,y]-1) div m+1;
              y1:=(s1[x,y]-1) mod m+1;
              x:=x1;y:=y1;
            end;
          end;
      inc(c[a]);
    end;
end;
begin
  fillchar(c,sizeof(c),0);
  sum:=0;
  readln(n,m);
  for i:=1 to n do
    for j:=1 to m do
      s[i,j]:=(i-1)*m+j;
  check;
  for i:=1 to n do
    for j:=1 to m do
      s[i,j]:=(n-i)*m+m-j+1;
  check;
  if n=m then
  begin
    for i:=1 to n do
      for j:=1 to m do
        s[i,j]:=(j-1)*m+m-i+1;
    check;
    for i:=1 to n do
      for j:=1 to m do
        s[i,j]:=(n-j)*m+i;
    check;
  end;
  fillchar(ans,sizeof(ans),0);
  fillchar(p,sizeof(p),0);
  p[0]:=1;p[1]:=1;
  x:=0;
  for i:=1 to 400 do
  begin
    for j:=1 to p[0] do
    begin
      x:=p[j]*2+x;
      p[j]:=x mod max;
      x:=x div max;
    end;
    if x<>0 then
    begin
      inc(p[0]);
      p[p[0]]:=x;
      x:=0;
    end;
    fillchar(a1,sizeof(a1),0);
    a1[0]:=p[0];
    for j:=1 to a1[0] do
    begin
      x:=x+p[j]*c[i];
      a1[j]:=x mod max;
      x:=x div max;
    end;
    while x<>0 do
    begin
      inc(a1[0]);
      a1[a1[0]]:=x mod max;
      x:=x div max;
    end;
    if a1[0]>ans[0] then
      ans[0]:=a1[0];
    for j:=1 to ans[0] do
    begin
      x:=x+ans[j]+a1[j];
      ans[j]:=x mod max;
      x:=x div max;
    end;
    if x<>0 then
    begin
      inc(ans[0]);
      ans[ans[0]]:=x;
      x:=0;
    end;
  end;
  for i:=ans[0] downto 1 do
  begin
    x:=x*max+ans[i];
    ans[i]:=x div sum;
    x:=x mod sum;
  end;
  while (ans[0]>1) and (ans[ans[0]]=0) do
    dec(ans[0]);
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    write(ans[i] div 1000,ans[i] div 100 mod 10,ans[i] div 10 mod 10,ans[i] mod 10);
  writeln;
end.
