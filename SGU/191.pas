var
  l,i,x,ln:longint;
  s:ansistring;
  a:array[1..30000] of shortint;
  c:char;
procedure work(x:integer);
begin
  if ln>l then
  begin
    writeln('NO');
    halt;
  end;
  if a[ln]=x then
  begin
    inc(ln);
    work(1-x);
    work(x);
  end else
    inc(ln);
end;
begin
  readln(c);
  if c='A' then
    x:=1
  else x:=0;
  readln(s);
  l:=length(s);
  for i:=1 to l do
    if s[i]='A' then
      a[i]:=1
    else a[i]:=0;
  ln:=1;
  work(x);
  if ln<>l+1 then
    writeln('NO')
  else writeln('YES');
end. 

