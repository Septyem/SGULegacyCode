var
  b,n,ans,i,j,k:longint;
  s,a1:array[1..2000,1..2000] of integer;
  tmp:array[1..2000] of integer;
procedure dfs(t:integer);
var
  i,j:integer;
begin
  if t>n then
  begin
    if (tmp[n]<>0) or (n=1) then
    begin
      inc(ans);
      for i:=1 to n do
        a1[ans,i]:=tmp[i];
    end;
    exit;
  end;
  for i:=0 to b-1 do
    if (s[t-1,t]+tmp[1]*i*2) mod b=i then
    begin
      k:=0;tmp[t]:=i;
      s[t]:=s[t-1];
      for j:=1 to t-1 do
      begin
        if j+t-1>n then
          break;
        k:=k+i*tmp[j]*2+s[t,j+t-1];
        s[t,j+t-1]:=k mod b;
        k:=k div b;
      end;
      if t*2-1<=n then
      begin
        j:=t*2-1;
        inc(s[t,j],sqr(i)+k);
        while (j<n) and (s[t,j]>=b) do
        begin
          s[t,j+1]:=s[t,j+1]+s[t,j] div b;
          s[t,j]:=s[t,j] mod b;
          inc(j);
        end;
        if j=n then
          s[t,j]:=s[t,j] mod b;
      end;
      dfs(t+1);
    end;
end;
begin
  readln(b,n);
  ans:=0;
  for i:=0 to b-1 do
    if sqr(i) mod b=i then
    begin
      tmp[1]:=i;s[1,1]:=i;
      s[1,2]:=sqr(i) div b;
      dfs(2);
    end;
  writeln(ans);
  for i:=1 to ans do
  begin
    for j:=n downto 1 do
      if a1[i,j]>9 then
        write(chr(55+a1[i,j]))
      else write(a1[i,j]);
    writeln;
  end;
end.
