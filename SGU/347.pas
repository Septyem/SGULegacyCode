var
  n,i,j,p,a:longint;
  s:array[1..100] of string;
  l:array[0..100] of integer;
  s1,s2,s3:ansistring;
function comp:boolean;
var
  i,l:integer;
begin
  i:=1;l:=length(s2);
  while (i<=l) and (s2[i]=s3[i]) do
    inc(i);
  if i<=l then
  begin
    if s2[i]<s3[i] then
      comp:=false
    else comp:=true;
  end else
    comp:=false;
end;
begin
  readln(n);
  for i:=1 to n do
    readln(s[i]);
  s1:=s[1];
  l[0]:=0;
  l[1]:=length(s[1]);
  for i:=2 to n do
  begin
    s2:=s1;
    insert(s[i],s2,1);
    p:=0;
    for j:=1 to i-1 do
    begin
      s3:=s1;
      insert(s[i],s3,l[j]+1);
      if comp then
      begin
        p:=j;
        s2:=s3;
      end;
    end;
    s1:=s2;
    a:=length(s[i]);
    for j:=i downto p+1 do
      l[j]:=l[j-1]+a;
  end;
  writeln(s1);
end.
