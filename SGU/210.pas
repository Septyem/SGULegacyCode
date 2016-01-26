var
  n,i,j,p,x,y:longint;
  map:array[1..400,1..400] of boolean;
  s:array[0..400,1..2] of longint;
  a,link:array[1..400] of integer;
  v:array[1..400] of boolean;
  bl:boolean;
function find(t:integer):boolean;
var
  i:integer;
begin
  for i:=1 to n do
    if not v[i] and map[s[t,2],i] then
    begin
      v[i]:=true;
      if (link[i]=0) or find(link[i]) then
      begin
        link[i]:=t;
        find:=true;
        exit;
      end;
    end;
  find:=false;
end;
begin
  fillchar(a,sizeof(a),0);
  fillchar(link,sizeof(link),0);
  fillchar(map,sizeof(map),false);
  readln(n);
  for i:=1 to n do
  begin
    read(s[i,1]);
    s[i,2]:=i;
  end;
  for i:=1 to n do
  begin
    read(x);
    for j:=1 to x do
    begin
      read(y);
      map[i,y]:=true;
    end;
  end;
  for i:=1 to n do
  begin
    p:=i;
    for j:=i+1 to n do
      if s[j,1]>s[p,1] then
        p:=j;
    s[0]:=s[p];
    s[p]:=s[i];
    s[i]:=s[0];
  end;
  for i:=1 to n do
  begin
    fillchar(v,sizeof(v),false);
    bl:=find(i);
  end;
  for i:=1 to n do
    if link[i]<>0 then
      a[s[link[i],2]]:=i;
  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end.
