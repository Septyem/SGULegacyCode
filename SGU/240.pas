type
  road=record
    t,r,p:longint;
  end;
const
  max=10000000;
var
  n,m,h,s,e,a,b,i,mid,now,head,tail,suc:longint;
  map:array[1..100,1..100] of road;
  q:array[1..10000] of integer;
  dis,pre,ans:array[0..100] of longint;
  v,ex:array[1..100] of boolean;
begin
  fillchar(map,sizeof(map),$ff);
  fillchar(ex,sizeof(ex),false);
  readln(n,m,h,s,e);
  for i:=1 to m do
  begin
    read(a,b);
    read(map[a,b].t,map[a,b].r,map[a,b].p);
    map[b,a].t:=map[a,b].t;
    map[b,a].r:=map[a,b].r;
    map[b,a].p:=map[a,b].p;
  end;
  for i:=1 to e do
  begin
    read(a);
    ex[a]:=true;
  end;
  a:=0;b:=h;pre[s]:=0;
  while a<=b do
  begin
    mid:=(a+b) div 2;
    for i:=1 to n do
      dis[i]:=max;
    fillchar(v,sizeof(v),false);
    head:=0;tail:=1;
    q[tail]:=s;
    dis[s]:=0;v[s]:=true;
    while head<tail do
    begin
      inc(head);
      now:=q[head];
      for i:=1 to n do
        if (map[now,i].t<>-1) and (dis[i]>dis[now]+map[now,i].t) and
        ((dis[now]+map[now,i].t)*map[now,i].p+map[now,i].r<=mid) then
        begin
          dis[i]:=dis[now]+map[now,i].t;
          pre[i]:=now;
          if not v[i] then
          begin
            inc(tail);
            q[tail]:=i;
          end;
        end;
      v[now]:=false;
    end;
    suc:=0;
    for i:=1 to n do
      if ex[i] and (dis[i]<>max) then
      begin
        suc:=i;
        break;
      end;
    if a=b then break;
    if suc>0 then
      b:=mid
    else a:=mid+1;
  end;
  if suc>0 then
  begin
    writeln('YES');
    writeln(a);
    ans[0]:=0;
    while suc<>0 do
    begin
      inc(ans[0]);
      ans[ans[0]]:=suc;
      suc:=pre[suc];
    end;
    write(ans[0]);
    for i:=ans[0] downto 1 do
      write(' ',ans[i]);
    writeln;
  end else
    writeln('NO');
end.
