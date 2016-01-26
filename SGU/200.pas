var
  t,m,i,j,j1,lp,x,c,m1,tmp:longint;
  prime:array[1..100] of longint;
  equ:array[1..100,1..100] of integer;
  ans,bi:array[0..100] of integer;
  get:boolean;
begin
  readln(t,m);
  lp:=1;prime[lp]:=2;
  i:=2;
  while lp<t do
  begin
    inc(i);
    get:=true;
    for j:=1 to lp do
    begin
      if sqr(prime[j])>i then
        break;
      if i mod prime[j]=0 then
      begin
        get:=false;
        break;
      end;
    end;
    if get then
    begin
      inc(lp);
      prime[lp]:=i;
    end;
  end;
  fillchar(equ,sizeof(equ),0);
  for i:=1 to m do
  begin
    read(x);
    for j:=1 to lp do
    begin
      c:=0;
      while x mod prime[j]=0 do
      begin
        x:=x div prime[j];
        inc(c);
      end;
      if odd(c) then
        equ[j,i]:=1;
    end;
  end;
  c:=0;m1:=1;
  for i:=1 to t do
  begin
    while (m1<=m) and (equ[i,m1]=0) do
    begin
      j:=i+1;
      while (j<=t) and (equ[j,m1]=0) do
        inc(j);
      if j<=t then
        for j1:=1 to m do
        begin
          tmp:=equ[i,j1];equ[i,j1]:=equ[j,j1];equ[j,j1]:=tmp;
        end
      else inc(m1);
    end;
    if m1>m then break;
    inc(c);
    for j:=i+1 to t do
      if equ[j,m1]=1 then
        for j1:=1 to m do
          equ[j,j1]:=equ[j,j1] xor equ[i,j1];
  end;
  c:=m-c;
  fillchar(bi,sizeof(bi),0);
  fillchar(ans,sizeof(ans),0);
  ans[0]:=1;x:=0;
  bi[0]:=1;bi[1]:=1;
  for i:=1 to c do
  begin
    if bi[0]>ans[0] then
      ans[0]:=bi[0];
    for j:=1 to ans[0] do
    begin
      x:=x+ans[j]+bi[j];
      ans[j]:=x mod 10;
      x:=x div 10;
    end;
    if x<>0 then
    begin
      inc(ans[0]);
      ans[ans[0]]:=x;
      x:=0;
    end;
    for j:=1 to bi[0] do
    begin
      x:=x+2*bi[j];
      bi[j]:=x mod 10;
      x:=x div 10;
    end;
    if x<>0 then
    begin
      inc(bi[0]);
      bi[bi[0]]:=x;
      x:=0;
    end;
  end;
  for i:=ans[0] downto 1 do
    write(ans[i]);
  writeln;
end.
