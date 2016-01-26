var
  i,j,b,l,lt,d1:longint;
  ans:int64;
  d:array[0..1,1..100] of longint;
  s,s1:ansistring;
begin
  fillchar(d,sizeof(d),0);
  readln(s);
  readln(s1);
  lt:=length(s);
  l:=length(s1);
  b:=0;ans:=0;d1:=0;
  for i:=1 to lt do
  begin
    b:=1-b;
    fillchar(d[b],sizeof(d[b]),0);
    for j:=l downto 2 do
      if (s[i]=s1[j]) and (d[1-b,j-1]<>0) then
      begin
        d[b,j]:=d[1-b,j-1];
        d[1-b,j-1]:=0;
      end else
        if d[1-b,j]<>0 then
          d[b,j]:=d[1-b,j];
    if s[i]=s1[1] then
      d[b,1]:=i
    else if d[1-b,1]<>0 then
      d[b,1]:=d[1-b,1];
    if d[b,l]>d1 then
      d1:=d[b,l];
    inc(ans,d1);
  end;
  writeln(ans);
end.
