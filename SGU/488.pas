var
  t,i,j,n,a1,a2,lu,ld,now:longint;
  s:array[1..1000001] of longint;
function min(a,b:longint):longint;
begin
  if a<b then min:=a
    else min:=b;
end;
begin
  readln(t);
  for i:=1 to t do
  begin
    read(n);
    for j:=1 to n do
      read(s[j]);
    s[n+1]:=s[n];
    a1:=0;a2:=0;
    lu:=0;ld:=0;now:=0;
    for j:=2 to n+1 do
    begin
      if s[j]>s[j-1] then
      begin
        if now<>1 then
        begin
          if min(lu,ld)>a1 then
            a1:=min(lu,ld);
          now:=1;
          lu:=1;
        end else
          inc(lu);
      end;
      if s[j]<s[j-1] then
      begin
        if now<>-1 then
        begin
          if min(lu,ld)>a2 then
            a2:=min(lu,ld);
          now:=-1;
          ld:=1;
        end else
          inc(ld);
      end;
      if s[j]=s[j-1] then
      begin
        if j>2 then
        begin
          if s[j-1]>s[j-2] then
            if min(lu,ld)>a2 then
              a2:=min(lu,ld);
          if s[j-1]<s[j-2] then
            if min(lu,ld)>a1 then
              a1:=min(lu,ld);
        end;
        now:=0;
        lu:=0;ld:=0;
      end;
    end;
    writeln(a1,' ',a2);
  end;
end.
