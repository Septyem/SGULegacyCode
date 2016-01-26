{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$R+,Q+,S+}
{$MINSTACKSIZE $03000000}
{$MAXSTACKSIZE $03000000}
var
  n,i:longint;
  r,s,dp:array[0..500000,1..2] of longint;
  p:array[0..500000] of longint;
  bl:array[1..500000] of boolean;
procedure qsort(a,b:longint);
var
  i,j,t:longint;
begin
  i:=a;j:=b;t:=random(b-a)+a;
  r[0]:=r[t];r[t]:=r[a];
  while i<j do
  begin
    while (i<j) and ((r[j,1]>r[0,1]) or ((r[j,1]=r[0,1]) and (r[j,2]>r[0,2]))) do
      dec(j);
    if i<j then
    begin
      r[i]:=r[j];
      inc(i);
    end;
    while (i<j) and ((r[i,1]<r[0,1]) or ((r[i,1]=r[0,1]) and (r[i,2]<r[0,2]))) do
      inc(i);
    if i<j then
    begin
      r[j]:=r[i];
      dec(j);
    end;
  end;
  r[i]:=r[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
procedure treedp(t:longint);
var
  i,k,min:longint;
begin
  min:=maxlongint;
  for i:=s[t,1] to s[t,2] do
  begin
    treedp(r[i,2]);
    if dp[r[i,2],1]>dp[r[i,2],2] then
      inc(dp[t,2],dp[r[i,2],1])
    else inc(dp[t,2],dp[r[i,2],2]);
    if dp[r[i,2],1]-dp[r[i,2],2]<min then
    begin
      min:=dp[r[i,2],1]-dp[r[i,2],2];
      k:=r[i,2];
    end;
  end;
  if min<0 then min:=0;
  dp[t,1]:=dp[t,2]-min+1;
  p[t]:=k;
  if dp[t,1]<0 then
  begin
    dp[t,1]:=0;
    p[t]:=-1;
  end;
end;
procedure back(t,t1:longint);
var
  i:longint;
begin
  if t1=1 then
    bl[p[t]]:=true;
  for i:=s[t,1] to s[t,2] do
  begin
    if (t1=1) and (r[i,2]=p[t]) then
      back(r[i,2],2)
    else
    if dp[r[i,2],1]>dp[r[i,2],2] then
      back(r[i,2],1)
    else back(r[i,2],2);
  end;
end;
begin
  randomize;
  readln(n);
  for i:=1 to n-1 do
  begin
    read(r[i,1]);
    r[i,2]:=i+1;
  end;
  qsort(1,n-1);
  fillchar(s,sizeof(s),0);
  s[r[1,1],1]:=1;
  for i:=2 to n-1 do
    if r[i-1,1]<>r[i,1] then
    begin
      s[r[i-1,1],2]:=i-1;
      s[r[i,1],1]:=i;
    end;
  s[r[n-1,1],2]:=n-1;
  for i:=1 to n do
    if s[i,1]=0 then
      s[i,2]:=-1;
  fillchar(dp,sizeof(dp),0);
  treedp(1);
  fillchar(bl,sizeof(bl),false);
  if dp[1,1]>dp[1,2] then
  begin
    back(1,1);
    write(dp[1,1]);
    if dp[1,1]<>0 then
      write('000');
  end else
  begin
    back(1,2);
    write(dp[1,2]);
    if dp[1,2]<>0 then
      write('000');
  end;
  writeln;
  for i:=1 to n do
    if bl[i] then
      write(i,' ');
  writeln;
end.
