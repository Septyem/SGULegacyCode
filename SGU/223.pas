var
  n,k,i,j:longint;
  ans:int64;
  er:array[0..11] of integer;
  d,d1:array[0..1100,0..100] of int64;
procedure dp(t,k1,t1:integer);
var
  i:integer;
begin
  if t>n then
  begin
    for i:=0 to k do
    begin
      if i+k1>k then
        break;
      inc(d[t1,i+k1],d1[j,i]);
    end;
    exit;
  end;
  if ((t=1) or ((j and er[t-1]=0) and (t1 and er[t-1]=0))) and (j and er[t]=0)
  and ((t=n) or (j and er[t+1]=0)) then
    dp(t+1,k1+1,t1+er[t]);
  dp(t+1,k1,t1);
end;
begin
  fillchar(d,sizeof(d),0);
  d[0,0]:=1;
  readln(n,k);
  er[1]:=1;
  for i:=2 to n+1 do
    er[i]:=er[i-1] shl 1;
  for i:=1 to n do
  begin
    d1:=d;
    fillchar(d,sizeof(d),0);
    for j:=0 to er[n+1]-1 do
      dp(1,0,0);
  end;
  ans:=0;
  for i:=0 to er[n+1]-1 do
    inc(ans,d[i,k]);
  writeln(ans);
end.
