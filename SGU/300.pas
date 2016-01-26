var
  n,i,j,h,ans,now,max1,max2,min1,min2:longint;
  s:array[1..4000,0..1] of integer;
  d:array[1..4000] of integer;
begin
  readln(n);
  for i:=1 to n do
    read(s[i,0],s[i,1]);
  for i:=1 to n-1 do
    if s[i,0]=s[i+1,0] then
      d[i]:=1
    else d[i]:=0;
  now:=0;h:=1;
  ans:=0;
  for i:=1 to n-1 do
    inc(ans,abs(s[i,d[i]]-s[i+1,d[i]]));
  for i:=1 to n-1 do
  begin
    j:=i-2;
    if s[i,d[i]]>s[i+1,d[i]] then
    begin
      max1:=s[i,d[i]];
      min1:=s[i+1,d[i]];
    end else
    begin
      max1:=s[i+1,d[i]];
      min1:=s[i,d[i]];
    end;
    while j>=h do
    begin
      if d[i]<>d[j] then
      begin
        if s[j,d[j]]>s[j+1,d[j]] then
        begin
          max2:=s[j,d[j]];
          min2:=s[j+1,d[j]];
        end else
        begin
          max2:=s[j+1,d[j]];
          min2:=s[j,d[j]];
        end;
        if (s[i,1-d[i]]<=max2) and (s[i,1-d[i]]>=min2) and
          (s[j,1-d[j]]<=max1) and (s[j,1-d[j]]>=min1) then
        begin
          while h<j do
          begin
            dec(now,abs(s[h,d[h]]-s[h+1,d[h]]));
            inc(h);
          end;
          dec(now,abs(s[i,1-d[i]]-s[h,1-d[i]]));
          inc(now,abs(s[j,1-d[j]]-s[i,d[i]]));
          if now<ans then
            ans:=now;
          s[j,1-d[i]]:=s[i,1-d[i]];
          inc(now,abs(s[j,1-d[j]]-s[i+1,d[i]]));
          break;
        end;
      end;
      dec(j);
    end;
    if j<h then
      inc(now,abs(s[i,d[i]]-s[i+1,d[i]]));
  end;
  writeln(ans);
end.
