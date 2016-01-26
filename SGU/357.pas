var
  x,y,i,j,tmp:longint;
  bl:array[0..12] of integer;
  dis:array[0..99] of integer;
begin
  for i:=1 to 3 do
    read(bl[i]);
  read(bl[11]);
  for i:=4 to 6 do
    read(bl[i]);
  read(bl[12]);
  for i:=7 to 9 do
    read(bl[i]);
  read(bl[10],bl[0]);
  readln(x,y);
  fillchar(dis,sizeof(dis),$ff);
  for i:=0 to 9 do
    if bl[i]=1 then
      dis[i]:=1;
  if bl[10]=1 then
    for i:=1 to 9 do
      if bl[i]=1 then
        for j:=0 to 9 do
          if bl[j]=1 then
            dis[i*10+j]:=3;
  dis[x]:=0;
  for i:=0 to 99 do
    if dis[i]>=0 then
    begin
      if bl[11]=1 then
      begin
        tmp:=y-i;
        if tmp<0 then inc(tmp,100);
        if (dis[y]<0) or (dis[y]>dis[i]+tmp) then
          dis[y]:=dis[i]+tmp;
      end;
      if bl[12]=1 then
      begin
        tmp:=i-y;
        if tmp<0 then inc(tmp,100);
        if (dis[y]<0) or (dis[y]>dis[i]+tmp) then
          dis[y]:=dis[i]+tmp;
      end;
    end;
  writeln(dis[y]);
end.
