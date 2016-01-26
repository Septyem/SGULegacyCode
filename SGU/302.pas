var
  i,j,l,l1:longint;
  sta:array[1..2,0..1000] of integer;
  v:array[1..1000] of boolean;
  s,cmd:ansistring;
  s1:array[1..1000] of char;
begin
  readln(s);
  i:=1;l:=length(s);
  sta[1,0]:=0;sta[2,0]:=0;
  l1:=0;
  fillchar(v,sizeof(v),false);
  while i<=l do
  begin
    if s[i]='<' then
    begin
      cmd:='';
      inc(i);
      repeat
        cmd:=cmd+s[i];
        inc(i);
      until s[i]='>';
      if cmd='UP' then
      begin
        inc(sta[1,0]);
        sta[1,sta[1,0]]:=l1+1;
      end;
      if cmd='DOWN' then
      begin
        inc(sta[2,0]);
        sta[2,sta[2,0]]:=l1+1;
      end;
      if cmd='/UP' then
      begin
        for j:=l1 downto sta[1,sta[1,0]] do
          if not v[j] then
          begin
            v[j]:=true;
            if (s1[j]>='a') and (s1[j]<='z') then
              s1[j]:=chr(ord(s1[j])-32);
          end;
        dec(sta[1,0]);
      end;
      if cmd='/DOWN' then
      begin
        for j:=l1 downto sta[2,sta[2,0]] do
          if not v[j] then
          begin
            v[j]:=true;
            if (s1[j]>='A') and (s1[j]<='Z') then
              s1[j]:=chr(ord(s1[j])+32);
          end;
        dec(sta[2,0]);
      end;
    end else
    begin
      inc(l1);
      s1[l1]:=s[i];
    end;
    inc(i);
  end;
  for i:=1 to l1 do
    write(s1[i]);
  writeln;
end.
