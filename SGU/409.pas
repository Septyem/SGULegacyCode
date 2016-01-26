var
  n,k,x,y,i,j,j1:longint;
  s:array[1..400,1..400] of char;
begin
  fillchar(s,sizeof(s),'.');
  readln(n,k);
  for i:=1 to n do
    for j:=1 to n do
    begin
      x:=j;y:=(i+j-2) mod n+1;
      for j1:=1 to k do
      begin
        s[(i-1)*n+x,(j-1)*n+y]:='*';
        inc(x);inc(y);
        if j1 mod n=0 then
          inc(y);
        if x>n then dec(x,n);
        if y>n then dec(y,n);
      end;
    end;
  for i:=1 to sqr(n) do
  begin
    for j:=1 to sqr(n) do
      write(s[i,j]);
    writeln
  end;
end.
