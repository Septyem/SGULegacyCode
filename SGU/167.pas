var
  n,m,k,i,j,j1,j2,j3,jn,tmp,a,b,c,n1:longint;
  map:array[1..15,0..15] of integer;
  d:array[1..15,1..15,1..15,0..3,0..225] of longint;
  p1,p2,p3:array[1..15,1..15,1..15,0..3,1..225] of integer;
procedure print(n,a,b,c,k:integer);
var
  i:integer;
begin
  if p1[n,a,b,c,k]<>0 then
    print(n-1,p1[n,a,b,c,k],p2[n,a,b,c,k],p3[n,a,b,c,k],k-(b-a+1));
  for i:=a to b do
    writeln(n,' ',i);
end;
begin
  readln(n,m,k);
  for i:=1 to n do
  begin
    map[i,0]:=0;
    for j:=1 to m do
    begin
      read(tmp);
      map[i,j]:=map[i,j-1]+tmp;
    end;
  end;
  fillchar(d,sizeof(d),$ff);
  fillchar(p1,sizeof(p1),0);
  for j:=1 to m do
    for j1:=j to m do
      d[1,j,j1,3,j1-j+1]:=map[1,j1]-map[1,j-1];
  for i:=2 to n do
  begin
    for j:=1 to m do
      for j1:=j to m do
        d[i,j,j1,3,j1-j+1]:=map[i,j1]-map[i,j-1];
    for j:=1 to m do
      for j1:=j to m do
      begin
        tmp:=j1-j+1;
        for j2:=1 to j do
          for j3:=j1 to m do
            for jn:=1 to i*m-tmp do
            begin
              if jn+tmp>k then break;
              if (d[i-1,j2,j3,0,jn]>=0) and (d[i-1,j2,j3,0,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,0,jn+tmp]) then
              begin
                d[i,j,j1,0,jn+tmp]:=d[i-1,j2,j3,0,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,0,jn+tmp]:=j2;
                p2[i,j,j1,0,jn+tmp]:=j3;
                p3[i,j,j1,0,jn+tmp]:=0;
              end;
              if (d[i-1,j2,j3,1,jn]>=0) and (d[i-1,j2,j3,1,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,0,jn+tmp]) then
              begin
                d[i,j,j1,0,jn+tmp]:=d[i-1,j2,j3,1,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,0,jn+tmp]:=j2;
                p2[i,j,j1,0,jn+tmp]:=j3;
                p3[i,j,j1,0,jn+tmp]:=1;
              end;
              if (d[i-1,j2,j3,2,jn]>=0) and (d[i-1,j2,j3,2,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,0,jn+tmp]) then
              begin
                d[i,j,j1,0,jn+tmp]:=d[i-1,j2,j3,2,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,0,jn+tmp]:=j2;
                p2[i,j,j1,0,jn+tmp]:=j3;
                p3[i,j,j1,0,jn+tmp]:=2;
              end;
              if (d[i-1,j2,j3,3,jn]>=0) and (d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,0,jn+tmp]) then
              begin
                d[i,j,j1,0,jn+tmp]:=d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,0,jn+tmp]:=j2;
                p2[i,j,j1,0,jn+tmp]:=j3;
                p3[i,j,j1,0,jn+tmp]:=3;
              end;
            end;
        for j2:=j to j1 do
          for j3:=j1 to m do
            for jn:=1 to i*m-tmp do
            begin
              if jn+tmp>k then break;
              if (d[i-1,j2,j3,1,jn]>=0) and (d[i-1,j2,j3,1,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,1,jn+tmp]) then
              begin
                d[i,j,j1,1,jn+tmp]:=d[i-1,j2,j3,1,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,1,jn+tmp]:=j2;
                p2[i,j,j1,1,jn+tmp]:=j3;
                p3[i,j,j1,1,jn+tmp]:=1;
              end;
              if (d[i-1,j2,j3,3,jn]>=0) and (d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,1,jn+tmp]) then
              begin
                d[i,j,j1,1,jn+tmp]:=d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,1,jn+tmp]:=j2;
                p2[i,j,j1,1,jn+tmp]:=j3;
                p3[i,j,j1,1,jn+tmp]:=3;
              end;
            end;
        for j2:=1 to j do
          for j3:=j to j1 do
            for jn:=1 to i*m-tmp do
            begin
              if jn+tmp>k then break;
              if (d[i-1,j2,j3,2,jn]>=0) and (d[i-1,j2,j3,2,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,2,jn+tmp]) then
              begin
                d[i,j,j1,2,jn+tmp]:=d[i-1,j2,j3,2,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,2,jn+tmp]:=j2;
                p2[i,j,j1,2,jn+tmp]:=j3;
                p3[i,j,j1,2,jn+tmp]:=2;
              end;
              if (d[i-1,j2,j3,3,jn]>=0) and (d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,2,jn+tmp]) then
              begin
                d[i,j,j1,2,jn+tmp]:=d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,2,jn+tmp]:=j2;
                p2[i,j,j1,2,jn+tmp]:=j3;
                p3[i,j,j1,2,jn+tmp]:=3;
              end;
            end;
        for j2:=j to j1 do
          for j3:=j2 to j1 do
            for jn:=1 to i*m-tmp do
            begin
              if jn+tmp>k then break;
              if (d[i-1,j2,j3,3,jn]>=0) and (d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1]>d[i,j,j1,3,jn+tmp]) then
              begin
                d[i,j,j1,3,jn+tmp]:=d[i-1,j2,j3,3,jn]+map[i,j1]-map[i,j-1];
                p1[i,j,j1,3,jn+tmp]:=j2;
                p2[i,j,j1,3,jn+tmp]:=j3;
                p3[i,j,j1,3,jn+tmp]:=3;
              end;
            end;
      end;
  end;
  tmp:=0;a:=0;
  for i:=1 to n do
    for j:=1 to m do
      for j1:=j to m do
        for j2:=0 to 3 do
          if (d[i,j,j1,j2,k]>tmp) or ((a=0) and (d[i,j,j1,j2,k]>=0)) then
          begin
            tmp:=d[i,j,j1,j2,k];
            a:=j;b:=j1;
            c:=j2;n1:=i;
          end;
  writeln('Oil : ',tmp);
  if a<>0 then
    print(n1,a,b,c,k);
end.
