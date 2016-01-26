var
  n,i:longint;
  s:array[0..1000] of ansistring;
function compare(t:longint):boolean;
var
  i,l1,l2:longint;
begin
  l1:=length(s[0]);
  l2:=length(s[t]);
  if l1=l2 then
  begin
    i:=1;
    while (i<=l1) and (s[0,i]=s[t,i]) do
      inc(i);
    if i>l1 then
      compare:=true
    else if s[0,i]>s[t,i] then
           compare:=false
         else compare:=true;
  end else
    if l1<l2 then
      compare:=true
    else compare:=false;
end;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  i:=a;j:=b;r:=random(b-a)+a;
  s[0]:=s[r];s[r]:=s[a];
  while i<j do
  begin
    while (i<j) and compare(j) do
      dec(j);
    if i<j then
    begin
      s[i]:=s[j];
      inc(i);
    end;
    while (i<j) and not compare(i) do
      inc(i);
    if i<j then
    begin
      s[j]:=s[i];
      dec(j);
    end;
  end;
  s[i]:=s[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
procedure plus(a,b:ansistring;var c:ansistring);
var
  i,k,l1,l2:longint;
begin
  c:='';
  l1:=length(a);l2:=length(b);
  if l1<l2 then
  begin
    for i:=l1+1 to l2 do
      a:='0'+a;
    l1:=l2;
  end else
    for i:=l2+1 to l1 do
      b:='0'+b;
  k:=0;
  for i:=l1 downto 1 do
  begin
    k:=k+ord(a[i])+ord(b[i])-96;
    c:=chr(k mod 10+48)+c;
    k:=k div 10;
  end;
  if k<>0 then
    insert(chr(k+48),c,1);
end;
begin
  randomize;
  readln(n);
  for i:=1 to n do
    readln(s[i]);
  qsort(1,n);
  for i:=n downto 3 do
  begin
    plus(s[i-1],s[i-2],s[0]);
    if not compare(i) then
    begin
      writeln(s[i-2],' ',s[i-1],' ',s[i]);
      halt;
    end;
  end;
  writeln('0 0 0');
end.
