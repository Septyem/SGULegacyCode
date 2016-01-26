var
  n,i,j,l,r,mid,ans:longint;
  m:array[1..500,0..500] of longint;
  a,a1,ans1:array[1..500] of integer;
  bl:array[1..500] of boolean;
  work:boolean;
function find(t:longint):boolean;
var
  i:integer;
begin
  for i:=1 to n do
    if bl[i] and (m[t,i]<=mid) then
    begin
      bl[i]:=false;
      if (a1[i]=0) or find(a1[i]) then
      begin
        a[t]:=i;
        a1[i]:=t;
        find:=true;
        exit;
      end;
    end;
  find:=false;
end;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      read(m[i,j]);
  l:=-1000000;r:=-l;
  while l<=r do
  begin
    mid:=(l+r) shr 1;
    fillchar(a,sizeof(a),0);
    fillchar(a1,sizeof(a1),0);
    work:=true;
    for i:=1 to n do
    begin
      fillchar(bl,sizeof(bl),true);
      if not find(i) then
      begin
        work:=false;
        break;
      end;
    end;
    if work then
    begin
      ans:=mid;
      ans1:=a;
      r:=mid-1;
    end else
      l:=mid+1;
  end;
  writeln(ans);
  for i:=1 to n do
    writeln(i,' ',ans1[i]);
end.
