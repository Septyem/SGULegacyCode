type
  point=^data;
  data=record
    ch:char;
    pre,next:point;
    end;
var
  i:longint;
  s:ansistring;
  h,p,q:point;
begin
  new(h);
  h^.pre:=nil;
  h^.next:=nil;
  p:=h;
  readln(s);
  for i:=1 to length(s) do
    if s[i]='L' then
    begin
      if p^.pre<>nil then
        p:=p^.pre;
    end else
    if s[i]='R' then
    begin
      if p^.next<>nil then
        p:=p^.next;
    end else
    begin
      new(q);
      q^.ch:=s[i];
      q^.pre:=p;q^.next:=p^.next;
      if p^.next<>nil then
        p^.next^.pre:=q;
      p^.next:=q;
      p:=q;
    end;
  p:=h;
  while p^.next<>nil do
  begin
    p:=p^.next;
    write(p^.ch);
  end;
end.
