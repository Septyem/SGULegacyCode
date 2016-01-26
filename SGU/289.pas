var
  i,k:longint;
  d:array[0..20000] of integer;
  s,t:array[1..9] of integer;
  ch:char;
procedure dfs(x,p:longint);
var
  i:integer;
begin
  if d[x]<>-1 then
    exit;
  for i:=0 to 2 do
    if (s[3*i+1]<>0) and (s[3*i+1]=s[3*i+2]) and (s[3*i+1]=s[3*i+3]) then
    begin
      d[x]:=s[3*i+1];
      exit;
    end;
  for i:=1 to 3 do
    if (s[i]<>0) and (s[i]=s[3+i]) and (s[i]=s[6+i]) then
    begin
      d[x]:=s[i];
      exit;
    end;
  if (s[1]<>0) and (s[1]=s[5]) and (s[1]=s[9]) then
  begin
    d[x]:=s[1];
    exit;
  end;
  if (s[3]<>0) and (s[3]=s[5]) and (s[3]=s[7]) then
  begin
    d[x]:=s[3];
    exit;
  end;
  for i:=1 to 9 do
    if s[i]=0 then
    begin
      s[i]:=p;
      dfs(x+t[10-i]*p,3-p);
      if d[x+t[10-i]*p]=p then
        d[x]:=p;
      if (d[x+t[10-i]*p]=0) and (d[x]<>p) then
        d[x]:=0;
      if (d[x+t[10-i]*p]=3-p) and (d[x]<0) then
        d[x]:=3-p;
      s[i]:=0;
    end;
  if d[x]<0 then
    d[x]:=0;
end;
begin
  fillchar(d,sizeof(d),$ff);
  t[1]:=1;
  for i:=2 to 9 do
    t[i]:=t[i-1]*3;
  fillchar(s,sizeof(s),0);
  dfs(0,2);
  read(ch);
  while ch<>'Q' do
  begin
    k:=0;
    for i:=1 to 9 do
    begin
      while (ch<>'.') and (ch<>'X') and (ch<>'0') do
        read(ch);
      k:=k*3;
      if ch='0' then
        inc(k);
      if ch='X' then
        inc(k,2);
      read(ch);
    end;
    case d[k] of
      -1:writeln('Illegal position.');
      0:writeln('Game is a draw.');
      1:writeln('0 wins.');
      2:writeln('X wins.');
    end;
    while (ch<>'.') and (ch<>'X') and (ch<>'0') and (ch<>'Q') do
      read(ch);
  end;
end.
