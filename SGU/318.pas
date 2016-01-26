var
  n,m,i,j,j1,j2,x,a,ans:longint;
  s:array[1..100,1..100] of boolean;
  bln,used:array[1..100] of boolean;
begin
  fillchar(s,sizeof(s),false);
  fillchar(used,sizeof(used),false);
  readln(n,m);
  for i:=1 to m do
  begin
    read(x);
    for j:=1 to x do
    begin
      read(a);
      s[i,a]:=true;
    end;
  end;
  ans:=0;
  for i:=1 to m do
    for j:=1 to n do
      if s[i,j] and not used[j] then
      begin
        for j1:=1 to n do
          bln[j1]:=s[i,j1];
        for j1:=i+1 to m do
          if s[j1,j] then
          begin
            for j2:=1 to n do
              if not s[j1,j2] then
                bln[j2]:=false;
          end else
            for j2:=1 to n do
              if s[j1,j2] then
                bln[j2]:=false;
        for j1:=1 to n do
          if bln[j1] then
            used[j1]:=true;
        inc(ans);
      end;
  writeln(ans);
end. 
