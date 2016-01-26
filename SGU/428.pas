const
  max=100;
var
  t:longint;
procedure cal(s1,s2,s3:string;l:integer);
begin
  if (l+1)*3+2<=max then
  begin
    if t=1000 then exit;
    writeln(s1,'A+',s2,'A=',s3,'A');
    inc(t);
    cal(s1+'A',s2+'A',s3+'A',l+1);
  end;
  if (l+3)*3+2<=max then
  begin
    if t=1000 then exit;
    writeln(s1,'GGG+',s2,'CCG=',s3,'IJC');
    inc(t);
    cal(s1+'GGG',s2+'CCG',s3+'IJC',l+3);
  end;
  if (l+4)*3+2<=max then
  begin
    if t=1000 then exit;
    writeln(s1,'CCFA+',s2,'CCFF=',s3,'EFAF');
    inc(t);
    cal(s1+'CCFA',s2+'CCFF',s3+'EFAF',l+4);
  end;
end;
begin
  t:=0;
  cal('GGG','CCG','IJC',3);
end.
