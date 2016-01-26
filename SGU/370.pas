var
  n,m,i,j,x,y:longint;
  ans:int64;
  pr,s:array[0..80000] of longint;
procedure dfs(t:longint);
begin
  if t>s[0] then
  begin
    inc(ans,y*(m div x));
    exit;
  end;
  dfs(t+1);
  x:=x*s[t];y:=-y;
  if x<=m then
    dfs(t+1);
  x:=x div s[t];
  y:=-y;
end;
begin
  readln(n,m);
  if n>m then
  begin
    x:=n;n:=m;m:=x;
  end;
  pr[0]:=1;pr[1]:=2;
  ans:=0;
  if n<>1 then inc(ans);
  if m<>1 then inc(ans);
  dec(m);
  for i:=1 to n-1 do
  begin
    s[0]:=0;
    if i>2 then
    begin
      x:=i;
      for j:=1 to pr[0] do
      begin
        if sqr(pr[j])>x then
          break;
        if x mod pr[j]=0 then
        begin
          inc(s[0]);
          s[s[0]]:=pr[j];
          while x mod pr[j]=0 do
            x:=x div pr[j];
        end;
      end;
      if x=i then
      begin
        inc(pr[0]);
        pr[pr[0]]:=i;
      end;
      if x<>1 then
      begin
        inc(s[0]);
        s[s[0]]:=x;
      end;
    end else
      if i=2 then
      begin
        inc(s[0]);
        s[1]:=2;
      end;
    y:=1;x:=1;
    dfs(1);
  end;
  writeln(ans);
end.
