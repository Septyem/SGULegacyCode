const
  num:array[0..40] of longint=(1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, 56,
  77, 101, 135, 176, 231, 297, 385, 490, 627, 792, 1002, 1255, 1575, 1958,
  2436, 3010, 3718, 4565, 5604, 6842, 8349, 10143, 12310, 14883, 17977,
  21637, 26015, 31185, 37338);
var
  n,ans,f,l,r:int64;
  i,sum:longint;
begin
  readln(n);
  l:=1;r:=n;
  while l<r do
  begin
    f:=(l+r+1) shr 1;
    if (f>1e6) or (f*f>n) then
      r:=f-1
    else l:=f;
  end;
  f:=l;
  ans:=1;
  for i:=2 to f do
  begin
    sum:=0;
    while n mod i=0 do
    begin
      n:=n div i;
      inc(sum);
    end;
    ans:=ans*num[sum];
  end;
  writeln(ans);
end.
