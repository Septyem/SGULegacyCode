type
  crd=record
    x,y,z:double;
  end;
const
  zero=1e-6;
var
  n,i,j,p:integer;
  l,dl,d,p1:crd;
  s:array[1..50] of crd;
  r:array[1..50] of double;
  cos_ang,len,l1,l2,lenp,b,c,delta,t:double;
begin
  readln(n);
  for i:=1 to n do
    read(s[i].x,s[i].y,s[i].z,r[i]);
  read(l.x,l.y,l.z,dl.x,dl.y,dl.z);
  dl.x:=dl.x-l.x;
  dl.y:=dl.y-l.y;
  dl.z:=dl.z-l.z;
  for i:=1 to 11 do
  begin
    p:=0;
    for j:=1 to n do
    begin
      d.x:=s[j].x-l.x;
      d.y:=s[j].y-l.y;
      d.z:=s[j].z-l.z;
      len:=sqrt(sqr(d.x)+sqr(d.y)+sqr(d.z));
      l1:=sqrt(sqr(dl.x)+sqr(dl.y)+sqr(dl.z));
      cos_ang:=(d.x*dl.x+d.y*dl.y+d.z*dl.z)/(len*l1);
      b:=-2*len*cos_ang;
      c:=sqr(len)-sqr(r[j]);
      delta:=sqr(b)-4*c;
      if abs(delta)<zero then
        delta:=0;
      if delta<0 then
        continue;
      l2:=(-b-sqrt(delta))/2;
      if l2<zero then
        continue;
      if (p=0) or (l2<lenp) then
      begin
        p:=j;
        lenp:=l2;
        p1.x:=l.x+l2/l1*dl.x;
        p1.y:=l.y+l2/l1*dl.y;
        p1.z:=l.z+l2/l1*dl.z;
      end;
    end;
    if p=0 then
      break;
    if i<>11 then
    begin
      if i<>1 then write(' ');
      write(p);
      l.x:=p1.x;l.y:=p1.y;l.z:=p1.z;
      p1.x:=p1.x-s[p].x;
      p1.y:=p1.y-s[p].y;
      p1.z:=p1.z-s[p].z;
      len:=sqr(p1.x)+sqr(p1.y)+sqr(p1.z);
      t:=(dl.x*p1.x+dl.y*p1.y+dl.z*p1.z)/len;
      dl.x:=dl.x-2*t*p1.x;
      dl.y:=dl.y-2*t*p1.y;
      dl.z:=dl.z-2*t*p1.z;
    end else
      write(' etc.');
  end;
  writeln;
end.
