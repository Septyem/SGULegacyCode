var
  n,k:integer;
  ans:longint;
  bl:array[1..10] of boolean;
  b1,b2:array[1..19] of boolean;
procedure dfs(t,k:integer);
var
  i:integer;
begin
  if k=0 then
  begin
    inc(ans);
    exit;
  end;
  if n-t+1<k then
    exit;
  for i:=1 to n do
    if bl[i] and b1[t+i-1] and b2[t-i+10] then
    begin
      bl[i]:=false;
      b1[t+i-1]:=false;
      b2[t-i+10]:=false;
      dfs(t+1,k-1);
      bl[i]:=true;
      b1[t+i-1]:=true;
      b2[t-i+10]:=true;
    end;
  dfs(t+1,k);
end;
begin
  fillchar(bl,sizeof(bl),true);
  fillchar(b1,sizeof(b1),true);
  fillchar(b2,sizeof(b2),true);
  readln(n,k);
  ans:=0;
  dfs(1,k);
  writeln(ans);
end.
