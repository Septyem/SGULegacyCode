const
  max=1000;
var
  n,t,i,j,j1,d:longint;
  a,l,v:array[1..20] of longint;
function check(j,j1:integer):boolean;
begin
  if v[j]>0 then
  begin
    d:=l[j1]-l[j];
    if d<=0 then inc(d,max);
    if v[j]-v[j1]>=d then
      check:=true
    else check:=false;
  end else
  begin
    d:=l[j]-l[j1];
    if d<=0 then inc(d,max);
    if v[j1]-v[j]>=d then
      check:=true
    else check:=false;
  end;
end;
begin
  fillchar(a,sizeof(a),0);
  readln(n,t);
  for i:=1 to n do
    read(l[i]);
  for i:=1 to n do
    read(v[i]);
  for i:=1 to t do
  begin
    for j:=1 to n do
    begin
      for j1:=j+1 to n do
        if (v[j]*v[j1]<0) and check(j,j1) then
        begin
          inc(a[j]);
          inc(a[j1]);
        end;
      l[j]:=(l[j]+v[j]+max) mod max;;
    end;
  end;
  for i:=1 to n-1 do
    write(a[i],' ');
  writeln(a[n]);
end.