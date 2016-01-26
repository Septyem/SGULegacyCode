var
  n,i,j,j1,num,x:longint;
  d,d1:array[1..200,1..201] of integer;
  ans,p,a1:array[1..200] of integer;
  get:boolean;
begin
  fillchar(ans,sizeof(ans),0);
  fillchar(d,sizeof(d),0);
  fillchar(d1,sizeof(d1),0);
  readln(n);
  for i:=1 to n do
  begin
    read(num);
    for j:=1 to num do
    begin
      read(x);
      d[x,i]:=1;
      d1[x,i]:=1;
    end;
  end;
  for i:=1 to n do
  begin
    read(x);
    d[i,n+1]:=x;
    d1[i,n+1]:=1-x;
  end;
  get:=true;
  fillchar(p,sizeof(p),$ff);
  for i:=1 to n do
  begin
    if not get then
      break;
    for j:=1 to n do
      if d[i,j]=1 then
      begin
        p[i]:=j;
        break;
      end;
    if p[i]=-1 then
    begin
      if d[i,n+1]<>0 then
        get:=false;
      continue;
    end;
    for j:=i+1 to n do
      if d[j,p[i]]=1 then
        for j1:=1 to n+1 do
          d[j,j1]:=d[j,j1] xor d[i,j1];
  end;
  if get then
  begin
    for i:=n downto 1 do
    begin
      if p[i]=-1 then
        continue;
      ans[p[i]]:=d[i,n+1];
      for j:=1 to n do
        if (j<>p[i]) and (d[i,j]=1) then
          ans[p[i]]:=ans[p[i]] xor ans[j];
    end;
    num:=0;
    for i:=1 to n do
      if ans[i]=1 then
      begin
        inc(num);
        a1[num]:=i;
      end;
    writeln(num);
    for i:=1 to num do
    begin
      write(a1[i]);
      if i<>num then write(' ')
        else writeln;
    end;
    halt;
  end;
  get:=true;
  fillchar(p,sizeof(p),$ff);
  for i:=1 to n do
  begin
    if not get then
      break;
    for j:=1 to n do
      if d1[i,j]=1 then
      begin
        p[i]:=j;
        break;
      end;
    if p[i]=-1 then
    begin
      if d1[i,n+1]<>0 then
        get:=false;
      continue;
    end;
    for j:=i+1 to n do
      if d1[j,p[i]]=1 then
        for j1:=1 to n+1 do
          d1[j,j1]:=d1[j,j1] xor d1[i,j1];
  end;
  if get then
  begin
    for i:=n downto 1 do
    begin
      if p[i]=-1 then
        continue;
      ans[p[i]]:=d1[i,n+1];
      for j:=1 to n do
        if (j<>p[i]) and (d1[i,j]=1) then
          ans[p[i]]:=ans[p[i]] xor ans[j];
    end;
    num:=0;
    for i:=1 to n do
      if ans[i]=1 then
      begin
        inc(num);
        a1[num]:=i;
      end;
    writeln(num);
    for i:=1 to num do
    begin
      write(a1[i]);
      if i<>num then write(' ')
        else writeln;
    end;
  end else
    writeln(-1);
end.
