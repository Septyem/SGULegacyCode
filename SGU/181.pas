var
  f,a,b,c,m,k,i:int64;
  s:array[0..10000] of integer;
begin
  fillchar(s,sizeof(s),$ff);
  readln(f,a,b,c,m,k);
  i:=0;
  while s[f]=-1 do
  begin
    s[f]:=i;
    inc(i);
    f:=(f*f*a+f*b+c) mod m;
  end;
  if k>=i then
    k:=(k-s[f]) mod (i-s[f])+s[f];
  f:=0;
  while s[f]<>k do
    inc(f);
  writeln(f);
end.


