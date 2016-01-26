var
  n,i,xb,yb,xw,yw,xbw,ybw,mxb,myb,tmp,xnow,y1,y2,step1,step2:longint;
procedure finish;
begin
  writeln('YES');
  writeln(i);
  halt;
end;
function cross(x1,y1,x2,y2:longint):boolean;
begin
  if x2>y2 then
  begin
    tmp:=x2;x2:=y2;y2:=tmp;
  end;
  if (y1<x2) or (y2<x1) then
    cross:=false
  else
    cross:=true;
end;
begin
  readln(n,xb,yb,xw,yw,xbw,ybw);
  if abs(yb-yw)>abs(xb-xw) then
  begin
    tmp:=xb;xb:=yb;yb:=tmp;
    tmp:=xw;xw:=yw;yw:=tmp;
    tmp:=xbw;xbw:=ybw;ybw:=tmp;
  end;
  if yb>yw then
    myb:=-1
  else myb:=1;
  if xb>xw then
    mxb:=-1
  else mxb:=1;
  step2:=abs(yb-yw);
  step1:=abs(xb-xw)-step2;
  for i:=1 to (step1+step2-2) div 2 do
  begin
    xnow:=xb+i*mxb;
    if i>step1 div 2 then
      y1:=yb+(i-step1)*myb
    else y1:=yb-i*myb;
    if i>step2+step1 div 2 then
      y2:=yb+(2*step2+step1-i)*myb
    else y2:=yb+i*myb;
    if y1<1 then y1:=1;
    if y1>n then y1:=n;
    if y2<1 then y2:=1;
    if y2>n then y2:=n;
    if (xnow>=xbw-i) and (xnow<=xbw+i) then
      if ((xnow=xbw-i) or (xnow=xbw+i)) and cross(ybw-i,ybw+i,y1,y2) or
      cross(ybw-i,ybw-i,y1,y2) or cross(ybw+i,ybw+i,y1,y2) then
        finish;
    xnow:=xw-i*mxb;
    if i>step1 then
      y1:=yw-(i-step1)*myb
    else y1:=yw+i*myb;
    if i>step2+step1 div 2 then
      y2:=yw-(2*step2+step1-i)*myb
    else y2:=yw-i*myb;
    if y1<1 then y1:=1;
    if y1>n then y1:=n;
    if y2<1 then y2:=1;
    if y2>n then y2:=n;
    if (xnow>=xbw-i) and (xnow<=xbw+i) then
      if ((xnow=xbw-i) or (xnow=xbw+i)) and cross(ybw-i,ybw+i,y1,y2) or
      cross(ybw-i,ybw-i,y1,y2) or cross(ybw+i,ybw+i,y1,y2) then
        finish;
  end;
  writeln('NO');
  writeln(step1+step2-1);
end.
