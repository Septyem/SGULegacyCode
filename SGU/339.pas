var
  l,r,ls,i,j,ans:longint;
  s:array[1..1000,1..2] of longint;
  ch:char;
begin
  ls:=0;
  while not eof do
  begin
    read(ch);
    readln(l,r);
    if ch='+' then
    begin
      ans:=0;
      for i:=1 to ls do
        if (s[i,1]>=l) and (s[i,2]<=r) then
          inc(ans);
      writeln(ans);
      inc(ls);
      s[ls,1]:=l;s[ls,2]:=r;
    end;
    if ch='-' then
    begin
      j:=ls;
      while (j>0) and ((s[j,1]<>l) or (s[j,2]<>r)) do
        dec(j);
      if j>0 then
        for i:=j to ls-1 do
        begin
          s[i,1]:=s[i+1,1];
          s[i,2]:=s[i+1,2];
        end;
      dec(ls);
    end;
  end;
end.
