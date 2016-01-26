var
  m:int64;
  a,b,g,t:longint;
function gcd(a,b:longint):longint;
begin
  if a mod b=0 then
    gcd:=b
  else gcd:=gcd(b,a mod b);
end;
begin
  readln(a,b);
  inc(b,a);
  if a=0 then g:=b
    else g:=gcd(b,a);
  a:=a div g;
  b:=b div g;
  t:=0;m:=1;
  while b>m do
  begin
    inc(t);
    m:=m shl 1;
  end;
  if m<>b then
    writeln(-1)
  else writeln(t);
end.