var
  b,n,m,x,v,d,i,j,tot,lh,tmp:longint;
  s:array[0..100000,1..3] of longint;
  f,p:array[0..5000] of longint;
  pb:array[1..5000] of boolean;
  dis:array[1..5000] of double;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s[0]:=s[r];s[r]:=s[a];
  while i<j do
  begin
    while (i<j) and ((s[j,1]<s[0,1]) or ((s[j,1]=s[0,1]) and (s[j,3]>s[0,3]))) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and ((s[i,1]>s[0,1]) or ((s[i,1]=s[0,1]) and (s[i,3]<s[0,3]))) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
begin
  randomize;
  readln(b,n);
  tot:=0;
  for i:=1 to n do
  begin
    read(x,m);
    for j:=1 to m do
    begin
      read(v,d);
      if x<b then
      begin
        inc(tot);
        s[tot,1]:=x;
        s[tot,2]:=x+d;
        s[tot,3]:=v;
      end;
    end;
  end;
  qsort(1,tot);
  f[0]:=1;f[1]:=s[tot,1];
  p[1]:=tot;
  for i:=tot downto 2 do
    if s[i,1]<>s[i-1,1] then
    begin
      inc(f[0]);
      f[f[0]]:=s[i-1,1];
      p[f[0]]:=i-1;
    end;
  inc(f[0]);f[f[0]]:=b;
  lh:=0;
  if f[1]<>0 then
  begin
    writeln(-1);
    halt;
  end;
  dis[1]:=0;
  fillchar(pb,sizeof(pb),true);
  for i:=2 to f[0] do
  begin
    dis[i]:=1e8;
    for j:=1 to i-1 do
      if pb[j] then
      begin
        while (p[j]>0) and (s[p[j],1]=f[j]) and (s[p[j],2]<f[i]) do
          dec(p[j]);
        if (p[j]=0) or (s[p[j],1]<>f[j]) then
          pb[j]:=false
        else
        if dis[j]+(f[i]-f[j])/s[p[j],3]<dis[i] then
          dis[i]:=dis[j]+(f[i]-f[j])/s[p[j],3];
      end;
    if abs(dis[i]-1e8)<1e-5 then
    begin
      writeln(-1);
      halt;
    end;
  end;
  writeln(dis[f[0]]:0:3);
end.
