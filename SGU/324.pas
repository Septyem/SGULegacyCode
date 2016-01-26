var
  n,i,j,j1,c,la:integer;
  s,ans:string;
  sp:boolean;
function check(c:char):boolean;
begin
  if ((c>='a') and (c<='z')) or ((c>='A') and (c<='Z')) then
    check:=false
  else check:=true;
end;
begin
  readln(n);
  for i:=1 to n do
  begin
    readln(s);
    ans:='';c:=0;
    sp:=false;
    for j:=1 to length(s) do
    begin
      if s[j]=' ' then
      begin
        sp:=true;
        continue;
      end;
      if s[j]='-' then
      begin
        inc(c);
        continue;
      end;
      if (s[j]<>' ') and (s[j]<>'-') then
      begin
        if c>0 then
        begin
          if c>1 then
          begin
            if odd(c) then
            begin
              ans:=ans+' ---';
              dec(c,3);
            end;
            for j1:=1 to c div 2 do
              ans:=ans+' --';
            ans:=ans+' ';
          end else
            ans:=ans+'-';
          sp:=false;
          c:=0;
        end;
        if sp then
        begin
          la:=length(ans);
          if (not check(s[j])) and (la>0) and (not check(ans[la])) then
            ans:=ans+' ';
          sp:=false;
        end;
      end;
      ans:=ans+s[j];
    end;
    if c>0 then
    begin
      if c>1 then
      begin
        if odd(c) then
        begin
          ans:=ans+' ---';
          dec(c,3);
        end;
        for j1:=1 to c div 2 do
          ans:=ans+' --';
        ans:=ans+' ';
      end else
        ans:=ans+'-';
      sp:=false;
      c:=0;
    end;
    for j:=1 to length(ans) do
      if ans[j]='-' then
        if (j=1) or (j=length(ans)) or ((ans[j-1]<>'-') and (ans[j+1]<>'-')
        and (check(ans[j-1]) or check(ans[j+1]))) then
        begin
          ans:='error';
          break;
        end;
    writeln(ans);
  end;
end.
