var
  n,k,i,j,t:integer;
  ans,a1,a2:int64;
  s,s1:array[0..10,0..100] of longint;
begin
  fillchar(s,sizeof(s),0);
  readln(n,k);
  s[0,0]:=1;
  for i:=1 to n do
  begin
    s[i,0]:=1;
    if odd(i) then
      t:=i
    else t:=i-1;
    for j:=1 to t do
      if j<=k then
        s[i,j]:=s[i-1,j-1]*(t-j+1)+s[i-1,j];
  end;
  if odd(n) then
  begin
    s1[0,0]:=1;
    for i:=1 to n-1 do
    begin
      s1[i,0]:=1;
      if odd(i) then
        t:=i+1
      else t:=i;
      for j:=1 to t do
        if j<=k then
          s1[i,j]:=s1[i-1,j-1]*(t-j+1)+s1[i-1,j];
    end;
  end else
    s1:=s;
  ans:=0;
  for i:=0 to k do
  begin
    a1:=s[n,i];
    a2:=s1[n div 2*2,k-i];
    inc(ans,a1*a2);
  end;
  writeln(ans);
end.

