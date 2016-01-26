var
  n,m,i,j,a,b,c,d,le,ri,mid,min,aug,ans:longint;
  lim:array[1..10000] of longint;
  r:array[1..10000,1..2] of integer;
  map,tmp:array[0..101,0..101] of longint;
  q,cur,h,rem:array[0..101] of longint;
  find:boolean;
function check(t:longint):boolean;
begin
  map:=tmp;
  inc(map[n,1],t);
  fillchar(rem,sizeof(rem),0);
  fillchar(cur,sizeof(cur),0);
  fillchar(h,sizeof(h),0);
  h[0]:=n+2;
  for i:=1 to n do
  begin
    inc(rem[i],map[0,i]);
    dec(rem[0],map[0,i]);
    map[i,0]:=map[0,i];
    map[0,i]:=0;
    q[i]:=i;
  end;
  i:=1;
  while i<=n do
  begin
    a:=q[i];
    b:=h[a];
    while rem[a]>0 do
    begin
      c:=cur[a];
      if c>n+1 then
      begin
        min:=-1;
        for j:=0 to n+1 do
          if (map[a,j]>0) and ((min>h[j]) or (min<0)) then
            min:=h[j];
        h[a]:=min+1;
        cur[a]:=0;
        continue;
      end;
      if (map[a,c]>0) and (h[a]=h[c]+1) then
      begin
        if rem[a]<map[a,c] then
          aug:=rem[a]
        else aug:=map[a,c];
        dec(map[a,c],aug);
        inc(map[c,a],aug);
        dec(rem[a],aug);
        inc(rem[c],aug);
      end else
        inc(cur[a]);
    end;
    if h[a]>b then
    begin
      for j:=i downto 2 do
        q[j]:=q[j-1];
      q[1]:=a;
      i:=2;
    end else
      inc(i);
  end;
  check:=false;
  for i:=1 to n do
    if map[0,i]<>0 then
      exit;
  check:=true;
end;
begin
  fillchar(map,sizeof(map),0);
  readln(n,m);
  for i:=1 to m do
  begin
    read(a,b,c,d);
    r[i,1]:=a;r[i,2]:=b;
    lim[i]:=c;
    if d=1 then
    begin
      inc(map[0,b],c);
      inc(map[a,n+1],c);
    end else
      inc(map[a,b],c);
  end;
  for i:=1 to n do
    if map[0,i]>map[i,n+1] then
    begin
      dec(map[0,i],map[i,n+1]);
      map[i,n+1]:=0;
    end else
    begin
      dec(map[i,n+1],map[0,i]);
      map[0,i]:=0;
    end;
  tmp:=map;
  le:=0;ri:=maxlongint div 2;
  if not check(ri) then
  begin
    writeln('Impossible');
    halt;
  end;
  ans:=ri;
  while le<=ri do
  begin
    mid:=(le+ri) div 2;
    if check(mid) then
    begin
      ri:=mid-1;
      ans:=mid;
    end else
      le:=mid+1;
  end;
  check(ans);
  dec(map[n,1],ans);
  writeln(ans);
  for i:=1 to m do
  begin
    write(lim[i]-map[r[i,1],r[i,2]]);
    if i<>m then write(' ');
  end;
  writeln;
end.
