var
  n,i,j,x,y,b,e:longint;
  sum:array[0..6,0..7] of longint;
  s:array[0..6,0..6,0..100] of integer;
  ans,f:array[1..100,1..2] of integer;
  bl:array[1..100] of boolean;
  find:boolean;
procedure search(a,b:longint);
var
  i,m1:integer;
begin
  if a>n then
  begin
    for i:=1 to n do
    begin
      write(ans[i,1],' ');
      if ans[i,2]=1 then writeln('+')
        else writeln('-');
    end;
    halt;
  end;
  for i:=0 to 6 do
    if sum[b,i]>0 then
    begin
      dec(sum[b,i]);
      dec(sum[i,b]);
      m1:=s[b,i,0];
      while not bl[s[b,i,s[b,i,0]]] do
        inc(s[b,i,0]);
      if f[s[b,i,s[b,i,0]],1]<>b then
      begin
        ans[a,1]:=s[b,i,s[b,i,0]];
        ans[a,2]:=-1;
        bl[ans[a,1]]:=false;
        search(a+1,f[ans[a,1],1]);
      end else
      begin
        ans[a,1]:=s[b,i,s[b,i,0]];
        ans[a,2]:=1;
        bl[ans[a,1]]:=false;
        search(a+1,f[ans[a,1],2]);
      end;
      bl[ans[a,1]]:=true;
      s[b,i,0]:=m1;
      inc(sum[b,i]);
      inc(sum[i,b]);
    end;
end;
begin
  fillchar(sum,sizeof(sum),0);
  fillchar(s,sizeof(s),0);
  readln(n);
  for i:=1 to n do
  begin
    readln(x,y);
    f[i,1]:=x;f[i,2]:=y;
    inc(sum[x,y]);
    s[x,y,sum[x,y]]:=i;
    inc(sum[y,x]);
    s[y,x,sum[y,x]]:=i;
  end;
  b:=-1;e:=-1;
  find:=true;
  for i:=0 to 6 do
  begin
    sum[i,7]:=0;
    for j:=0 to 6 do
    begin
      s[i,j,0]:=1;
      inc(sum[i,7],sum[i,j]);
    end;
    if odd(sum[i,7]) then
      if b=-1 then
      begin
        b:=i;
        find:=false;
      end else
        if e=-1 then
        begin
          e:=i;
          find:=true;
        end else
          find:=false;
  end;
  if find then
  begin
    if b=-1 then
      b:=0;
    while sum[b,7]=0 do inc(b);
    fillchar(bl,sizeof(bl),true);
    search(1,b);
  end;
  writeln('No solution');
end.