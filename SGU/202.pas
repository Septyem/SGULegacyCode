const
  max=100000000;
var
  n,m,i:longint;
  d:array[1..65,1..65] of longint;
  s,p:array[1..65,0..65] of integer;
procedure calc(a,b:integer);
var
  i:integer;
  tmp:longint;
begin
  if d[a,b]>=0 then exit;
  tmp:=max;
  for i:=1 to a-1 do
  begin
    calc(i,b);
    calc(a-i,b-1);
    if 2*d[i,b]+d[a-i,b-1]<tmp then
    begin
      tmp:=2*d[i,b]+d[a-i,b-1];
      p[a,b]:=i;
    end;
  end;
  d[a,b]:=tmp;
end;
procedure print(c,x,y,b,e:integer);
var
  tmp:integer;
begin
  if x=1 then
  begin
    write('move ',c,' from ',b,' to ',e);
    if s[e,0]<>0 then
      write(' atop ',s[e,s[e,0]]);
    writeln;
    inc(s[e,0]);
    s[e,s[e,0]]:=c;
    dec(s[b,0]);
    exit;
  end;
  tmp:=1;
  while ((s[tmp,0]<>0) and (s[tmp,s[tmp,0]]<c)) or (tmp=b) or (tmp=e) do
    inc(tmp);
  print(c,p[x,y],y,b,tmp);
  print(c+p[x,y],x-p[x,y],y-1,b,e);
  print(c,p[x,y],y,tmp,e);
end;
begin
  fillchar(d,sizeof(d),$ff);
  readln(n,m);
  for i:=1 to n do
  begin
    d[i,1]:=0;
    d[i,2]:=max;
  end;
  for i:=2 to m do
    d[1,i]:=1;
  calc(n,m);
  fillchar(s,sizeof(s),0);
  s[1,0]:=n;
  for i:=1 to n do
    s[1,i]:=n-i+1;
  writeln(d[n,m]);
  print(1,n,m,1,m);
end.
