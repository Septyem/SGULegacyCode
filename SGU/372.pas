var
  n,k,i,j,j1,j2,x,y,z,r,pa,p1,p2,l0,l1:longint;
  a1:int64;
  t:array[0..1,0..1000,0..1] of longint;
  d:array[0..1,0..1000,0..1,0..1] of int64;
  p:array[1..1000,0..1000,0..1,0..1] of shortint;
  ans:array[1..1000] of integer;
  find:boolean;
procedure qsort(a,b,c:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  t[c,0,0]:=t[c,r,0];
  t[c,0,1]:=t[c,r,1];
  t[c,r,0]:=t[c,a,0];
  t[c,r,1]:=t[c,a,1];
  while i<j do
  begin
    while (i<j) and (t[c,j,1]>t[c,0,1]) do
      dec(j);
    if i<j then
    begin
      t[c,i,0]:=t[c,j,0];
      t[c,i,1]:=t[c,j,1];
      inc(i);
    end;
    while (i<j) and (t[c,i,1]<t[c,0,1]) do
      inc(i);
    if i<j then
    begin
      t[c,j,0]:=t[c,i,0];
      t[c,j,1]:=t[c,i,1];
      dec(j);
    end;
  end;
  t[c,i,0]:=t[c,0,0];
  t[c,i,1]:=t[c,0,1];
  if i+1<b then qsort(i+1,b,c);
  if i-1>a then qsort(a,i-1,c);
end;
begin
  randomize;
  readln(k,n);
  l0:=0;l1:=0;
  for i:=1 to n do
  begin
    read(x,y);
    if y=0 then
    begin
      inc(l0);
      t[0,l0,1]:=x;
      t[0,l0,0]:=i;
    end else
    begin
      inc(l1);
      t[1,l1,1]:=x;
      t[1,l1,0]:=i;
    end;
  end;
  qsort(1,l0,0);
  qsort(1,l1,1);
  fillchar(d,sizeof(d),0);
  fillchar(p,sizeof(p),$ff);
  r:=0;
  for i:=0 to k-1 do
  begin
    fillchar(d[r],sizeof(d[r]),$6f);
    r:=1-r;
    for j:=0 to i do
      for j1:=0 to 1 do
        for j2:=0 to 1 do
        begin
          if (j<l0) and ((j1<>j2) or (j1<>0)) and (d[r,j,j1,j2]+t[0,j+1,1]*(k-i)<d[1-r,j+1,j2,0]) then
          begin
            d[1-r,j+1,j2,0]:=d[r,j,j1,j2]+t[0,j+1,1]*(k-i);
            p[i+1,j+1,j2,0]:=j1;
          end;
          if (i-j<l1) and ((j1<>j2) or (j1<>1)) and (d[r,j,j1,j2]+t[1,i+1-j,1]*(k-i)<d[1-r,j,j2,1]) then
          begin
            d[1-r,j,j2,1]:=d[r,j,j1,j2]+t[1,i+1-j,1]*(k-i);
            p[i+1,j,j2,1]:=j1;
          end;
        end;
  end;
  a1:=1000000000000;
  for i:=0 to k do
    for j1:=0 to 1 do
      for j2:=0 to 1 do
        if (d[1-r,i,j1,j2]<>-1) and (d[1-r,i,j1,j2]<a1) then
        begin
          a1:=d[1-r,i,j1,j2];
          pa:=i;
          p1:=j1;p2:=j2;
        end;
  if a1<>1000000000000 then
  begin
    l0:=pa;l1:=k-pa;
    for i:=k downto 1 do
    begin
      x:=p[i,l0,p1,p2];
      if p2=1 then
      begin
        ans[i]:=t[p2,l1,0];
        dec(l1);
      end else
      begin
        ans[i]:=t[p2,l0,0];
        dec(l0);
      end;
      p2:=p1;p1:=x;
    end;
    for i:=1 to k do
    begin
      write(ans[i]);
      if i<>k then write(' ')
        else writeln;
    end;
  end else
    writeln('Impossible');
end.
