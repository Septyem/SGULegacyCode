var
  n,i,j,a,b,b1,l,r:longint;
  s,s1,s2,p:array[1..600,1..600] of integer;
  ans:array[1..600,1..600] of longint;
  t,p1,m2:array[1..600] of integer;
  get:boolean;
function lowbit(x:longint):longint;
begin
  lowbit:=x and (x xor (x-1));
end;
procedure failed;
begin
  writeln(0);
  halt;
end;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      read(s[i,j]);
  for i:=1 to n do
  begin
    fillchar(t,sizeof(t),0);
    for j:=n downto 1 do
    begin
      b:=n;a:=0;
      while b>0 do
      begin
        inc(a,t[b]);
        dec(b,lowbit(b));
      end;
      if n-a<s[j,i]+1 then
        failed;
      s1[j,i]:=n;
      l:=1;r:=n;
      while l<r do
      begin
        b:=(l+r) shr 1;
        a:=0;
        while b>0 do
        begin
          inc(a,t[b]);
          dec(b,lowbit(b));
        end;
        b:=(l+r) shr 1;
        if b-a>=s[j,i]+1 then
        begin
          s1[j,i]:=b;
          r:=b;
        end else
          l:=b+1;
      end;
      b:=s1[j,i];
      while b<=n do
      begin
        inc(t[b]);
        inc(b,lowbit(b));
      end;
    end;
  end;
  for i:=1 to n do
    for j:=1 to n do
      read(s[i,j]);
  for i:=1 to n do
  begin
    fillchar(t,sizeof(t),0);
    for j:=n downto 1 do
    begin
      b:=n;a:=0;
      while b>0 do
      begin
        inc(a,t[b]);
        dec(b,lowbit(b));
      end;
      if n-a<s[i,j]+1 then
        failed;
      s2[i,j]:=n;
      l:=1;r:=n;
      while l<r do
      begin
        b:=(l+r) shr 1;
        a:=0;
        while b>0 do
        begin
          inc(a,t[b]);
          dec(b,lowbit(b));
        end;
        b:=(l+r) shr 1;
        if b-a>=s[i,j]+1 then
        begin
          s2[i,j]:=b;
          r:=b;
        end else
          l:=b+1;
      end;
      b:=s2[i,j];
      while b<=n do
      begin
        inc(t[b]);
        inc(b,lowbit(b));
      end;
    end;
  end;
  for i:=1 to n do
  begin
    fillchar(t,sizeof(t),0);
    for j:=1 to n do
    begin
      if (s1[j,i]>n) or (s1[j,i]<=0) or (t[s1[j,i]]<>0) then
        failed;
      t[s1[j,i]]:=j;
    end;
    p1[i]:=t[1];
    for j:=1 to n-1 do
      p[t[j],i]:=t[j+1];
    m2[i]:=1;
  end;
  a:=sqr(n);
  while a>0 do
  begin
    get:=false;
    for j:=1 to n do
      if (p1[j]<>0) and (s2[p1[j],j]=m2[p1[j]]) then
      begin
        get:=true;
        ans[p1[j],j]:=a;
        dec(a);
        inc(m2[p1[j]]);
        p1[j]:=p[p1[j],j];
      end;
    if not get then
      failed;
  end;
  for i:=1 to n do
  begin
    for j:=1 to n-1 do
      write(ans[i,j],' ');
    writeln(ans[i,n]);
  end;
end.
