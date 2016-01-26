const
  mx:array[1..4] of integer=(1,0,-1,0);
  my:array[1..4] of integer=(0,1,0,-1);
var
  n,m,i,j,x,y,h,t:longint;
  s:array[1..200,1..200] of integer;
  v:array[0..201,0..201] of boolean;
  q:array[1..40000,1..2] of integer;
begin
  fillchar(v,sizeof(v),false);
  readln(n,m);
  h:=0;t:=0;
  for i:=1 to n do
    for j:=1 to m do
    begin
      read(s[i,j]);
      s[i,j]:=5-s[i,j];
      if i=1 then
        dec(s[i,j]);
      if i=n then
        dec(s[i,j]);
      if j=1 then
        dec(s[i,j]);
      if j=m then
        dec(s[i,j]);
      if s[i,j]=0 then
      begin
        inc(t);
        q[t,1]:=i;
        q[t,2]:=j;
      end else
        v[i,j]:=true;
    end;
  while h<t do
  begin
    inc(h);
    x:=q[h,1];y:=q[h,2];
    for i:=1 to 4 do
      if v[x+mx[i],y+my[i]] then
      begin
        dec(s[x+mx[i],y+my[i]]);
        if s[x+mx[i],y+my[i]]=0 then
        begin
          v[x+mx[i],y+my[i]]:=false;
          inc(t);
          q[t,1]:=x+mx[i];
          q[t,2]:=y+my[i];
        end;
      end;
  end;
  if t=n*m then
  begin
    for i:=1 to n*m do
      writeln(q[i,1],' ',q[i,2]);
  end else
    writeln('No solution');
end.
