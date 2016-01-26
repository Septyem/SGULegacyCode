var
  i,j,k,p,l:longint;
  s:array[1..1002] of char;
  bl:array[0..1001] of boolean;
  next:array[0..1001] of integer;
begin
  l:=0;
  repeat
    inc(l);
    read(s[l]);
  until s[l]=' ';
  dec(l);
  readln(k);
  for i:=0 to l do
    next[i]:=i+1;
  fillchar(bl,sizeof(bl),true);
  for i:=1 to k do
  begin
    p:=next[0];
    while (p<=l) and (s[p]>=s[next[p]]) do
      p:=next[p];
    if p>l then
    begin
      for j:=i to k do
      begin
        dec(p);
        while not bl[p] do
          dec(p);
        bl[p]:=false;
      end;
      break;
    end;
    bl[p]:=false;
    j:=p;
    while not bl[p] do
      inc(p);
    while not bl[j] do
      dec(j);
    next[j]:=p;
  end;
  for i:=1 to l do
    if bl[i] then
      write(s[i]);
  writeln;
end.
