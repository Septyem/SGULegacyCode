const
  mx:array[1..4] of integer=(1,0,-1,0);
  my:array[1..4] of integer=(0,1,0,-1);
var
  q,c,n,t,l,r,i,j,x,y:longint;
  que:array[1..1000000,1..2] of integer;
  v:array[0..1001,0..1001] of integer;
  ans:array[1..23000] of longint;
  coor:array[1..23000,1..2] of integer;
begin
  fillchar(v,sizeof(v),0);
  readln(q,c,n,t);
  l:=0;r:=0;
  for i:=1 to n do
  begin
    inc(r);
    read(coor[i,1],coor[i,2]);
    que[r,1]:=coor[i,1];
    que[r,2]:=coor[i,2];
    v[que[r,1],que[r,2]]:=i;
  end;
  for i:=1 to c do
  begin
    v[0,i]:=-1;
    v[q+1,i]:=-1;
  end;
  for i:=1 to q do
  begin
    v[i,0]:=-1;
    v[i,c+1]:=-1;
  end;
  while l<r do
  begin
    inc(l);
    x:=que[l,1];y:=que[l,2];
    for i:=1 to 4 do
      if v[x+mx[i],y+my[i]]=0 then
      begin
        inc(r);
        if r=29 then
          r:=r;
        que[r,1]:=x+mx[i];
        que[r,2]:=y+my[i];
        v[que[r,1],que[r,2]]:=v[x,y];
      end;
  end;
  fillchar(ans,sizeof(ans),0);
  for i:=1 to q do
    for j:=1 to c do
    begin
      x:=coor[v[i,j],1];
      y:=coor[v[i,j],2];
      if abs(x-i)+abs(y-j)<=t then
        inc(ans[v[i,j]]);
    end;
  for i:=1 to n do
    writeln(ans[i]);
end.
