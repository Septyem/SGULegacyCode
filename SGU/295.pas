const
  max=10000;
  spe:array[1..18] of char=('A','B','C','E','H','K','M','O','P','T','X','a','c','e','o','p','x','y');
var
  q,c,i,j,l,ns,x:integer;
  k:longint;
  s:string;
  a1:int64;
  ans:array[0..10] of longint;
function cal(a,b:integer):int64;
var
  i:integer;
begin
  a1:=1;x:=2;
  for i:=a downto a-b+1 do
  begin
    a1:=a1*i;
    while (x<=b) and (a1 mod x=0) do
    begin
      a1:=a1 div x;
      inc(x);
    end;
  end;
  cal:=a1;
end;
begin
  readln(q,c);
  readln(s);
  ns:=1;l:=length(s);x:=1;
  if s[l]<>' ' then
    inc(ns);
  for i:=1 to length(s) do
    if s[i]=' ' then
    begin
      if x=0 then
      begin
        x:=1;
        inc(ns);
      end else
        dec(l);
    end else
      x:=0;
  x:=length(s);
  while s[x]=' ' do
  begin
    dec(l);
    dec(x);
  end;
  fillchar(ans,sizeof(ans),0);
  for i:=l to c do
    if i>=q then
    begin
      a1:=cal(ns+i-l-1,ns-1);
      j:=0;
      while a1<>0 do
      begin
        inc(j);
        a1:=a1+ans[j];
        ans[j]:=a1 mod max;
        a1:=a1 div max;
      end;
      if j>ans[0] then
        ans[0]:=j;
    end;
  k:=0;
  for i:=1 to length(s) do
    for j:=1 to 18 do
      if s[i]=spe[j] then
      begin
        for l:=1 to ans[0] do
        begin
          k:=k+ans[l]*2;
          ans[l]:=k mod max;
          k:=k div max;
        end;
        if k<>0 then
        begin
          inc(ans[0]);
          ans[ans[0]]:=k;
          k:=0;
        end;
        break;
      end;
  if ans[0]<>0 then
  begin
    j:=1;
    dec(ans[j]);
    while ans[j]<0 do
    begin
      dec(ans[j+1]);
      inc(ans[j],max);
      inc(j);
    end;
    if (ans[0]>1) and (ans[ans[0]]=0) then
      dec(ans[0]);
  end else
    ans[0]:=1;
  write(ans[ans[0]]);
  for i:=ans[0]-1 downto 1 do
    write(ans[i] div 1000,ans[i] div 100 mod 10,ans[i] div 10 mod 10,ans[i] mod 10);
  writeln;
end.
