const
  max=10000;
type
  bignum=array[0..60] of longint;
var
  n,k,i,j,j1,x:longint;
  tmp,t1:bignum;
  s:array[0..100] of bignum;
  pr,t:array[0..60] of longint;
  find:boolean;
begin
  readln(k,n);
  if k+1=n then
  begin
    writeln(0);
    halt;
  end;
  pr[0]:=1;pr[1]:=2;
  for i:=3 to n do
  begin
    find:=true;
    for j:=1 to pr[0] do
    begin
      if sqr(pr[j])>i then
        break;
      if i mod pr[j]=0 then
      begin
        find:=false;
        break;
      end;
    end;
    if find then
    begin
      inc(pr[0]);
      pr[pr[0]]:=i;
    end;
  end;
  s[0,0]:=1;s[0,1]:=1;
  s[1,0]:=1;s[1,1]:=0;
  x:=0;
  for i:=2 to n-k do
  begin
    s[i,0]:=s[i-1,0];
    for j:=1 to s[i,0] do
    begin
      x:=x+s[i-2,j]+s[i-1,j];
      s[i,j]:=x mod max;
      x:=x div max;
    end;
    if x<>0 then
    begin
      inc(s[i,0]);
      s[i,s[i,0]]:=x;
      x:=0;
    end;
    for j:=1 to s[i,0] do
    begin
      x:=x+s[i,j]*(i-1);
      s[i,j]:=x mod max;
      x:=x div max;
    end;
    while x<>0 do
    begin
      inc(s[i,0]);
      s[i,s[i,0]]:=x mod max;
      x:=x div max;
    end;
  end;
  fillchar(t,sizeof(t),0);
  for i:=2 to n-k do
  begin
    x:=i;
    for j:=1 to pr[0] do
      while x mod pr[j]=0 do
      begin
        dec(t[j]);
        x:=x div pr[j];
      end;
  end;
  for i:=2 to k do
  begin
    x:=i;
    for j:=1 to pr[0] do
      while x mod pr[j]=0 do
      begin
        dec(t[j]);
        x:=x div pr[j];
      end;
  end;
  for i:=1 to pr[0] do
  begin
    x:=0;
    while x=0 do
    begin
      tmp:=s[n-k];
      for j:=tmp[0] downto 1 do
      begin
        x:=x*max+tmp[j];
        tmp[j]:=x div pr[i];
        x:=x mod pr[i];
      end;
      if x=0 then
      begin
        inc(t[i]);
        while (tmp[0]>1) and (tmp[tmp[0]]=0) do
          dec(tmp[0]);
        s[n-k]:=tmp;
      end;
    end;
  end;
  tmp:=s[n-k];
  fillchar(t1,sizeof(t1),0);
  t1[0]:=1;t1[1]:=1;
  x:=0;
  for i:=1 to pr[0] do
  begin
    if t[i]>0 then
      for j:=1 to t[i] do
      begin
        for j1:=1 to tmp[0] do
        begin
          x:=x+tmp[j1]*(pr[i]);
          tmp[j1]:=x mod max;
          x:=x div max;
        end;
        while x<>0 do
        begin
          inc(tmp[0]);
          tmp[tmp[0]]:=x mod max;
          x:=x div max;
        end;
      end;
    if t[i]<0 then
      for j:=-1 downto t[i] do
      begin
        for j1:=1 to t1[0] do
        begin
          x:=x+t1[j1]*(pr[i]);
          t1[j1]:=x mod max;
          x:=x div max;
        end;
        while x<>0 do
        begin
          inc(t1[0]);
          t1[t1[0]]:=x mod max;
          x:=x div max;
        end;
      end;
  end;
  write(tmp[tmp[0]]);
  for i:=tmp[0]-1 downto 1 do
    write(tmp[i] div 1000,tmp[i] div 100 mod 10,tmp[i] div 10 mod 10,tmp[i] mod 10);
  write('/');
  write(t1[t1[0]]);
  for i:=t1[0]-1 downto 1 do
    write(t1[i] div 1000,t1[i] div 100 mod 10,t1[i] div 10 mod 10,t1[i] mod 10);
  writeln;
end.
