const
  zero=1e-6;
var
  n,i,j:longint;
  v1,v2,min,tmp:double;
  x,y,ans:array[1..1000] of double;
function cal(a,b:longint):double;
var
  x1,y1:double;
begin
  x1:=x[b]-(y[a]-y[b])/(y[b-1]-y[b])*(x[b]-x[b-1]);
  y1:=y[a];
  cal:=(x1-x[a])/v2+sqrt(sqr(x1-x[b])+sqr(y1-y[b]))/v1;
end;
function cal1(a,b:longint):double;
var
  x1,y1:double;
begin
  x1:=x[b]+(y[a]-y[b])/(y[b+1]-y[b])*(x[b+1]-x[b]);
  y1:=y[a];
  cal1:=(x[a]-x1)/v2+sqrt(sqr(x1-x[b])+sqr(y1-y[b]))/v1;
end;
begin
  read(n,v1,v2);
  for i:=1 to n do
    read(x[i],y[i]);
  ans[1]:=0;
  for i:=2 to n do
  begin
    if i=n then
      n:=n;
    if (y[i-1]<y[i]) or (abs(y[i-1]-y[i])<zero) then
    begin
      ans[i]:=ans[i-1]+sqrt(sqr(x[i-1]-x[i])+sqr(y[i-1]-y[i]))/v1;
      continue;
    end;
    ans[i]:=1e10;
    min:=1e10;
    for j:=i-1 downto 1 do
    begin
      if (y[j]<min) and (abs(y[j]-min)>zero) then
      begin
        min:=y[j];
        if (min<y[i]) or (abs(y[i]-min)<zero) then
        begin
          tmp:=ans[j]+cal1(i,j);
          if tmp<ans[i] then
            ans[i]:=tmp;
          break;
        end;
        tmp:=ans[j]+cal(j,i);
        if tmp<ans[i] then
          ans[i]:=tmp;
      end;
    end;
  end;
  writeln(ans[n]:0:6);
end.
