const
  max=10000;
var
  n,i,j,j1,j2,p,l,x,a:longint;
  pr,num:array[1..600] of longint;
  ans:array[0..1000] of longint;
  get:boolean;
begin
  l:=1;pr[l]:=2;
  for i:=3 to 3000 do
  begin
    get:=true;
    for j:=1 to l do
    begin
      if sqr(pr[j])>i then
        break;
      if i mod pr[j]=0 then
      begin
        get:=false;
        break;
      end;
    end;
    if get then
    begin
      inc(l);
      pr[l]:=i;
    end;
  end;
  readln(n);
  for i:=1 to n do
  begin
    fillchar(num,sizeof(num),0);
    fillchar(ans,sizeof(ans),0);
    ans[0]:=1;ans[1]:=1;
    x:=0;
    read(p);
    for j:=2*p downto p+1 do
    begin
      x:=j;
      for j1:=1 to l do
      begin
        while x mod pr[j1]=0 do
        begin
          x:=x div pr[j1];
          inc(num[j1]);
        end;
        if x=1 then
          break;
      end;
    end;
    for j:=p downto 2 do
    begin
      x:=j;
      for j1:=1 to l do
      begin
        while x mod pr[j1]=0 do
        begin
          x:=x div pr[j1];
          dec(num[j1]);
        end;
        if x=1 then
          break;
      end;
    end;
    x:=0;
    for j:=1 to l do
    begin
      a:=1;
      for j1:=1 to num[j] do
        a:=a*pr[j];
      for j2:=1 to ans[0] do
      begin
        x:=ans[j2]*a+x;
        ans[j2]:=x mod max;
        x:=x div max;
      end;
      while x<>0 do
      begin
        inc(ans[0]);
        ans[ans[0]]:=x mod max;
        x:=x div max;
      end;
    end;
    for j2:=ans[0] downto 1 do
    begin
      x:=x*max+ans[j2];
      ans[j2]:=x div p;
      x:=x mod p;
    end;
    j2:=1;
    inc(ans[j2],2);
    while ans[j2]>=max do
    begin
      inc(ans[j2+1]);
      dec(ans[j2],max);
      inc(j2);
    end;
    if j2>ans[0] then ans[0]:=j2;
    while (ans[0]>1) and (ans[ans[0]]=0) do
      dec(ans[0]);
    write(ans[ans[0]]);
    for j2:=ans[0]-1 downto 1 do
      write(ans[j2] div 1000,ans[j2] div 100 mod 10,ans[j2] div 10 mod 10,ans[j2] mod 10);
    writeln;
  end;
end.
