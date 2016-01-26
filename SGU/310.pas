var
  n,m,k,i,j,h,t,x:longint;
  ans:int64;
  d:array[1..60,0..33000] of int64;
  q,bl:array[0..33000] of longint;
  bi:array[1..20] of longint;
  v:array[0..33000] of boolean;
begin
  fillchar(d,sizeof(d),0);
  readln(n,m,k);
  for i:=1 to m do
    bi[i]:=1 shl (i-1);
  fillchar(v,sizeof(v),false);
  h:=0;t:=1;
  q[t]:=0;bl[0]:=0;
  v[0]:=true;
  while h<t do
  begin
    inc(h);
    for i:=1 to m do
      if (q[h] and bi[i]=0) and (not v[q[h]+bi[i]]) then
      begin
        inc(t);
        q[t]:=q[h]+bi[i];
        bl[q[t]]:=bl[q[h]]+1;
        v[q[t]]:=true;
      end;
  end;
  for i:=0 to bi[m]*2-1 do
    if bl[i]>=k then
      d[m,i]:=1;
  for i:=m+1 to n do
    for j:=0 to bi[m]*2-1 do
      if bl[j]>=k then
      begin
        if (bl[j]>k) or (j mod 2=0) then
          inc(d[i,j shr 1],d[i-1,j]);
        inc(d[i,j shr 1+bi[m]],d[i-1,j]);
      end;
  ans:=0;
  for j:=0 to bi[m]*2-1 do
    if bl[j]>=k then
      inc(ans,d[n,j]);
  writeln(ans);
end.
