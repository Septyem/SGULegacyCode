var
  n,k,i:integer;
  ans:longint;
begin
  readln(n,k);
  if k<=n then
  begin
    ans:=1;
    for i:=n downto n-k+1 do
      ans:=ans*i;
    for i:=k downto 1 do
      ans:=ans div i;
    for i:=n downto n-k+1 do
      ans:=ans*i;
  end else
    ans:=0;
  writeln(ans);
end. 
