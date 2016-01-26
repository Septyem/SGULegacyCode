var
  n,n1,n2,i:longint;
  x1,x2,y1,y2,xo,yo,xp,yp,ang,t:extended;
  s:array[1..150,1..2] of extended;
begin
  read(n,n1,n2);
  if n1>n2 then
  begin
    i:=n1;n1:=n2;n2:=i;
    read(x2,y2,x1,y1);
  end else
    read(x1,y1,x2,y2);
  ang:=2*pi/n*(n2-n1);
  if ang>pi then
    ang:=2*pi-ang;
  xp:=(x1+x2)/2;yp:=(y1+y2)/2;
  ang:=(pi-ang)/2;
  t:=sin(ang)/cos(ang);
  if 2*(n2-n1)>n then
  begin
    xo:=xp+(y1-yp)*t;
    yo:=yp-(x1-xp)*t;
  end else
  begin
    xo:=xp-(y1-yp)*t;
    yo:=yp+(x1-xp)*t;
  end;
  s[n1,1]:=x1;s[n1,2]:=y1;
  x1:=x1-xo;y1:=y1-yo;
  ang:=2*pi/n;i:=n1;
  repeat
    inc(n1);
    if n1>n then
      n1:=1;
    xp:=x1*cos(ang)+y1*sin(ang);
    yp:=-x1*sin(ang)+y1*cos(ang);
    s[n1,1]:=xp+xo;
    s[n1,2]:=yo+yp;
    x1:=xp;y1:=yp;
  until i=n1;
  for i:=1 to n do
    writeln(s[i,1]+1e-8:0:6,' ',s[i,2]+1e-8:0:6);
end.
