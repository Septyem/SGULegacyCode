var
  n,k,i,j,x,m:longint;
  a1,s,s1,p,p1:array[0..5000] of longint;
  bl,bl1:array[0..100] of boolean;
procedure qsort(a,b:longint);
var
  i,j,m:longint;
begin
  i:=a;j:=b;m:=s1[a+random(b-a)];
  repeat
    while s1[i]<m do inc(i);
    while s1[j]>m do dec(j);
    if i<=j then
    begin
      s1[0]:=s1[i];s1[i]:=s1[j];s1[j]:=s1[0];
      p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
      inc(i);dec(j);
    end;
  until i>j;
  if i<b then qsort(i,b);
  if j>a then qsort(a,j);
end;
begin
  fillchar(bl,sizeof(bl),true);
  bl1:=bl;
  readln(n,k);
  for i:=1 to k do
  begin
    p[i]:=i;
    read(s[i]);
  end;
  s1:=s;
  qsort(1,k);
  for i:=1 to k do
    p1[p[i]]:=i;
  a1[0]:=0;s1[0]:=1;
  m:=0;
  for i:=1 to n do
  begin
    if i mod 100=0 then
    begin
      bl1:=bl;
      fillchar(bl,sizeof(bl),true);
    end;
    if bl1[i mod 100] then
    begin
      inc(a1[0]);
      while (s1[0]<=k) and (a1[0]=s1[s1[0]]) do
      begin
        a1[s1[0]]:=i;
        inc(s1[0]);
      end;
    end;
    if i mod 10=0 then
      if i mod 100=0 then
        if i mod 1000=0 then
          if i mod 10000=0 then
            if i mod 100000=0 then
              if i mod 1000000=0 then
                if i mod 10000000=0 then
                  dec(m,61) else
                dec(m,52) else
              dec(m,43) else
            dec(m,34) else
          dec(m,25) else
        dec(m,16) else
      dec(m,7) else
    inc(m,2);
    if m div 100>i div 100 then
      bl[m mod 100]:=false
    else bl1[m mod 100]:=false;
  end;
  writeln(a1[0]);
  for i:=1 to k-1 do
    write(a1[p1[i]],' ');
  writeln(a1[p1[k]]);
end.