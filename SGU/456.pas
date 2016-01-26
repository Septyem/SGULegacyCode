const
  zero=1e-6;
var
  s,m,i:longint;
  l,r,mid,p,s1,bn:double;
begin
  readln(s,m,p);
  p:=p/100;
  l:=0;r:=1e9;
  while abs(l-r)>zero do
  begin
    mid:=(l+r)/2;
    s1:=s;
    for i:=1 to m do
    begin
      bn:=mid-s1*p;
      s1:=s1-bn;
      if s1<0 then break;
    end;
    if s1<0 then r:=mid
      else l:=mid;
  end;
  writeln(l:0:5);
end.
