var
  n,k,p,i,j,j1,a,b:longint;
  s:array[1..600,0..600,1..2] of longint;
  c:array[1..600,0..600] of longint;
  pre:array[1..600,0..600] of integer;
  len:array[1..600] of integer;
  v,d,d1,a1:array[0..600] of longint;
begin
  fillchar(len,sizeof(len),0);
  readln(n,k,p);
  for i:=1 to k do
    read(v[i]);
  for i:=1 to n do
  begin
    read(a,b);
    inc(len[b]);
    s[b,len[b],1]:=a;
    s[b,len[b],2]:=i;
  end;
  for i:=1 to k do
  begin
    for j:=1 to len[i] do
    begin
      a:=j;
      for j1:=j+1 to len[i] do
        if s[i,a,1]>s[i,j1,1] then
          a:=j1;
      s[i,0]:=s[i,a];
      s[i,a]:=s[i,j];
      s[i,j]:=s[i,0];
    end;
    c[i,0]:=0;
    c[i,1]:=v[i]+s[i,1,1];
    for j:=2 to len[i] do
      c[i,j]:=c[i,j-1]+s[i,j,1];
  end;
  fillchar(d,sizeof(d),$ff);
  d[0]:=0;
  for i:=1 to k do
  begin
    d1:=d;
    fillchar(d,sizeof(d),$ff);
    for j:=0 to len[i] do
      for j1:=0 to n do
      begin
        if d1[j1]<0 then
          break;
        if (d[j1+j]<0) or (d1[j1]+c[i,j]<d[j1+j]) then
        begin
          d[j1+j]:=d1[j1]+c[i,j];
          pre[i,j1+j]:=j;
        end;
      end;
  end;
  a:=0;
  while (a<=n) and (d[a]<=p) do
    inc(a);
  dec(a);
  writeln(a);
  a1[0]:=0;
  for i:=k downto 1 do
  begin
    for j:=1 to pre[i,a] do
    begin
      inc(a1[0]);
      a1[a1[0]]:=s[i,j,2];
    end;
    dec(a,pre[i,a]);
  end;
  for i:=1 to a1[0] do
  begin
    write(a1[i]);
    if i=a1[0] then
      writeln
    else write(' ');
  end;
end.
