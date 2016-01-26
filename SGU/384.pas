var
  n,m,i,c,a,b,d1,d2:longint;
  s,p:array[1..100000] of longint;
  bl:array[1..100000] of boolean;
  r:array[1..200000,1..2] of longint;
  ch:char;
begin
  fillchar(s,sizeof(s),0);
  readln(n,m);
  for i:=1 to m do
  begin
    readln(a,b);
    r[i,1]:=a;r[i,2]:=b;
    inc(s[a]);
    inc(s[b]);
  end;
  c:=1;
  while (s[c]=2) and (n<>3) do
    inc(c);
  for i:=1 to m do
    if (r[i,1]<>c) and (r[i,2]<>c) then
    begin
      p[r[i,1]]:=r[i,2];
      p[r[i,2]]:=r[i,1];
    end;
  fillchar(bl,sizeof(bl),true);
  while not seekeof do
  begin
    read(ch);
    if ch<>'L' then
    begin
      for i:=1 to 5 do
        read(ch);
      readln(a);
      if (r[a,1]<>c) and (r[a,2]<>c) then
      begin
        p[r[a,1]]:=0;
        p[r[a,2]]:=0;
      end else
      if r[a,1]=c then
        bl[r[a,2]]:=false
      else bl[r[a,1]]:=false;
    end else
    begin
      for i:=1 to 5 do
        read(ch);
      readln(a,b);
      if a=b then
        writeln(0)
      else if p[a]=b then
        writeln(1)
      else begin
        if a=c then
          d1:=0
        else if bl[a] then
          d1:=1
        else if (p[a]<>0) and bl[p[a]] then
          d1:=2
        else d1:=-1;
        if b=c then
          d2:=0
        else if bl[b] then
          d2:=1
        else if (p[b]<>0) and bl[p[b]] then
          d2:=2
        else d2:=-1;
        if (d1<>-1) and (d2<>-1) then
          writeln(d1+d2)
        else writeln(-1);
      end;
    end;
  end;
end.
