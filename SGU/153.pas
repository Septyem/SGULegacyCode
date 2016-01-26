const
  max=255;
var
  k,i,j,j1,n,m,x:longint;
  p:array[1..9] of integer;
  s:array[1..1000] of integer;
  bl:array[0..600] of integer;
begin
  readln(k);
  for i:=1 to k do
  begin
    fillchar(bl,sizeof(bl),$ff);
    readln(n,m);
    p[1]:=1;
    for j:=1 to m do
      read(p[j+1]);
    inc(m);
    s[1]:=0;x:=0;
    for j:=2 to 9 do
    begin
      s[j]:=0;
      for j1:=1 to m do
        if (j>p[j1]) and (s[j-p[j1]]=0) then
        begin
          s[j]:=1;
          break;
        end;
      x:=x shl 1+s[j];
    end;
    bl[x]:=1;j1:=9;
    while true do
    begin
      inc(j1);
      s[j1]:=0;
      for j:=1 to m do
        if s[j1-p[j]]=0 then
        begin
          s[j1]:=1;
          break;
        end;
      x:=x and max shl 1+s[j1];
      if bl[x]<>-1 then
        break;
      bl[x]:=j1-8;
    end;
    if n>bl[x] then
      n:=(n-bl[x]) mod (j1-8-bl[x])+1;
    if s[n]=0 then
      writeln('SECOND PLAYER MUST WIN')
    else writeln('FIRST PLAYER MUST WIN');
  end;
end.
