var
  n,i,j,x,c,ct,cm:longint;
  s,bl:array[1..100,0..100] of integer;
  v,v1:array[1..100] of boolean;
procedure dfs(t:integer);
var
  i,cn:integer;
begin
  for i:=1 to s[t,0] do
    if bl[t,s[t,i]]=0 then
    begin
      if c=1 then c:=2
        else c:=1;
      x:=s[t,i];
      bl[t,x]:=c;
      bl[x,t]:=c;
      cn:=c;
      if not v[x] then
      begin
        v[x]:=true;
        dfs(x);
      end;
      c:=cn;
    end;
end;
procedure cdfs(t:longint);
var
  j:integer;
begin
  v1[t]:=true;
  for j:=1 to s[t,0] do
    if not v1[s[t,j]] then
      cdfs(s[t,j]);
end;
begin
  fillchar(bl,sizeof(bl),0);
  readln(n);
  for i:=1 to n do
  begin
    read(x);
    while x<>0 do
    begin
      inc(s[i,0]);
      s[i,s[i,0]]:=x;
      read(x);
    end;
  end;
  fillchar(v,sizeof(v),false);
  while true do
  begin
    i:=1;
    while (i<=n) and v[i] do
      inc(i);
    if i>n then
      break;
    fillchar(v1,sizeof(v1),false);
    cdfs(i);ct:=0;cm:=s[i,0];
    for j:=1 to n do
      if v1[j] then
      begin
        inc(ct);
        if s[j,0]>s[i,0] then
          i:=j;
        if s[j,0]<cm then
          cm:=s[j,0];
      end;
    if (cm=2) and (s[i,0]=cm) and odd(ct) then
    begin
      writeln('No solution');
      halt;
    end;
    dfs(i);
    v[i]:=true;
  end;
  for i:=1 to n do
  begin
    for j:=1 to s[i,0] do
      if bl[i,s[i,j]]<>0 then
        write(bl[i,s[i,j]],' ')
      else write('1 ');
    writeln(0);
  end;
end.
