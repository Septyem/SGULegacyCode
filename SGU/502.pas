var
  l,i:longint;
  a1:int64;
  a:array[0..9] of integer;
  s:string;
procedure dfs(t:integer);
var
  i,x:integer;
begin
  if t=l then
  begin
    x:=17-(a1*10) mod 17;
    if (x<10) and (a[x]>0) then
    begin
      writeln(a1*10+x);
      halt;
    end;
    exit;
  end;
  for i:=0 to 9 do
    if a[i]>0 then
    begin
      dec(a[i]);
      a1:=a1*10+i;
      dfs(t+1);
      a1:=a1 div 10;
      inc(a[i]);
    end;
end;
begin
  fillchar(a,sizeof(a),0);
  readln(s);
  l:=length(s);
  for i:=1 to l do
    inc(a[ord(s[i])-48]);
  if l>1 then
    for i:=1 to 9 do
      if a[i]>0 then
      begin
        dec(a[i]);
        a1:=i;
        dfs(2);
        inc(a[i]);
      end;
  writeln(-1);
end.
