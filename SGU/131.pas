var
  n,m,i,j,l:longint;
  er:array[0..10] of longint;
  d:array[0..9,0..1024] of int64;
  bl:array[1..9] of boolean;
procedure dp(t,now:longint);
begin
  if t>m then
  begin
    inc(d[i+1,now],d[i,j]);
    exit;
  end;
  if not bl[t] and (j and er[t]=0) then
  begin
    if (t<m) and (j and er[t+1]=0) then
    begin
      bl[t+1]:=true;
      if now and er[t]=0 then
        dp(t+1,now+er[t]);
      if now and er[t+1]=0 then
        dp(t+1,now+er[t+1]);
      bl[t+1]:=false;
    end;
    if now and er[t]=0 then
    begin
      dp(t+1,now+er[t]);
      if (t>1) and (now and er[t-1]=0) then
        dp(t+1,now+er[t]+er[t-1]);
      if (t<m) and (now and er[t+1]=0) then
        dp(t+1,now+er[t]+er[t+1]);
    end;
  end else
  begin
    if (t<m) and (now and er[t]=0) and (now and er[t+1]=0) then
      dp(t+1,now+er[t]+er[t+1]);
    dp(t+1,now);
  end;
end;
begin
  fillchar(d,sizeof(d),0);
  readln(n,m);
  for i:=1 to m+1 do
    er[i]:=1 shl (i-1);
  dec(er[m+1]);
  i:=0;j:=er[m+1];
  d[0,er[m+1]]:=1;
  dp(1,0);
  for i:=1 to n-1 do
  begin
    for j:=0 to er[m+1] do
    begin
      fillchar(bl,sizeof(bl),false);
      dp(1,0);
    end;
  end;
  writeln(d[n,er[m+1]]);
end.
