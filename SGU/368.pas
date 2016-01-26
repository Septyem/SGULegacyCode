var
  n,m,i,j,k,sn,g,x,y,z:longint;
  s,s1:array[1..100] of integer;
  fa,sp:string;
  ans:boolean;
begin
  readln(n,m);
  for i:=1 to m do
    read(s[i]);
  readln;
  ans:=false;
  for i:=1 to n do
  begin
    readln(fa);
    read(k);
    for j:=1 to k do
      read(s1[j]);
    sn:=0;
    for j:=1 to k do
    begin
      read(x,y,z);
      if s[s1[j]]<x then
        inc(sn,2)
      else if s[s1[j]]<y then
        inc(sn,3)
      else if s[s1[j]]<z then
        inc(sn,4)
      else
        inc(sn,5);
    end;
    readln(k);
    for j:=1 to k do
    begin
      readln(sp);
      readln(g);
      if sn>=g then
      begin
        ans:=true;
        writeln(fa,' ',sp);
      end;
    end;
  end;
  if not ans then
    writeln('Army');
end.
