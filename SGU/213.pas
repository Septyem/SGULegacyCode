var
  n,m,s,t,i,x,y,ans,p1,p2,p:longint;
  r:array[1..400,1..400] of longint;
  q:array[1..16000,1..2] of integer;
  v:array[1..400] of boolean;
  a1:array[0..16000] of longint;
begin
  fillchar(r,sizeof(r),0);
  readln(n,m,s,t);
  for i:=1 to m do
  begin
    read(x,y);
    r[x,y]:=i;
    r[y,x]:=i;
  end;
  p1:=0;p2:=1;
  q[p2,1]:=s;q[p2,2]:=0;
  fillchar(v,sizeof(v),false);
  v[s]:=true;ans:=0;
  while not v[t] do
  begin
    inc(p1);
    x:=q[p1,1];
    for i:=1 to n do
      if not v[i] and (r[x,i]>0) then
      begin
        v[i]:=true;
        inc(p2);
        q[p2,1]:=i;
        q[p2,2]:=q[p1,2]+1;
        if i=t then
        begin
          ans:=q[p2,2];
          break;
        end;
      end;
  end;
  writeln(ans);
  p1:=0;p2:=1;
  q[p2,1]:=s;q[p2,2]:=0;
  a1[0]:=0;p:=0;
  while p<>ans do
  begin
    inc(p1);
    if q[p1,2]>p then
    begin
      inc(p);
      for i:=0 to a1[0]-1 do
        write(a1[i],' ');
      writeln(a1[a1[0]]);
      a1[0]:=0;
    end;
    x:=q[p1,1];
    for i:=1 to n do
      if r[x,i]>0 then
      begin
        inc(a1[0]);
        a1[a1[0]]:=r[x,i];
        r[x,i]:=0;r[i,x]:=0;
        inc(p2);
        q[p2,1]:=i;
        q[p2,2]:=q[p1,2]+1;
      end;
  end;
end.
