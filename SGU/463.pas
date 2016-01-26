var
  n,m,i,j,x,y,d,ans:longint;
  s:array[0..101,0..101] of integer;
  v:array[0..101,0..101] of boolean;
  move:ansistring;
  ch:char;
procedure cal(x,y:integer);
begin
  if not v[x,y] then
  begin
    v[x,y]:=true;
    inc(ans,s[x,y]);
  end else
    inc(ans,s[x,y] shr 1);
end;
begin
  fillchar(v,sizeof(v),false);
  fillchar(s,sizeof(s),0);
  readln(n,m);
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      read(ch);
      s[i,j]:=ord(ch)-48;
    end;
    readln;
  end;
  readln(move);
  ans:=0;
  x:=1;y:=1;d:=1;
  for i:=1 to length(move) do
  begin
    if move[i]='R' then
      d:=d mod 4+1;
    if move[i]='L' then
      d:=(d+2) mod 4+1;
    if move[i]='M' then
    begin
      if d=1 then
      begin
        cal(x-1,y);
        cal(x,y);
        inc(y);
      end;
      if d=2 then
      begin
        cal(x,y-1);
        cal(x,y);
        inc(x);
      end;
      if d=3 then
      begin
        cal(x-1,y-1);
        cal(x,y-1);
        dec(y);
      end;
      if d=4 then
      begin
        cal(x-1,y-1);
        cal(x-1,y);
        dec(x);
      end;
    end;
  end;
  writeln(ans);
end.
