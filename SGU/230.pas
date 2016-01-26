var
  n,m,i,j,now,a,b:longint;
  li:array[1..100,1..100] of boolean;
  s,ans:array[1..100] of integer;
begin
  fillchar(li,sizeof(li),false);
  fillchar(s,sizeof(s),0);
  readln(n,m);
  for i:=1 to m do
  begin
    readln(a,b);
    if not li[a,b] then
      inc(s[b]);
    li[a,b]:=true;
  end;
  for i:=1 to n do
  begin
    now:=-1;
    for j:=1 to n do
      if s[j]=0 then
      begin
        now:=j;
        break;
      end;
    if now<0 then
    begin
      writeln('No solution');
      halt;
    end;
    ans[now]:=i;
    s[now]:=-1;
    for j:=1 to n do
      if li[now,j] then
        dec(s[j]);
  end;
  for i:=1 to n-1 do
    write(ans[i],' ');
  writeln(ans[n]);
end.
