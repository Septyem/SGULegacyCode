const
  hash:array[0..12,1..5] of integer=((0,0,0,0,0),(1,0,0,0,0),(0,1,0,0,0),(0,0,1,0,0),(1,0,1,0,0),(0,0,0,1,0),(1,0,0,1,0),(0,1,0,1,0),(0,0,0,0,1),(1,0,0,0,1),(0,1,0,0,1),(0,0,1,0,1),(1,0,1,0,1));
type
  map=array[1..10] of boolean;
var
  n,k,i,j,j1,j2,a,b,c,e,a1,b1,c1,e1:longint;
  ans:int64;
  er:array[0..11] of integer;
  tmp:array[1..5] of integer;
  bl:array[1..3] of map;
  d,d1:array[0..12,0..12,0..12,0..12,0..100] of longint;
procedure calc(m1,m2:map;x,y:integer;var a:longint);
var
  i,j:integer;
  get:boolean;
begin
  i:=0;
  while y<=n do
  begin
    inc(i);
    if x=1 then
      if m1[y] then
        tmp[i]:=1
      else tmp[i]:=0
    else
      if m2[y] then
        tmp[i]:=1
      else tmp[i]:=0;
    x:=3-x;
    inc(y,2);
  end;
  while i<>5 do
  begin
    inc(i);
    tmp[i]:=0;
  end;
  a:=-1;
  for i:=0 to 12 do
  begin
    get:=true;
    for j:=1 to 5 do
      if tmp[j]<>hash[i,j] then
        get:=false;
    if get then
    begin
      a:=i;
      break;
    end;
  end;
end;
procedure dp(t,k1:integer);
var
  i:integer;
begin
  if t>n then
  begin
    calc(bl[2],bl[3],1,1,a);
    calc(bl[2],bl[3],1,2,b);
    calc(bl[2],bl[3],2,1,c);
    calc(bl[2],bl[3],2,2,e);
    for i:=0 to k do
    begin
      if i+k1>k then
        break;
      if (a=0) and (b=0) and (c=2) and (e=0) and (d1[a1,b1,c1,e1,i]<>0) then
        a:=a;
      inc(d[a,b,c,e,i+k1],d1[a1,b1,c1,e1,i]);
    end;
    exit;
  end;
  if ((t<3) or not bl[2,t-2]) and ((t<2) or not bl[1,t-1]) and
  ((t>n-2) or not bl[2,t+2]) and ((t=n) or not bl[1,t+1]) then
  begin
    bl[3,t]:=true;
    dp(t+1,k1+1);
    bl[3,t]:=false;
  end;
  dp(t+1,k1);
end;
begin
  fillchar(d,sizeof(d),0);
  d[0,0,0,0,0]:=1;
  readln(n,k);
  er[1]:=1;
  for i:=2 to n+1 do
    er[i]:=er[i-1] shl 1;
  for i:=1 to n do
  begin
    d1:=d;
    fillchar(d,sizeof(d),0);
    for j:=0 to er[n+1]-1 do
    begin
      for j1:=1 to n do
        if j and er[j1]<>0 then
          bl[1,j1]:=true
        else bl[1,j1]:=false;
      for j1:=0 to er[n+1]-1 do
      begin
        for j2:=1 to n do
          if j1 and er[j2]<>0 then
            bl[2,j2]:=true
          else bl[2,j2]:=false;
        calc(bl[1],bl[2],1,1,a1);
        calc(bl[1],bl[2],1,2,b1);
        calc(bl[1],bl[2],2,1,c1);
        calc(bl[1],bl[2],2,2,e1);
        if (a1>=0) and (b1>=0) and (c1>=0) and (e1>=0) then
          dp(1,0);
      end;
    end;
    for j:=0 to er[n+1]-1 do
  end;
  ans:=0;
  for a:=0 to 12 do
    for b:=0 to 12 do
      for c:=0 to 12 do
        for e:=0 to 12 do
          inc(ans,d[a,b,c,e,k]);
  writeln(ans);
end.

//TIME LIMIT EXCEED!