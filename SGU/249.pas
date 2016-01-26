var
  n,m,i,j,tmp,t:longint;
  bi:array[1..21] of longint;
  x:array[1..1050000] of longint;
  bl:array[0..1050000] of boolean;
function max(a,b:longint):longint;
begin
  if a>b then
    max:=a
  else max:=b;
end;
begin
  readln(n,m);
  bi[1]:=1;
  for i:=2 to n+m do
    bi[i]:=bi[i-1]*2;
  t:=m+1;
  n:=1 shl n;
  m:=1 shl m;
  fillchar(bl,sizeof(bl),false);
  x[1]:=0;bl[0]:=true;
  for i:=2 to max(m,n) do
  begin
    j:=0;
    while true do
    begin
      inc(j);
      tmp:=x[i-1];
      if bi[j] and tmp<>0 then
        dec(tmp,bi[j])
      else inc(tmp,bi[j]);
      if not bl[tmp] then
      begin
        x[i]:=tmp;
        bl[tmp]:=true;
        break;
      end;
    end;
  end;
  for i:=1 to n do
    for j:=1 to m do
    begin
      write(x[i]*bi[t]+x[j]);
      if j<>m then write(' ')
        else writeln;
    end;
end.
