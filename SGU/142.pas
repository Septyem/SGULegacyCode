var
  n,i,j,k,nn:longint;
  max:array[1..21] of longint;
  s,s1:array[1..500000] of boolean;
  bl:array[0..530000] of boolean;
  ch:char;
begin
  readln(n);
  for i:=1 to n do
  begin
    read(ch);
    if ch='a' then
      s[i]:=false
    else s[i]:=true;
  end;
  max[1]:=0;max[2]:=1;
  for i:=3 to 21 do
    max[i]:=max[i-1]*2;
  for i:=1 to 20 do
  begin
    fillchar(bl,sizeof(bl),false);
    k:=0;nn:=0;
    for j:=1 to i-1 do
    begin
      k:=k shl 1;
      if s[j] then
        inc(k);
    end;
    for j:=i to n do
    begin
      k:=(k and (max[i+1]-1)) shl 1;
      if s[j] then
        inc(k);
      if not bl[k] then
        inc(nn);
      bl[k]:=true;
    end;
    if nn<>max[i+2] then
      break;
  end;
  writeln(i);
  k:=0;
  while bl[k] do
    inc(k);
  for j:=i downto 1 do
  begin
    if odd(k) then
      s1[j]:=true
    else s1[j]:=false;
    k:=k shr 1;
  end;
  for j:=1 to i do
    if s1[j] then write('b')
      else write('a');
  writeln;
end.
