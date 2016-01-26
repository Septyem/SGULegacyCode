var
  m,p,ln,i,j,j1,j2,k,ans,c:longint;
  n:array[1..400] of boolean;
  s,s1:array[0..400] of integer;
  d:array[1..400,0..33,0..33] of longint;
  da:array[0..1,0..33,0..33] of longint;
  ch:char;
begin
  s[0]:=0;
  read(ch);
  while ch<>' ' do
  begin
    inc(s[0]);
    s1[s[0]]:=ord(ch)-48;
    read(ch);
  end;
  for i:=1 to s[0] do
    s[i]:=s1[s[0]-i+1];
  readln(m,p);
  if (s[0]=1) and (s[1]=1) then
  begin
    writeln(1 shl m);
    halt;
  end;
  fillchar(n,sizeof(n),false);
  ln:=0;
  while s[0]<>0 do
  begin
    inc(ln);
    if odd(s[1]) then
      n[ln]:=true
    else n[ln]:=false;
    for i:=s[0] downto 1 do
    begin
      if odd(s[i]) and (i<>1) then
        inc(s[i-1],10);
      s[i]:=s[i] shr 1;
    end;
    while (s[0]>0) and (s[s[0]]=0) do
      dec(s[0]);
  end;
  j:=1;
  while not n[j] do
    inc(j);
  n[j]:=false;
  for i:=j-1 downto 1 do
    n[i]:=true;
  for i:=0 to 1 shl m-1 do
    for j:=0 to 1 shl m-1 do
    begin
      d[1,i,j]:=1;
      for j1:=1 to m-1 do
        if ((i and (1 shl (j1-1))<>0) and (j and (1 shl (j1-1))<>0) and
          (i and (1 shl j1)<>0) and (j and (1 shl j1)<>0)) or
          ((i and (1 shl (j1-1))=0) and (j and (1 shl (j1-1))=0) and
           (i and (1 shl j1)=0) and (j and (1 shl j1)=0)) then
        begin
          d[1,i,j]:=0;
          break;
        end;
    end;
  for i:=2 to ln do
    for j:=0 to 1 shl m-1 do
      for j1:=0 to 1 shl m-1 do
      begin
        k:=0;
        for j2:=0 to 1 shl m-1 do
        begin
          inc(k,d[i-1,j,j2]*d[i-1,j2,j1]);
          if k>=p then
            k:=k mod p;
        end;
        d[i,j,j1]:=k;
      end;
  j:=1;
  while not n[j] do
    inc(j);
  for j1:=0 to 1 shl m-1 do
    for j2:=0 to 1 shl m-1 do
      da[0,j1,j2]:=d[j,j1,j2];
  c:=0;
  for i:=j+1 to ln do
    if n[i] then
    begin
      c:=1-c;
      for j:=0 to 1 shl m-1 do
        for j1:=0 to 1 shl m-1 do
        begin
          k:=0;
          for j2:=0 to 1 shl m-1 do
          begin
            inc(k,da[1-c,j,j2]*d[i,j2,j1]);
            if k>=p then
              k:=k mod p;
          end;
          da[c,j,j1]:=k;
        end;
    end;
  ans:=0;
  for j:=0 to 1 shl m-1 do
    for j1:=0 to 1 shl m-1 do
    begin
      inc(ans,da[c,j,j1]);
      if ans>=p then
        ans:=ans mod p;
    end;
  writeln(ans);
end.
