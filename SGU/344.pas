const
  mx:array[1..4] of integer=(1,0,-1,0);
  my:array[1..4] of integer=(0,1,0,-1);
var
  n,m,i,j,j1,h,t,ans,x,y:longint;
  map,v:array[1..1000,1..1000] of boolean;
  q:array[1..1000000,1..2] of integer;
  ch:char;
function check(x,y:integer):boolean;
var
  i,tmp,x1,y1:integer;
begin
  tmp:=0;
  for i:=1 to 4 do
  begin
    x1:=x+mx[i];
    y1:=y+my[i];
    if (x1>0) and (x1<=n) and (y1>0) and (y1<=m) then
      if map[x1,y1] then
        inc(tmp);
  end;
  if tmp>=2 then
    check:=true
  else check:=false;
end;
begin
  readln(n,m);
  ans:=0;
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      read(ch);
      if ch='X' then
      begin
        inc(ans);
        map[i,j]:=true;
      end else
        map[i,j]:=false;
    end;
    readln;
  end;
  fillchar(v,sizeof(v),false);
  for i:=1 to n do
    for j:=1 to m do
      if map[i,j] and (not v[i,j]) then
      begin
        h:=0;t:=0;
        inc(t);
        q[t,1]:=i;q[t,2]:=j;
        v[i,j]:=true;
        while h<t do
        begin
          inc(h);
          for j1:=1 to 4 do
          begin
            x:=q[h,1]+mx[j1];
            y:=q[h,2]+my[j1];
            if (x>0) and (x<=n) and (y>0) and (y<=m) then
            begin
              if not map[x,y] then
                if check(x,y) then
                begin
                  inc(ans);
                  map[x,y]:=true;
                end;
              if map[x,y] and (not v[x,y]) then
              begin
                inc(t);
                q[t,1]:=x;q[t,2]:=y;
                v[x,y]:=true;
              end;
            end;
          end;
        end;
      end;
  writeln(ans);
end.
