const
  mx:array[1..4] of integer=(1,0,-1,0);
  my:array[1..4] of integer=(0,-1,0,1);
var
  n,m,i,j,x,y,lr,lc,tot,a:longint;
  map:array[0..41,0..41] of boolean;
  link:array[1..1600] of integer;
  v:array[1..1600] of boolean;
  r,c:array[1..1600,1..2] of integer;
function find(t:longint):boolean;
var
  i,t1,x1,y1:integer;
begin
  for i:=1 to 4 do
  begin
    t1:=t+mx[i]*n+my[i];
    x1:=(t-1) div n+1+mx[i];
    y1:=(t-1) mod n+1+my[i];
    if map[x1,y1] and not v[t1] then
    begin
      v[t1]:=true;
      if (link[t1]=0) or find(link[t1]) then
      begin
        link[t1]:=t;
        link[t]:=t1;
        find:=true;
        exit;
      end;
    end;
  end;
  find:=false;
end;
begin
  fillchar(map,sizeof(map),false);
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      map[i,j]:=true;
  tot:=sqr(n);
  for i:=1 to m do
  begin
    read(x,y);
    if map[x,y] then
      dec(tot);
    map[x,y]:=false;
  end;
  a:=0;
  fillchar(link,sizeof(link),0);
  for i:=1 to n do
    for j:=1 to n do
      if map[i,j] and (link[(i-1)*n+j]=0) then
      begin
        fillchar(v,sizeof(v),false);
        if find((i-1)*n+j) then
          inc(a);
      end;
  if a*2=tot then
  begin
    lr:=0;lc:=0;
    for i:=1 to n do
      for j:=1 to n do
        if map[i,j] then
        begin
          x:=(i-1)*n+j;
          if link[x]<x then
            if x-link[x]=1 then
            begin
              inc(lc);
              c[lc,1]:=(link[x]-1) div n+1;
              c[lc,2]:=(link[x]-1) mod n+1;
            end else
            begin
              inc(lr);
              r[lr,1]:=(link[x]-1) div n+1;
              r[lr,2]:=(link[x]-1) mod n+1;
            end;
        end;
    writeln('Yes');
    writeln(lr);
    for i:=1 to lr do
      writeln(r[i,1],' ',r[i,2]);
    writeln(lc);
    for i:=1 to lc do
      writeln(c[i,1],' ',c[i,2]);
  end else
    writeln('No');
end.
