{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$R+,Q+,S+}
{$MINSTACKSIZE $03000000}
{$MAXSTACKSIZE $03000000}
var
  n,i,x,y,ht:longint;
  r:array[0..400000,1..3] of longint;
  p:array[1..200000,1..2] of longint;
  ans,tmp:array[0..200000] of longint;
  v,la:array[0..200000] of boolean;
  s:string;
procedure qsort(a,b:longint);
var
  i,j,m:longint;
begin
  i:=a;j:=b;m:=random(b-a)+a;
  r[0]:=r[m];r[m]:=r[a];
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
procedure dfs(t:longint);
var
  i:longint;
begin
  v[t]:=true;
  while (x+1) div 2>y do
  begin
    inc(ht);
    inc(ans[0]);
    ans[ans[0]]:=tmp[ht];
    la[tmp[ht]]:=true;
    inc(y);
  end;
  inc(x);
  for i:=p[t,1] to p[t,2] do
    if not v[r[i,2]] then
    begin
      if not la[r[i,3]] then
      begin
        inc(tmp[0]);
        tmp[tmp[0]]:=r[i,3];
      end else
        inc(y);
      dfs(r[i,2]);
      if tmp[tmp[0]]=r[i,3] then
      begin
        dec(tmp[0]);
        if tmp[0]<ht then
          ht:=tmp[0];
      end;
      if la[r[i,3]] then
        dec(y);
    end;
  dec(x);
end;
begin
  randomize;
  readln(n);
  if n=1 then
  begin
    writeln(0);
    exit;
  end;
  for i:=1 to n-1 do
  begin
    read(r[i*2-1,1],r[i*2-1,2]);
    r[i*2,1]:=r[i*2-1,2];
    r[i*2,2]:=r[i*2-1,1];
    readln(s);
    if pos('a',s)=0 then
      la[i]:=true
    else la[i]:=false;
    r[i*2-1,3]:=i;
    r[i*2,3]:=i;
  end;
  qsort(1,2*n-2);
  fillchar(p,sizeof(p),0);
  p[r[1,1],1]:=1;
  for i:=2 to 2*n-2 do
    if r[i-1,1]<>r[i,1] then
    begin
      p[r[i-1,1],2]:=i-1;
      p[r[i,1],1]:=i;
    end;
  p[r[2*n-2,1],2]:=2*n-2;
  ans[0]:=0;tmp[0]:=0;
  x:=0;y:=0;ht:=0;
  fillchar(v,sizeof(v),false);
  v[0]:=true;
  dfs(1);
  writeln(ans[0]);
  for i:=1 to ans[0] do
  begin
    write(ans[i]);
    if i<>ans[0] then
      write(' ');
  end;
  writeln;
end.
