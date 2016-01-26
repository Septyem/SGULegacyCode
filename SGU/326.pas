var
  n,i,j,tmp,flow,flow1,aug,min:longint;
  map:array[1..21,1..21] of longint;
  w,r,dis,pre,his,nv,be:array[0..30] of longint;
  find:boolean;
procedure finish;
begin
  writeln('NO');
  halt;
end;
begin
  fillchar(map,sizeof(map),0);
  readln(n);
  for i:=1 to n do
    read(w[i]);
  for i:=1 to n do
    read(r[i]);
  inc(w[1],r[1]);
  for i:=2 to n do
  begin
    if w[1]<w[i] then
      finish;
    map[i,n+1]:=w[1]-w[i];
  end;
  flow1:=0;
  for i:=1 to n do
    for j:=1 to n do
    begin
      read(tmp);
      if (tmp<>0) and (i<>1) and (i<j) then
      begin
        inc(map[1,i],tmp);
        inc(map[i,j],tmp);
        inc(flow1,tmp);
      end;
    end;
  fillchar(nv,sizeof(nv),0);
  fillchar(dis,sizeof(dis),0);
  for i:=1 to n+1 do
    be[i]:=1;
  nv[0]:=n+1;
  i:=1;flow:=0;
  aug:=maxlongint;
  while dis[1]<n+1 do
  begin
    his[i]:=aug;
    find:=false;
    for j:=be[i] to n+1 do
      if (dis[j]+1=dis[i]) and (map[i,j]>0) then
      begin
        find:=true;
        if map[i,j]<aug then
          aug:=map[i,j];
        be[i]:=j;
        pre[j]:=i;
        i:=j;
        if i=n+1 then
        begin
          inc(flow,aug);
          while i<>1 do
          begin
            tmp:=pre[i];
            dec(map[tmp,i],aug);
            inc(map[i,tmp],aug);
            i:=tmp;
          end;
          aug:=maxlongint;
        end;
        break;
      end;
    if find then continue;
    min:=n;
    for j:=1 to n+1 do
      if (map[i,j]>0) and (dis[j]<min) then
      begin
        tmp:=j;
        min:=dis[j];
      end;
    be[i]:=tmp;
    dec(nv[dis[i]]);
    if nv[dis[i]]=0 then
      break;
    dis[i]:=min+1;
    inc(nv[dis[i]]);
    aug:=his[i];
    if i<>1 then i:=pre[i];
  end;
  if flow<>flow1 then
    finish;
  writeln('YES');
end.
