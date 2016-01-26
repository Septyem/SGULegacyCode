const
  zero=1e-7;
  nw=-10000;
var
  n,m,i,j,k,x,y:longint;
  tl,tr,tm,ans:double;
  a,b,p:array[1..50,1..50] of integer;
  w:array[0..50] of integer;
  s,d:array[1..50,1..50] of double;
procedure findway(s1,s2:integer);
begin
  if p[s1,s2]<>0 then
  begin
    findway(s1,p[s1,s2]);
    inc(w[0]);
    w[w[0]]:=p[s1,s2];
    findway(p[s1,s2],s2);
  end;
end;
begin
  readln(n,m);
  tl:=101;tr:=0;
  for i:=1 to m do
  begin
    read(x,y);
    read(a[x,y],b[x,y]);
    if a[x,y]/b[x,y]<tl then
      tl:=a[x,y]/b[x,y];
    if a[x,y]/b[x,y]>tr then
      tr:=a[x,y]/b[x,y];
  end;
  while abs(tl-tr)>zero do
  begin
    tm:=(tl+tr)/2;
    for i:=1 to n do
      for j:=1 to n do
      begin
        if a[i,j]<>0 then
          s[i,j]:=a[i,j]-tm*b[i,j]
        else s[i,j]:=nw;
        d[i,j]:=s[i,j];
      end;
    ans:=nw;
    for k:=1 to n do
    begin
      for i:=1 to k-1 do
        if s[i,k]>nw then
          for j:=1 to k-1 do
          begin
            if (s[k,j]>nw) and (d[j,i]>nw) and (s[i,k]+s[k,j]+d[j,i]>ans) then
              ans:=s[i,k]+s[k,j]+d[j,i];
            if (i=j) and (s[k,j]>nw) and (s[i,k]+s[k,j]>ans) then
              ans:=s[i,k]+s[k,j];
          end;
      for i:=1 to n do
        for j:=1 to n do
          if (i<>j) and (d[i,k]>nw) and (d[k,j]>nw) and (d[i,k]+d[k,j]>d[i,j]) then
            d[i,j]:=d[i,k]+d[k,j];
    end;
    if ans<0 then
      tr:=tm
    else tl:=tm;
  end;
  if abs(ans-nw)<zero then
  begin
    writeln(0);
    halt;
  end;
  tm:=tl;
  for i:=1 to n do
    for j:=1 to n do
    begin
      if a[i,j]<>0 then
        s[i,j]:=a[i,j]-tm*b[i,j]
      else s[i,j]:=nw;
      d[i,j]:=s[i,j];
    end;
  ans:=nw;
  fillchar(p,sizeof(p),0);
  for k:=1 to n do
  begin
    for i:=1 to k do
      for j:=1 to k do
        if (s[i,k]>nw) and (s[k,j]>nw) and (((d[j,i]>nw) and (s[i,k]+s[k,j]+d[j,i]>ans))
        or ((i=j) and (s[i,k]+s[k,j]>ans))) then
        begin
          if i<>j then
            ans:=s[i,k]+s[k,j]+d[j,i]
          else ans:=s[i,k]+s[k,j];
          w[0]:=2;
          w[1]:=i;w[2]:=k;
          if i<>j then
          begin
            inc(w[0]);
            w[3]:=j;
            findway(j,i);
          end;
        end;
    for i:=1 to n do
      for j:=1 to n do
        if (i<>j) and (d[i,k]>nw) and (d[k,j]>nw) and (d[i,k]+d[k,j]>d[i,j]) then
        begin
          d[i,j]:=d[i,k]+d[k,j];
          p[i,j]:=k;
        end;
  end;
  writeln(w[0]);
  for i:=1 to w[0] do
  begin
    write(w[i]);
    if i<>w[0] then write(' ')
      else writeln;
  end;
end.
