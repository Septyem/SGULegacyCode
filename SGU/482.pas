var
  n,i,j,j1,max,hmax,toth,a,p1,p2,tmp:longint;
  d:array[1..50,0..2600] of longint;
  p:array[1..50,0..2600,1..2] of longint;
  h,f:array[0..50] of longint;
  v:array[1..50] of boolean;
begin
  fillchar(d,sizeof(d),$ff);
  fillchar(p,sizeof(p),0);
  readln(n);
  max:=2*n;toth:=0;
  for i:=1 to n do
  begin
    read(h[i]);
    inc(toth,h[i]);
    if i>1 then
      inc(max,abs(h[i]-h[i-1]));
  end;
  inc(max,h[1]+h[n]);
  hmax:=(max-1) div 2;
  a:=-1;f[0]:=1;
  for i:=1 to n do
  begin
    d[i,2*h[i]+2]:=toth-h[i];
    if (2*h[i]+2>hmax) and (d[i,2*h[i]+2]>a) then
    begin
      a:=d[i,2*h[i]+2];
      f[1]:=i;p1:=0;
    end;
    for j:=2*h[i]+2 to hmax do
      if d[i,j]>=0 then
        for j1:=i+1 to n do
        begin
          if h[j1]>h[i] then
            tmp:=j+2+2*abs(h[j1]-h[i])
          else tmp:=j+2;
          if tmp>hmax then
          begin
            if d[i,j]-h[j1]>a then
            begin
              a:=d[i,j]-h[j1];
              f[1]:=j1;
              p1:=i;p2:=j;
            end;
          end else
            if d[j1,tmp]<d[i,j]-h[j1] then
            begin
              d[j1,tmp]:=d[i,j]-h[j1];
              p[j1,tmp,1]:=i;
              p[j1,tmp,2]:=j;
            end;
        end;
  end;
  writeln(a);
  fillchar(v,sizeof(v),false);
  v[f[1]]:=true;
  while (p1<>0) do
  begin
    v[p1]:=true;
    a:=p[p1,p2,1];
    p2:=p[p1,p2,2];
    p1:=a;
  end;
  f[0]:=0;
  for i:=n downto 1 do
    if not v[i] then
    begin
      inc(f[0]);
      f[f[0]]:=i;
    end;
  writeln(f[0]);
  for i:=f[0] downto 1 do
  begin
    write(f[i]);
    if i<>1 then write(' ')
      else writeln;
  end;
end.
