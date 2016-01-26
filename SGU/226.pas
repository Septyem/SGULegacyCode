var
  n,m,i,j,x,y,c,h,t:longint;
  d:array[1..200,1..3] of longint;
  v:array[1..200,1..3] of boolean;
  r:array[1..200,1..200,1..3] of boolean;
  q:array[1..6000,1..2] of integer;
begin
  fillchar(r,sizeof(r),false);
  readln(n,m);
  for i:=1 to m do
  begin
    read(x,y,c);
    r[x,y,c]:=true
  end;
  fillchar(v,sizeof(v),false);
  fillchar(d,sizeof(d),$6f);
  for i:=1 to 3 do
  begin
    d[1,i]:=0;
    v[1,i]:=true;
    q[i,1]:=1;
    q[i,2]:=i;
  end;
  h:=0;t:=3;
  while h<t do
  begin
    inc(h);
    x:=q[h,1];y:=q[h,2];
    for i:=1 to n do
      for j:=1 to 3 do
        if (j<>y) and r[x,i,j] and (d[x,y]+1<d[i,j]) then
        begin
          d[i,j]:=d[x,y]+1;
          if not v[i,j] then
          begin
            inc(t);
            q[t,1]:=i;
            q[t,2]:=j;
          end;
        end;
    v[x,y]:=false;
  end;
  x:=m+1;
  for i:=1 to 3 do
    if d[n,i]<x then
      x:=d[n,i];
  if x<>m+1 then
    writeln(x)
  else writeln(-1);
end.
