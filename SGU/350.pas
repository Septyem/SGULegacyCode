var
  n,m,i:longint;
  s,a:array[1..100] of longint;
  used:array[1..100] of boolean;
procedure search(t:integer);
var
  i,j,j1:integer;
  x:longint;
  back:array[0..15] of integer;
  get:boolean;
begin
  if t>n then
  begin
    for i:=1 to n do
    begin
      write(a[i]);
      if i<>n then write(' ')
        else writeln;
    end;
    halt;
  end;
  for i:=1 to m do
    if not used[i] then
    begin
      back[0]:=0;
      used[i]:=true;
      get:=true;
      for j:=2 to t-1 do
      begin
        x:=a[j] xor s[i];
        get:=false;
        for j1:=1 to m do
          if (not used[j1]) and (s[j1]=x) then
          begin
            used[j1]:=true;
            inc(back[0]);
            back[back[0]]:=j1;
            get:=true;
            break;
          end;
        if not get then
          break;
      end;
      if get then
      begin
        a[t]:=s[i];
        search(t+1);
      end;
      for j:=1 to back[0] do
        used[back[j]]:=false;
      used[i]:=false;
    end;
end;
begin
  readln(m);
  n:=2;
  while n*(n-1) div 2<>m do
    inc(n);
  for i:=1 to m do
    read(s[i]);
  a[1]:=0;
  fillchar(used,sizeof(used),false);
  search(2);
end.
