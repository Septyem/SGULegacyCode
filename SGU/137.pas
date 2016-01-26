var
  n,k,i,j,p:longint;
  s,s1:array[1..1000] of longint;
procedure work(n,k:longint);
var
  g:longint;
begin
  if n=1 then
  begin
    s[1]:=k;
    exit;
  end;
  g:=k div n;
  work(k mod n,n-k mod n);
  s1:=s;p:=0;
  for i:=k mod n downto 1 do
  begin
    for j:=1 to s1[i] do
      s[p+j]:=g;
    inc(p,s1[i]+1);
    s[p]:=g+1;
  end;
end;
begin
  readln(n,k);
  work(n,k);
  for i:=1 to n-1 do
    write(s[i],' ');
  writeln(s[n]);
end.