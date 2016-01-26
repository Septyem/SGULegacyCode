var
  n,m,i,j,j1:longint;
  s:array[1..10,0..10] of longint;
  ans,s1:array[0..10] of integer;
  bl:array[0..100] of integer;
  get:boolean;
begin
  readln(n,m);
  for i:=1 to n do
  begin
    read(s[i,0]);
    for j:=1 to s[i,0] do
      read(s[i,j]);
  end;
  for i:=1 to m do
  begin
    read(s1[0]);
    for j:=1 to s1[0] do
      read(s1[j]);
    ans[0]:=0;
    for j:=1 to n do
    begin
      fillchar(bl,sizeof(bl),0);
      for j1:=1 to s1[0] do
        if s1[j1]>0 then
          bl[s1[j1]]:=1
        else bl[-s1[j1]]:=-1;
      get:=true;
      for j1:=1 to s[j,0] do
        if s[j,j1]<=100 then
        begin
          if bl[s[j,j1]]>0 then
            bl[s[j,j1]]:=0;
          if bl[s[j,j1]]<0 then
          begin
            get:=false;
            break;
          end;
        end;
      if get then
        for j1:=1 to 100 do
          if bl[j1]>0 then
          begin
            get:=false;
            break;
          end;
      if get then
      begin
        inc(ans[0]);
        ans[ans[0]]:=j;
      end;
    end;
    writeln(ans[0]);
    for j:=1 to ans[0] do
      for j1:=0 to s[ans[j],0] do
      begin
        write(s[ans[j],j1]);
        if j1=s[ans[j],0] then
          writeln
        else write(' ');
      end;
  end;
end. 
