var
  l1,l2,i,j,p,la,a1,be:longint;
  s1,s2:ansistring;
  d1:array[1..2001] of integer;
  d:array[0..2000,0..2000] of integer;
begin
  fillchar(d,sizeof(d),0);
  fillchar(d1,sizeof(d1),0);
  readln(s1);
  readln(s2);
  l1:=length(s1);
  l2:=length(s2);
  for i:=1 to l1 do
    for j:=1 to l2 do
      if s1[i]=s2[j] then
      begin
        d[i,j]:=d[i-1,j-1]+1;
        if d[i,j]>d1[i] then
          d1[i]:=d[i,j];
      end;
  la:=0;
  for i:=1 to l1 do
    if d1[i]>=d1[i+1] then
    begin
      be:=i-d1[i]+1;
      for j:=be to i do
      begin
        p:=0;
        while (j-p>=be) and (j+p<=i) and (s1[j+p]=s1[j-p]) do
          inc(p);
        if 2*p-1>la then
        begin
          la:=2*p-1;
          a1:=j-p+1;
        end;
        p:=0;
        while (j-p>=be) and (j+p+1<=i) and (s1[j+p+1]=s1[j-p]) do
          inc(p);
        if 2*p>la then
        begin
          la:=2*p;
          a1:=j-p+1;
        end;
      end;
    end;
  for i:=a1 to a1+la-1 do
    write(s1[i]);
  writeln;
end.
