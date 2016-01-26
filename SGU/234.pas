const
  mx:array[1..4] of integer=(1,0,-1,0);
  my:array[1..4] of integer=(0,1,0,-1);
var
  n,m,i,j,ans:longint;
  map:array[0..201,0..201] of integer;
  p:array[1..200,1..200,1..2] of integer;
  v:array[1..200,1..200] of boolean;
function find(x,y:integer):boolean;
var
  i,nx,ny:integer;
begin
  v[x,y]:=true;
  if odd(x+y) then
  begin
    for i:=1 to 4 do
    begin
      nx:=x+mx[i];ny:=y+my[i];
      if (map[nx,ny]=1) and (not v[nx,ny]) and find(nx,ny) then
      begin
        p[x,y,1]:=nx;p[x,y,2]:=ny;
        p[nx,ny,1]:=x;p[nx,ny,2]:=y;
        find:=true;
        exit;
      end;
    end;
    find:=false;
  end else
    if p[x,y,1]=0 then
      find:=true
    else find:=find(p[x,y,1],p[x,y,2]);
end;
procedure work(g,x,y:integer);
var
  i,nx,ny:integer;
begin
  v[x,y]:=true;
  if g=1 then
  begin
    map[x,y]:=2;
    for i:=1 to 4 do
    begin
      nx:=x+mx[i];ny:=y+my[i];
      if (map[nx,ny]=1) and (not v[nx,ny]) then
        work(1-g,nx,ny);
    end;
  end else
    if p[x,y,1]<>0 then
      work(1-g,p[x,y,1],p[x,y,2]);
end;
begin
  fillchar(map,sizeof(map),0);
  fillchar(p,sizeof(p),0);
  readln(n,m);
  ans:=0;
  for i:=1 to n do
    for j:=1 to m do
    begin
      read(map[i,j]);
      inc(ans,map[i,j]);
    end;
  for i:=1 to n do
    for j:=1 to m do
      if odd(i+j) and (map[i,j]=1) and (p[i,j,1]=0) then
      begin
        fillchar(v,sizeof(v),false);
        if find(i,j) then
          dec(ans);
      end;
  fillchar(v,sizeof(v),false);
  for i:=1 to n do
    for j:=1 to m do
      if (map[i,j]=1) and (p[i,j,1]=0) then
        work(1,i,j);
  for i:=1 to n do
    for j:=1 to m do
      if odd(i+j) and (map[i,j]=1) and (not v[i,j]) then
        map[i,j]:=2;
  writeln(ans);
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      if map[i,j]=0 then write('#');
      if map[i,j]=1 then write('.');
      if map[i,j]=2 then write('G');
    end;
    writeln;
  end;
end.
