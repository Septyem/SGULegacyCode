var
  n,m,k,i,ph,pt,la,x:longint;
  s:array[-40000..40000] of string[8];
  ans:array[1..40000] of string[8];
  cmd:string;
begin
  readln(n,m,k);
  for i:=n downto 1 do
    readln(s[i]);
  ph:=n;la:=0;
  if n>k then
  begin
    for i:=1 to n-k do
    begin
      inc(la);
      ans[la]:=s[i];
    end;
    pt:=n-k+1;
  end else
    pt:=1;
  for i:=1 to m do
  begin
    readln(cmd);
    if cmd='ROTATE' then
    begin
      x:=ph;
      ph:=pt;
      pt:=x;
    end else
    begin
      if k=0 then
      begin
        inc(la);
        ans[la]:=copy(cmd,5,length(cmd)-5);
        continue;
      end;
      if pt>ph then
        dec(ph)
      else inc(ph);
      s[ph]:=copy(cmd,5,length(cmd)-5);
      if abs(pt-ph)+1>k then
      begin
        inc(la);
        ans[la]:=s[pt];
        if pt>ph then
          dec(pt)
        else inc(pt);
      end;
    end;
  end;
  if k<>0 then
    if pt>ph then
      for i:=pt downto ph do
      begin
        inc(la);
        ans[la]:=s[i];
      end
    else
      for i:=pt to ph do
      begin
        inc(la);
        ans[la]:=s[i];
      end;
  for i:=la downto 1 do
    writeln(ans[i]);
end.
