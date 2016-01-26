var
  n,i,j,j1,n1,nt,x,y:integer;
  s:array[1..20,1..20] of char;
  pt,pf:array[1..400] of integer;
  v:array[1..400] of boolean;
  p:array[0..400] of integer;
  ans:array[1..20,1..20] of boolean;
  get:boolean;
procedure succeed;
var
  i,j:integer;
begin
  writeln('YES');
  for i:=1 to n do
  begin
    for j:=1 to n do
      if ans[i,j] then
        write('1')
      else write('0');
    writeln;
  end;
  halt;
end;
procedure failed;
begin
  writeln('NO');
  halt;
end;
procedure dfs(t,t1:integer);
begin
  v[t]:=true;
  if (pt[t]=0) or (pt[t]=p[j1]) then
  begin
    if odd(t1) then
      get:=false;
  end else
    dfs(pt[t],t1+1);
  if get and odd(t1) then
  begin
    x:=(t-1) div n+1;
    y:=(t-1) mod n+1;
    ans[x,y]:=true;
    inc(n1);
  end;
end;
begin
  readln(n);
  nt:=0;
  for i:=1 to n do
  begin
    for j:=1 to n do
    begin
      read(s[i,j]);
      if s[i,j]='1' then
      begin
        inc(nt);
        p[nt]:=(i-1)*n+j;
      end;
    end;
    readln;
  end;
  if odd(nt) then failed;
  p[0]:=nt;nt:=nt div 2;
  for i:=-n to n do
    for j:=-n to n do
    begin
      get:=true;
      fillchar(ans,sizeof(ans),false);
      fillchar(v,sizeof(v),false);
      fillchar(pt,sizeof(pt),0);
      fillchar(pf,sizeof(pf),0);
      n1:=0;
      for j1:=1 to p[0] do
      begin
        x:=(p[j1]-1) div n+1;
        y:=(p[j1]-1) mod n+1;
        if (x+i>0) and (x+i<=n) and (y+j>0) and (y+j<=n) then
          if s[x+i,y+j]='1' then
          begin
            pt[p[j1]]:=(x+i-1)*n+y+j;
            inc(pf[(x+i-1)*n+y+j]);
          end;
      end;
      for j1:=1 to p[0] do
        if pf[p[j1]]=0 then
          dfs(p[j1],1);
      for j1:=1 to p[0] do
        if not v[p[j1]] then
          dfs(p[j1],1);
      if n1<>nt then
        get:=false;
      if get then
        succeed;
      get:=true;
      fillchar(ans,sizeof(ans),false);
      fillchar(v,sizeof(v),false);
      fillchar(pt,sizeof(pt),0);
      fillchar(pf,sizeof(pf),0);
      n1:=0;
      for j1:=1 to p[0] do
      begin
        y:=n-(p[j1]-1) div n;
        x:=(p[j1]-1) mod n+1;
        if (x+i>0) and (x+i<=n) and (y+j>0) and (y+j<=n) then
          if s[x+i,y+j]='1' then
          begin
            pt[p[j1]]:=(x+i-1)*n+y+j;
            inc(pf[(x+i-1)*n+y+j]);
          end;
      end;
      for j1:=1 to p[0] do
        if pf[p[j1]]=0 then
          dfs(p[j1],1);
      for j1:=1 to p[0] do
        if not v[p[j1]] then
          dfs(p[j1],1);
      if n1<>nt then
        get:=false;
      if get then
        succeed;
      get:=true;
      fillchar(ans,sizeof(ans),false);
      fillchar(v,sizeof(v),false);
      fillchar(pt,sizeof(pt),0);
      fillchar(pf,sizeof(pf),0);
      n1:=0;
      for j1:=1 to p[0] do
      begin
        y:=(p[j1]-1) div n+1;
        x:=n-(p[j1]-1) mod n;
        if (x+i>0) and (x+i<=n) and (y+j>0) and (y+j<=n) then
          if s[x+i,y+j]='1' then
          begin
            pt[p[j1]]:=(x+i-1)*n+y+j;
            inc(pf[(x+i-1)*n+y+j]);
          end;
      end;
      for j1:=1 to p[0] do
        if pf[p[j1]]=0 then
          dfs(p[j1],1);
      for j1:=1 to p[0] do
        if not v[p[j1]] then
          dfs(p[j1],1);
      if n1<>nt then
        get:=false;
      if get then
        succeed;
      get:=true;
      fillchar(ans,sizeof(ans),false);
      fillchar(v,sizeof(v),false);
      fillchar(pt,sizeof(pt),0);
      fillchar(pf,sizeof(pf),0);
      n1:=0;
      for j1:=1 to p[0] do
      begin
        x:=n-(p[j1]-1) div n;
        y:=n-(p[j1]-1) mod n;
        if (x+i>0) and (x+i<=n) and (y+j>0) and (y+j<=n) then
          if s[x+i,y+j]='1' then
          begin
            pt[p[j1]]:=(x+i-1)*n+y+j;
            inc(pf[(x+i-1)*n+y+j]);
          end;
      end;
      for j1:=1 to p[0] do
        if pf[p[j1]]=0 then
          dfs(p[j1],1);
      for j1:=1 to p[0] do
        if not v[p[j1]] then
          dfs(p[j1],1);
      if n1<>nt then
        get:=false;
      if get then
        succeed;
    end;
  failed;
end.
