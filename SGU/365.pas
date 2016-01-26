var
  n,i,j,k:longint;
  ans:int64;
  s:array[0..20,-1..9] of int64;
begin
  fillchar(s,sizeof(s),0);
  readln(n);
  s[0,-1]:=1;
  for i:=0 to 9 do
  begin
    s[0,i]:=1;
    s[1,i]:=1;
  end;
  for i:=2 to n do
  begin
    for j:=1 to 9 do
      inc(s[i-1,j],s[i-1,j-1]);
    for j:=0 to 9 do
      s[i,j]:=s[i-1,j];
  end;
  for i:=1 to n do
    for j:=0 to 9 do
      for k:=1 to n-i+1 do
        inc(ans,s[k-1,j-1]*s[n-i-k+1,j-1]);
  writeln(ans);
end.
