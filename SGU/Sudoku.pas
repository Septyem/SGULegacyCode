const
  mc=324;
  mr=729;
var
  i,j,k,k1,sum,x1,y1,z1,n,ln:longint;
  map:array[1..9,1..9] of integer;
  l,r,u,d,c,o:array[0..mc*mr] of longint;
  s:array[1..mc] of integer;
  ss:array[1..mr,1..mc] of longint;
  len:array[1..mr] of integer;
  ch:char;
  fin:boolean;
procedure ins(x:longint);
begin
  inc(len[x]);
  ss[x,len[x]]:=sum;
  if len[x]=1 then
  begin
    l[sum]:=sum;
    r[sum]:=sum;
  end else
  begin
    l[sum]:=ss[x,len[x]-1];
    r[sum]:=r[l[sum]];
    l[r[sum]]:=sum;
    r[l[sum]]:=sum;
  end;
end;
procedure move(x:longint);
var
  i,j:longint;
begin
  r[l[x]]:=r[x];
  l[r[x]]:=l[x];
  i:=d[x];
  while i<>x do
  begin
    j:=r[i];
    repeat
      u[d[j]]:=u[j];
      d[u[j]]:=d[j];
      dec(s[c[j]]);
      j:=r[j];
    until j=i;
    i:=d[i];
  end;
end;
procedure rem(x:longint);
var
  i,j:longint;
begin
  i:=u[x];
  while i<>x do
  begin
    j:=l[i];
    repeat
      u[d[j]]:=j;
      d[u[j]]:=j;
      inc(s[c[j]]);
      j:=l[j];
    until j=i;
    i:=u[i];
  end;
  r[l[x]]:=x;
  l[r[x]]:=x;
end;
procedure dfs(k:integer);
var
  min,i,j,x,y,z,p:longint;
begin
  if fin then exit;
  if r[0]=0 then
  begin
    for i:=1 to 9 do
      for j:=1 to 9 do
        write(map[i,j]);
    writeln;
    fin:=true;
    exit;
  end;
  min:=mc+1;
  i:=r[0];
  while i<>0 do
  begin
    if s[i]<min then
    begin
      min:=s[i];
      p:=i;
    end;
    i:=r[i];
  end;
  move(p);
  i:=d[p];
  while i<>p do
  begin
    j:=r[i];
    while j<>i do
    begin
      move(c[j]);
      j:=r[j];
    end;
    x:=(o[i]-1) div 81+1;
    y:=(o[i]-(x-1)*81-1) div 9+1;
    z:=(o[i]-1) mod 9+1;
    map[x,y]:=z;
    dfs(k+1);
    j:=l[i];
    while j<>i do
    begin
      rem(c[j]);
      j:=l[j];
    end;
    i:=d[i];
  end;
  rem(p);
end;
begin
  readln(n);
  for ln:=1 to n do
  begin
  fin:=false;
  for i:=1 to mc do
  begin
    c[i]:=i;
    r[i-1]:=i;
  end;
  r[mc]:=0;
  for i:=mc downto 1 do
    l[i]:=i-1;
  l[0]:=mc;
  sum:=mc;
  fillchar(len,sizeof(len),0);
  for i:=1 to 81 do
  begin
    s[i]:=9;
    z1:=(i-1) mod 9+1;
    x1:=(i-1) div 9+1;
    for j:=1 to 9 do
    begin
      inc(sum);
      o[sum]:=(x1-1)*81+(j-1)*9+z1;
      ins(o[sum]);
      c[sum]:=i;
      if j=1 then
      begin
        u[sum]:=i;
        d[i]:=sum;
      end else
      begin
        u[sum]:=sum-1;
        d[sum-1]:=sum;
      end;
    end;
    u[i]:=sum;
    d[sum]:=i;
  end;
  for i:=82 to 162 do
  begin
    s[i]:=9;
    z1:=(i-82) mod 9+1;
    y1:=(i-82) div 9+1;
    for j:=1 to 9 do
    begin
      inc(sum);
      o[sum]:=(j-1)*81+(y1-1)*9+z1;
      ins(o[sum]);
      c[sum]:=i;
      if j=1 then
      begin
        u[sum]:=i;
        d[i]:=sum;
      end else
      begin
        u[sum]:=sum-1;
        d[sum-1]:=sum;
      end;
    end;
    u[i]:=sum;
    d[sum]:=i;
  end;
  for i:=163 to 243 do
  begin
    s[i]:=9;
    z1:=(i-163) mod 9+1;
    x1:=(i-163) div 9+1;
    y1:=(x1-1) mod 3*3;
    x1:=(x1-1) div 3*3;
    for j:=1 to 3 do
      for k:=1 to 3 do
      begin
        inc(sum);
        if sum=1990 then
          sum:=sum;
        o[sum]:=(x1+j-1)*81+(y1+k-1)*9+z1;
        ins(o[sum]);
        c[sum]:=i;
        if (j=1) and (k=1) then
        begin
          u[sum]:=i;
          d[i]:=sum;
        end else
        begin
          u[sum]:=sum-1;
          d[sum-1]:=sum;
        end;
      end;
    u[i]:=sum;
    d[sum]:=i;
  end;
  for i:=244 to 324 do
  begin
    s[i]:=9;
    x1:=i-244;
    for j:=1 to 9 do
    begin
      inc(sum);
      o[sum]:=x1*9+j;
      ins(o[sum]);
      c[sum]:=i;
      if j=1 then
      begin
        u[sum]:=i;
        d[i]:=sum;
      end else
      begin
        u[sum]:=sum-1;
        d[sum-1]:=sum;
      end;
    end;
    u[i]:=sum;
    d[sum]:=i;
  end;
  for i:=0 to 8 do
    for j:=0 to 8 do
    begin
      read(ch);
      if ch<>'0' then
      begin
        map[i+1,j+1]:=ord(ch)-48;
        k:=ss[i*81+j*9+map[i+1,j+1],1];
        if map[i+1,j+1]=5 then
          k:=k;
        k1:=k;
        repeat
          move(c[k1]);
          k1:=r[k1];
        until k1=k;
      end;
    end;
  readln;
  dfs(1);
  end;
end.

