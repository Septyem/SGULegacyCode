const
  max=100000000;
var
  b,e,n,m,x,y,y1,z,h,t,i,j,t1,t2,t3,t4,t5,t6,tn:longint;
  p,d,a:array[0..300] of longint;
  r:array[1..300,1..300] of longint;
  s:array[1..300,0..3] of longint;
  v:array[1..300] of boolean;
  q:array[1..3000] of longint;
  ch:char;
function min(a,b:longint):longint;
begin
  if a<b then
    min:=a
  else min:=b;
end;
begin
  fillchar(r,sizeof(r),$2f);
  fillchar(v,sizeof(v),false);
  readln(b,e);
  readln(n,m);
  for i:=1 to n do
  begin
    d[i]:=max;
    r[i,i]:=0;
    read(ch);
    if ch='B' then
      s[i,0]:=1
    else s[i,0]:=0;
    readln(s[i,1],s[i,2],s[i,3]);
  end;
  for i:=1 to m do
  begin
    readln(x,y,z);
    if z<r[x,y] then
    begin
      r[x,y]:=z;
      r[y,x]:=z;
    end;
  end;
  h:=0;t:=1;
  q[t]:=b;
  d[b]:=0;p[b]:=0;
  v[b]:=true;
  while h<t do
  begin
    inc(h);
    x:=q[h];
    for i:=1 to n do
      if (x<>i) and (r[x,i]<max) then
      begin
        y:=s[x,0];
        if d[x]>=s[x,1] then
        begin
          z:=(d[x]-s[x,1]) mod (s[x,2]+s[x,3]);
          if y=1 then
          begin
            if z<s[x,3] then
            begin
              t1:=s[x,3]-z;
              y:=1-y;
            end else
              t1:=s[x,2]+s[x,3]-z;
          end else
          begin
            if z<s[x,2] then
            begin
              t1:=s[x,2]-z;
              y:=1-y;
            end else
              t1:=s[x,2]+s[x,3]-z;
          end;
        end else
          t1:=s[x,1]-d[x];
        if y=0 then
        begin
          t2:=s[x,2];
          t3:=s[x,3];
        end else
        begin
          t2:=s[x,3];
          t3:=s[x,2];
        end;
        y1:=s[i,0];
        if d[x]>=s[i,1] then
        begin
          z:=(d[x]-s[i,1]) mod (s[i,2]+s[i,3]);
          if y1=1 then
          begin
            if z<s[i,3] then
            begin
              t4:=s[i,3]-z;
              y1:=1-y1;
            end else
              t4:=s[i,2]+s[i,3]-z;
          end else
          begin
            if z<s[i,2] then
            begin
              t4:=s[i,2]-z;
              y1:=1-y1;
            end else
              t4:=s[i,2]+s[i,3]-z;
          end;
        end else
          t4:=s[i,1]-d[x];
        if y1=0 then
        begin
          t5:=s[i,2];
          t6:=s[i,3];
        end else
        begin
          t5:=s[i,3];
          t6:=s[i,2];
        end;
        if y=y1 then
          tn:=0
        else
          if t1=t4 then
          begin
            if t2=t5 then
            begin
              if t3=t6 then
                tn:=max+1
              else tn:=t1+t2+min(t3,t6);
            end else
              tn:=t1+min(t2,t5);
          end else
            tn:=min(t1,t4);
        if tn+d[x]+r[x,i]<d[i] then
        begin
          p[i]:=x;
          d[i]:=tn+d[x]+r[x,i];
          if not v[i] then
          begin
            v[i]:=true;
            inc(t);
            q[t]:=i;
          end;
        end;
      end;
    v[x]:=false;
  end;
  if d[e]<max then
  begin
    writeln(d[e]);
    a[0]:=0;
    while e<>0 do
    begin
      inc(a[0]);
      a[a[0]]:=e;
      e:=p[e];
    end;
    for i:=a[0] downto 2 do
      write(a[i],' ');
    writeln(a[1]);
  end else
    writeln(0);
end.
