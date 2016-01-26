var
  k,l,la,i,j,j1,x:longint;
  s:ansistring;
  ans,a1:array[1..2000] of char;
  p:array[1..2000,0..2000] of integer;
  get,change:boolean;
begin
  readln(k);
  readln(s);
  l:=length(s);
  for i:=1 to l div 2 do
  begin
    p[i,0]:=0;
    for j:=1 to l do
    begin
      x:=(j+i-1) mod l+1;
      if s[j]<>s[x] then
        p[i,j]:=p[i,j-1]+1
      else p[i,j]:=p[i,j-1];
    end;
  end;
  get:=false;la:=0;
  for i:=l div 2 downto 1 do
  begin
    for j:=1 to l do
    begin
      if j+i-1>l then
        x:=p[i,j+i-1-l]+p[i,l]-p[i,j-1]
      else x:=p[i,j+i-1]-p[i,j-1];
      if x<=k then
        if get then
        begin
          change:=false;
          for j1:=1 to i*2 do
          begin
            a1[j1]:=s[(j+j1-2) mod l+1];
            if (not change) and (a1[j1]>ans[j1]) then
              break;
            if a1[j1]<ans[j1] then
              change:=true;
          end;
          if change then
            for j1:=1 to i*2 do
              ans[j1]:=a1[j1];
        end else
        begin
          get:=true;
          la:=i*2;
          for j1:=1 to i*2 do
            ans[j1]:=s[(j+j1-2) mod l+1];
        end;
    end;
    if get then
      break;
  end;
  for i:=1 to la do
    write(ans[i]);
  writeln;
end. 
