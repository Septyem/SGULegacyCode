const
  max=10000;
var
  c:int64;
  a,b,k,tmp,i,j,j1,d:longint;
  s:array[1..20,0..20] of longint;
  pa,pb:array[0..20,0..40] of longint;
  ans,a1:array[0..40] of longint;
begin
  readln(a,b,k);
  s[1,1]:=1;
  for i:=2 to k do
    for j:=1 to i do
      s[i,j]:=s[i-1,j]+s[i-1,j-1];
  tmp:=0;
  pa[0,0]:=1;pa[0,1]:=1;
  for i:=1 to k do
  begin
    pa[i,0]:=pa[i-1,0];
    for j:=1 to pa[i,0] do
    begin
      tmp:=pa[i-1,j]*a+tmp;
      pa[i,j]:=tmp mod max;
      tmp:=tmp div max;
    end;
    while tmp<>0 do
    begin
      inc(pa[i,0]);
      pa[i,pa[i,0]]:=tmp mod max;
      tmp:=tmp div max;
    end;
  end;
  pb[0,0]:=1;pb[0,1]:=1;
  for i:=1 to k do
  begin
    pb[i,0]:=pb[i-1,0];
    for j:=1 to pb[i,0] do
    begin
      tmp:=pb[i-1,j]*b+tmp;
      pb[i,j]:=tmp mod max;
      tmp:=tmp div max;
    end;
    while tmp<>0 do
    begin
      inc(pb[i,0]);
      pb[i,pb[i,0]]:=tmp mod max;
      tmp:=tmp div max;
    end;
  end;
  fillchar(ans,sizeof(ans),0);
  for i:=0 to k do
  begin
    fillchar(a1,sizeof(a1),0);
    a1[0]:=pa[k-i,0]+pb[i,0];
    for j:=1 to pa[k-i,0] do
    begin
      for j1:=1 to pb[i,0] do
      begin
        tmp:=tmp+a1[j+j1-1]+pa[k-i,j]*pb[i,j1];
        a1[j+j1-1]:=tmp mod max;
        tmp:=tmp div max;
      end;
      if tmp<>0 then
      begin
        a1[j+pb[i,0]]:=tmp;
        tmp:=0;
      end;
    end;
    while a1[a1[0]]=0 do
      dec(a1[0]);
    c:=1;d:=2;
    for j:=k downto k-i+1 do
    begin
      c:=c*j;
      while (d<=i) and (c mod d=0) do
      begin
        c:=c div d;
        inc(d);
      end;
    end;
    for j:=1 to a1[0] do
    begin
      tmp:=tmp+a1[j]*c;
      a1[j]:=tmp mod max;
      tmp:=tmp div max;
    end;
    while tmp<>0 do
    begin
      inc(a1[0]);
      a1[a1[0]]:=tmp mod max;
      tmp:=tmp div max;
    end;
    if a1[0]>ans[0] then
      ans[0]:=a1[0];
    for j:=1 to ans[0] do
    begin
      tmp:=tmp+ans[j]+a1[j];
      ans[j]:=tmp mod max;
      tmp:=tmp div max;
    end;
    if tmp<>0 then
    begin
      inc(ans[0]);
      ans[ans[0]]:=tmp;
      tmp:=0;
    end;
  end;
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    write(ans[i] div 1000,ans[i] div 100 mod 10,ans[i] div 10 mod 10,ans[i] mod 10);
  writeln;
end.
