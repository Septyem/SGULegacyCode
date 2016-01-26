const
  len:array[1..7] of integer=(2,2,2,2,3,3,3);
var
  x,i,j,j1,l,max,ns:longint;
  num:array[1..7] of longint;
  s:array[0..800,1..7] of longint;
  bl:array[1..800,1..14] of boolean;
  st:ansistring;
function cal(x:longint):longint;
var
  i:longint;
begin
  i:=1;
  while (i<7) and (1 shl (i-1)<>x) do
    inc(i);
  cal:=i;
end;
procedure back(t1,t2,t3:longint);
var
  i:longint;
begin
  if t1=0 then exit;
  if (t2<>1) and (s[t1,t2]=s[t1-1 shl (7-t2),t2-1]+1) then
  begin
    bl[t3+1 shl (7-t2),t2+7]:=true;
    back(t1-1 shl (7-t2),t2-1,t3+1 shl (7-t2));
  end;
  for i:=1 to 7 do
    if s[t1,t2]=s[t1-1 shl (7-t2),i]+len[t2] then
    begin
      bl[t3+1 shl (7-t2),t2]:=true;
      back(t1-1 shl (7-t2),i,t3+1 shl (7-t2));
    end;
end;
procedure print(t1:longint);
var
  i,n1:longint;
  sum,left:array[1..7] of integer;
begin
  if t1=0 then exit;
  for i:=1 to 7 do
  begin
    sum[i]:=0;
    n1:=t1;
    if bl[t1,i] then
    begin
      inc(sum[i]);
      dec(n1,1 shl (7-i));
      while (n1>0) and (sum[i]+i<=7) and bl[n1,i+sum[i]+7] do
      begin
        dec(n1,1 shl (7-i-sum[i]));
        inc(sum[i]);
      end;
    end;
    left[i]:=n1;
  end;
  if sum[1]>=2 then
  begin
    write('R1');
    for j:=2 to sum[1] do
      write('.');
    print(left[1]);
    exit;
  end;
  if ns<>0 then
  begin
    for i:=1 to ns do
      write('R1.');
    ns:=0;
  end;
  if sum[5]>=1 then
  begin
    write('R16');
    for j:=2 to sum[5] do
      write('.');
    print(left[5]);
    exit;
  end;
  if sum[1]=1 then
  begin
    write('R1');
    print(left[1]);
    exit;
  end;
  if sum[2]>=1 then
  begin
    write('R2');
    for j:=2 to sum[2] do
      write('.');
    print(left[2]);
    exit;
  end;
  if sum[6]>=1 then
  begin
    write('R32');
    for j:=2 to sum[6] do
      write('.');
    print(left[6]);
    exit;
  end;
  if sum[3]>=1 then
  begin
    write('R4');
    for j:=2 to sum[3] do
      write('.');
    print(left[3]);
    exit;
  end;
  if sum[7]>=1 then
  begin
    write('R64');
    for j:=2 to sum[7] do
      write('.');
    print(left[7]);
    exit;
  end;
  if sum[4]>=1 then
  begin
    write('R8');
    for j:=2 to sum[4] do
      write('.');
    print(left[4]);
    exit;
  end;
end;
begin
  fillchar(num,sizeof(num),0);
  readln(st);
  l:=length(st);
  for i:=1 to l do
    if (st[i]='R') or (st[i]='.') then
    begin
      if st[i]='.' then
      begin
        inc(num[cal(x)]);
        x:=x*2;
      end;
      if st[i]='R' then
      begin
        if i<>1 then
          inc(num[cal(x)]);
        x:=0;
      end;
    end else
      x:=x*10+ord(st[i])-48;
  if x<>0 then
    inc(num[cal(x)]);
  max:=0;
  for i:=1 to 7 do
    inc(max,num[i]*(1 shl (7-i)));
  ns:=0;
  if max>=400 then
  begin
    ns:=(max-400) div 96;
    dec(max,ns*96);
  end;
  fillchar(s,sizeof(s),$5f);
  for i:=1 to 7 do
  begin
    s[0,i]:=0;
    s[1 shl (7-i),i]:=len[i];
  end;
  for i:=1 to max do
    for j:=1 to 7 do
      if s[i,j]<>-1 then
      begin
        if j<>7 then
          if (i+1 shl (6-j)<=max) and (s[i+1 shl (6-j),j+1]>s[i,j]+1) then
            s[i+1 shl (6-j),j+1]:=s[i,j]+1;
        for j1:=1 to 7 do
          if (i+1 shl (7-j1)<=max) and (s[i+1 shl (7-j1),j1]>s[i,j]+len[j1]) then
            s[i+1 shl (7-j1),j1]:=s[i,j]+len[j1];
      end;
  fillchar(bl,sizeof(bl),false);
  j1:=3*max+1;
  for j:=1 to 7 do
    if s[max,j]<j1 then
      j1:=s[max,j];
  for j:=1 to 7 do
    if s[max,j]=j1 then
      back(max,j,0);
  print(max);
  for i:=1 to ns do
    write('R1.');
  writeln;
end.
