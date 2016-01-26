{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$R+,Q+,S+}
{$MINSTACKSIZE $02000000}
{$MAXSTACKSIZE $02000000}
type
  point=array[0..2] of longint;
var
  k,i,j:longint;
  r,c,ans:int64;
  s1,s2:array[0..200000] of point;
  p,be:array[1..200000,1..2] of longint;
  vr,vc:array[1..200000] of boolean;
procedure qsort1(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s1[0]:=s1[r];s1[r]:=s1[a];
  while i<j do
  begin
    while (i<j) and ((s1[j,0]>s1[0,0]) or ((s1[j,0]=s1[0,0]) and (s1[j,1]>s1[0,1]))) do
      dec(j);
    if i<j then
    begin
      s1[i]:=s1[j];
      inc(i);
    end;
    while (i<j) and ((s1[i,0]<s1[0,0]) or ((s1[i,0]=s1[0,0]) and (s1[i,1]<s1[0,1]))) do
      inc(i);
    if i<j then
    begin
      s1[j]:=s1[i];
      dec(j);
    end;
  end;
  s1[i]:=s1[0];
  if i+1<b then qsort1(i+1,b);
  if i-1>a then qsort1(a,i-1);
end;
procedure qsort2(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s2[0]:=s2[r];s2[r]:=s2[a];
  while i<j do
  begin
    while (i<j) and ((s2[j,1]>s2[0,1]) or ((s2[j,1]=s2[0,1]) and (s2[j,0]>s2[0,0]))) do
      dec(j);
    if i<j then
    begin
      s2[i]:=s2[j];
      inc(i);
    end;
    while (i<j) and ((s2[i,1]<s2[0,1]) or ((s2[i,1]=s2[0,1]) and (s2[i,0]<s2[0,0]))) do
      inc(i);
    if i<j then
    begin
      s2[j]:=s2[i];
      dec(j);
    end;
  end;
  s2[i]:=s2[0];
  if i+1<b then qsort2(i+1,b);
  if i-1>a then qsort2(a,i-1);
end;
procedure cal(x,y:longint);
var
  i:longint;
begin
  if not vr[x] then
  begin
    inc(r);
    vr[x]:=true;
    i:=be[x,1];
    if not vc[p[s1[i,2],2]] then
      cal(x,p[s1[i,2],2]);
    while (i<k) and (s1[i,0]=s1[i+1,0]) do
    begin
      inc(i);
      if not vc[p[s1[i,2],2]] then
        cal(x,p[s1[i,2],2]);
    end;
  end;
  if not vc[y] then
  begin
    inc(c);
    vc[y]:=true;
    i:=be[y,2];
    if not vr[p[s2[i,2],1]] then
      cal(p[s2[i,2],1],y);
    while (i<k) and (s2[i,1]=s2[i+1,1]) do
    begin
      inc(i);
      if not vr[p[s2[i,2],1]] then
        cal(p[s2[i,2],1],y);
    end;
  end;
end;
begin
  randomize;
  read(k);
  if k=0 then
  begin
    writeln(0);
    halt;
  end;
  for i:=1 to k do
  begin
    read(s1[i,0],s1[i,1]);
    s1[i,2]:=i;
    s2[i]:=s1[i];
  end;
  qsort1(1,k);
  qsort2(1,k);
  fillchar(vr,sizeof(vr),false);
  fillchar(vc,sizeof(vc),false);
  r:=1;be[r,1]:=1;
  p[s1[1,2],1]:=1;
  for i:=2 to k do
  begin
    if s1[i-1,0]<>s1[i,0] then
    begin
      inc(r);
      be[r,1]:=i;
    end;
    p[s1[i,2],1]:=r;
  end;
  c:=1;be[c,2]:=1;
  p[s2[1,2],2]:=1;
  for i:=2 to k do
  begin
    if s2[i-1,1]<>s2[i,1] then
    begin
      inc(c);
      be[c,2]:=i;
    end;
    p[s2[i,2],2]:=c;
  end;
  ans:=0;
  for i:=1 to k do
    if (not vr[p[s1[i,2],1]]) or (not vc[p[s1[i,2],2]]) then
    begin
      r:=0;c:=0;
      cal(p[s1[i,2],1],p[s1[i,2],2]);
      inc(ans,r*c);
    end;
  writeln(ans);
end.
