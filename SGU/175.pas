var
  n,q:longint;
function phi(m,k:longint):longint;
begin
  if m=1 then
  begin
    phi:=1;
    exit;
  end;
  if k>m shr 1 then
    phi:=phi((m+1) shr 1,m-k+1)
  else phi:=(m+1) shr 1+phi(m shr 1,m shr 1-k+1);
end;
begin
  readln(n,q);
  writeln(phi(n,q));
end.

