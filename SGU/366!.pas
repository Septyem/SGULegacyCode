const
  max=50;
var
  n,k,i,j,j1,j2,a,b,a1,ls:longint;
  s:array[1..60000,1..2] of integer;
  num:array[0..50,0..50] of longint;
  tot,t1,t2:array[-50..50,0..20] of integer;
  d,p1,p2:array[-51..50,0..20,0..2000] of integer;
  need:array[-50..50] of integer;
  ans:array[0..20] of longint;
procedure cal(k1,a1,c:integer);
var
  i,j:integer;
begin
  if k1=0 then exit;
  i:=p1[c,k1,a1];j:=p2[c,k1,a1];
  inc(a,tot[i,j]);
  inc(b,tot[i,j]-j*i);
  inc(need[i],j);
  cal(k1-j,a1-(i+max)*j,c-1);
end;
begin
  fillchar(num,sizeof(num),0);
  fillchar(tot,sizeof(tot),$ff);
  fillchar(d,sizeof(d),$ff);
  d[-max-1,0,0]:=0;
  readln(n,k);
  for i:=1 to n do
  begin
    read(a,b);
    s[i,1]:=a;s[i,2]:=b;
    inc(num[a,b]);
  end;
  for i:=-max to max do
  begin
    a:=0;
    tot[i,0]:=0;
    for j:=max downto 0 do
    begin
      if j-i>max then continue;;
      if j-i<0 then break;
      a1:=a;j1:=1;
      inc(a,num[j,j-i]);
      if a>k then a:=k;
      while a1+j1<=a do
      begin
        tot[i,a1+j1]:=tot[i,a1+j1-1]+j;
        t1[i,a1+j1]:=j;
        t2[i,a1+j1]:=j1;
        inc(j1);
      end;
    end;
  end;
  for i:=-max to max do
    for j:=k downto 0 do
    begin
      if tot[i,j]=-1 then continue;
      for j1:=k downto j do
        for j2:=2000 downto (i+max)*j do
          if (d[i-1,j1-j,j2-(i+max)*j]<>-1) and (d[i,j1,j2]<d[i-1,j1-j,j2-(i+max)*j]+tot[i,j]) then
          begin
            d[i,j1,j2]:=d[i-1,j1-j,j2-(i+max)*j]+tot[i,j];
            p1[i,j1,j2]:=i;
            p2[i,j1,j2]:=j;
          end;
    end;
  a:=max*k;b:=0;
  while true do
  begin
    if d[max,k,a+b]<>-1 then
    begin
      a1:=a+b;
      break;
    end;
    if d[max,k,a-b]<>-1 then
    begin
      a1:=a-b;
      break;
    end;
    inc(b);
  end;
  a:=0;b:=0;
  fillchar(need,sizeof(need),0);
  cal(k,a1,max);
  ans[0]:=0;
  for i:=1 to n do
  begin
    a1:=s[i,1]-s[i,2];
    if need[a1]=0 then continue;
    if s[i,1]>t1[a1,need[a1]] then
    begin
      inc(ans[0]);
      ans[ans[0]]:=i;
    end;
    if (s[i,1]=t1[a1,need[a1]]) and (t2[a1,need[a1]]>0) then
    begin
      inc(ans[0]);
      ans[ans[0]]:=i;
      dec(t2[a1,need[a1]]);
    end;
  end;
  writeln(a,' ',b);
  for i:=1 to k do
  begin
    write(ans[i]);
    if i<>k then write(' ')
      else writeln;
  end;
end.
