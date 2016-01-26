var
  n,i,j,a,b,t,get,q1,q2:longint;
  m1,m2:array[1..2000,1..2000] of boolean;
  s:array[1..2000,0..2000] of integer;
  r1,r2:array[1..4000,1..2] of integer;
  ans:array[1..2000,1..4] of integer;
  q,p:array[1..2000] of integer;
  v:array[1..2000] of boolean;
begin
  fillchar(m1,sizeof(m1),false);
  fillchar(m2,sizeof(m2),false);
  readln(n);
  for i:=1 to n-1 do
  begin
    read(a,b);
    r1[i,1]:=a;r1[i,2]:=b;
    m1[a,b]:=true;
    m1[b,a]:=true;
  end;
  for i:=1 to n-1 do
  begin
    read(a,b);
    r2[i,1]:=a;r2[i,2]:=b;
    m2[a,b]:=true;
    m2[b,a]:=true;
  end;
  t:=0;
  for i:=1 to n-1 do
    if not m1[r2[i,1],r2[i,2]] then
    begin
      inc(t);
      ans[t,1]:=r2[i,1];
      ans[t,2]:=r2[i,2];
      for j:=1 to n do
        s[j,0]:=0;
      fillchar(v,sizeof(v),false);
      for j:=1 to n+t-2 do
        if m1[r1[j,1],r1[j,2]] then
        begin
          a:=r1[j,1];b:=r1[j,2];
          inc(s[a,0]);
          s[a,s[a,0]]:=b;
          inc(s[b,0]);
          s[b,s[b,0]]:=a;
        end;
      get:=0;
      fillchar(p,sizeof(p),0);
      q1:=0;q2:=1;
      q[q2]:=r2[i,2];
      v[q[q2]]:=true;
      while q1<q2 do
      begin
        inc(q1);
        a:=q[q1];
        for j:=1 to s[a,0] do
          if not v[s[a,j]] then
          begin
            inc(q2);
            q[q2]:=s[a,j];
            p[q2]:=q1;
            v[q[q2]]:=true;
            if s[a,j]=r2[i,1] then
            begin
              get:=1;
              break;
            end;
          end;
        if get=1 then break;
      end;
      b:=q2;
      while get=1 do
      begin
        a:=b;
        b:=p[a];
        if not m2[q[b],q[a]] then
        begin
          ans[t,3]:=q[b];
          ans[t,4]:=q[a];
          m1[q[b],q[a]]:=false;
          m1[q[a],q[b]]:=false;
          inc(get);
        end;
      end;
      m1[r2[i,1],r2[i,2]]:=true;
      m1[r2[i,2],r2[i,1]]:=true;
      r1[n+t-1,1]:=r2[i,1];
      r1[n+t-1,2]:=r2[i,2];
    end;
  writeln(t);
  for i:=1 to t do
  begin
    write(1);
    for j:=1 to 4 do
      write(' ',ans[i,j]);
    writeln;
  end;
end.
