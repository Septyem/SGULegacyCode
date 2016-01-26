var
  n,i,j,max,a,p:longint;
  s,num,t,t1:array[0..100000] of longint;
procedure qsort(a,b:longint);
var
  i,j,r:longint;
begin
  r:=random(b-a)+a;
  i:=a;j:=b;
  t[0]:=t[r];t1[0]:=t1[r];
  t[r]:=t[a];t1[r]:=t1[a];
  while i<j do
  begin
    while (i<j) and (t[j]>t[0]) do
      dec(j);
    if i<j then
    begin
      t[i]:=t[j];t1[i]:=t1[j];
      inc(i);
    end;
    while (i<j) and (t[i]<t[0]) do
      inc(i);
    if i<j then
    begin
      t[j]:=t[i];t1[j]:=t1[i];
      dec(j);
    end;
  end;
  t[i]:=t[0];t1[i]:=t1[0];
  if i+1<b then qsort(i+1,b);
  if i-1>a then qsort(a,i-1);
end;
begin
  randomize;
  readln(n);
  max:=0;
  for i:=1 to n do
  begin
    read(s[i]);
    if s[i]>max then
      max:=s[i];
  end;
  fillchar(t,sizeof(t),0);
  fillchar(num,sizeof(num),0);
  a:=max;
  for i:=1 to n do
  begin
    while 2*s[i]<=max do
    begin
      inc(a);
      inc(num[i]);
      s[i]:=s[i]*2;
    end;
    t1[i]:=i;
    if s[i]<max then
    begin
      inc(a);
      t[i]:=2*s[i]-max;
    end;
  end;
  qsort(1,n);
  p:=1;
  while (p<=n) and (t[p]=0) do
    inc(p);
  writeln(a);
  if a<=1000 then
  begin
    for i:=1 to n do
      for j:=1 to num[i] do
        writeln('science mission to the planet ',i);
    for i:=1 to max do
    begin
      writeln('flying mission');
      while (p<=n) and (t[p]=i) do
      begin
        writeln('science mission to the planet ',t1[p]);
        inc(p);
      end;
    end;
  end;
end.
