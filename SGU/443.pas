var
  a,b,va,vb,max,i,j,lp:longint;
  p:array[1..900000] of longint;
  bl:array[1..900000] of boolean;
  get:boolean;
begin
  readln(a,b);
  if a>b then max:=a
    else max:=b;
  lp:=1;p[lp]:=2;
  for i:=3 to max do
  begin
    get:=true;
    for j:=1 to lp do
    begin
      if sqr(p[j])>i then
        break;
      if i mod p[j]=0 then
      begin
        get:=false;
        break;
      end;
    end;
    if get then
    begin
      inc(lp);
      p[lp]:=i;
    end;
  end;
  va:=0;vb:=0;
  fillchar(bl,sizeof(bl),false);
  for i:=1 to lp do
    if a mod p[i]=0 then
      bl[i]:=true;
  j:=lp;
  while not bl[j] do
    dec(j);
  va:=p[j];
  for i:=j-1 downto 1 do
    if bl[i] then
      dec(va,p[i]);
  fillchar(bl,sizeof(bl),false);
  for i:=1 to lp do
    if b mod p[i]=0 then
      bl[i]:=true;
  j:=lp;
  while not bl[j] do
    dec(j);
  vb:=p[j];
  for i:=j-1 downto 1 do
    if bl[i] then
      dec(vb,p[i]);
  if vb>va then writeln('b')
    else writeln('a');
end.
