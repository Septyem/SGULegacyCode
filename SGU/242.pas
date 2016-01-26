var
  n,k,i,j,c,x:longint;
  r:array[1..200,1..200] of boolean;
  link:array[1..200,1..2] of integer;
  v:array[1..200] of boolean;
  get:boolean;
function find(t:integer):boolean;
var
  i:integer;
begin
  for i:=1 to k do
    if not v[i] and r[t,i] then
    begin
      v[i]:=true;
      if link[i,1]=0 then
      begin
        link[i,1]:=t;
        find:=true;
        exit;
      end;
      if link[i,2]=0 then
      begin
        link[i,2]:=t;
        find:=true;
        exit;
      end;
      if find(link[i,1]) then
      begin
        link[i,1]:=t;
        find:=true;
        exit;
      end;
      if find(link[i,2]) then
      begin
        link[i,2]:=t;
        find:=true;
        exit;
      end;
    end;
  find:=false;
end;
begin
  fillchar(r,sizeof(r),false);
  fillchar(link,sizeof(link),0);
  readln(n,k);
  for i:=1 to n do
  begin
    read(c);
    for j:=1 to c do
    begin
      read(x);
      r[i,x]:=true;
    end;
  end;
  get:=true;
  for i:=1 to n do
  begin
    fillchar(v,sizeof(v),false);
    if find(i) then
      get:=true;
  end;
  for i:=1 to k do
    if (link[i,1]=0) or (link[i,2]=0) then
    begin
      get:=false;
      break;
    end;
  if get then
  begin
    writeln('YES');
    for i:=1 to k do
      writeln(2,' ',link[i,1],' ',link[i,2]);
  end else
    writeln('NO');
end.
