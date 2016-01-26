var
  n,i,j:integer;
  a,s,sn:array[1..3,1..3] of integer;
procedure search(x,y:integer);
var
  i,j:integer;
  co:boolean;
begin
  if x>n then
  begin
    for i:=1 to n do
      if sn[n,i]<>s[n,i] then
        exit;
    for i:=1 to n do
    begin
      for j:=1 to n-1 do
        write(a[i,j],' ');
      writeln(a[i,n]);
    end;
    halt;
  end;
  for i:=0 to 9 do
  begin
    co:=true;
    a[x,y]:=i;
    if x-1>0 then
    begin
      if a[x,y]>a[x-1,y] then
        inc(sn[x-1,y]);
      if a[x,y]<a[x-1,y] then
        inc(sn[x,y]);
      if sn[x-1,y]>s[x-1,y] then
        co:=false;
    end;
    if y-1>0 then
    begin
      if a[x,y]>a[x,y-1] then
        inc(sn[x,y-1]);
      if a[x,y]<a[x,y-1] then
        inc(sn[x,y]);
      if sn[x,y-1]>s[x,y-1] then
        co:=false;
    end;
    if (x>1) and (sn[x-1,y]<>s[x-1,y]) then
      co:=false;
    if co and (sn[x,y]<=s[x,y]) then
      if y=n then
        search(x+1,1)
      else search(x,y+1);
    if x-1>0 then
    begin
      if a[x,y]>a[x-1,y] then
        dec(sn[x-1,y]);
      if a[x,y]<a[x-1,y] then
        dec(sn[x,y]);
    end;
    if y-1>0 then
    begin
      if a[x,y]>a[x,y-1] then
        dec(sn[x,y-1]);
      if a[x,y]<a[x,y-1] then
        dec(sn[x,y]);
    end;
  end;
end;
begin
  fillchar(sn,sizeof(sn),0);
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      read(s[i,j]);
  search(1,1);
  writeln('NO SOLUTION');
end.
