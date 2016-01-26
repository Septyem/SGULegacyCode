var
  n,i,j,k,k1:longint;
  s,p:array[1..4] of longint;
  str:string;
function get(a:char):integer;
begin
  if a='a' then get:=1;
  if a='b' then get:=2;
  if a='c' then get:=3;
  if a='d' then get:=4;
end;
begin
  fillchar(s,sizeof(s),0);
  for i:=1 to 4 do
    p[i]:=i;
  readln(n);
  for i:=1 to n do
  begin
    readln(str);
    if str[1]='w' then
    begin
      k:=get(str[9]);
      writeln(s[p[k]]);
    end else
    begin
      k:=get(str[1]);
      if str[2]='^' then
      begin
        if (str[5]='a') or (str[5]='b') or (str[5]='c') or (str[5]='d') then
        begin
          k1:=get(str[5]);
          s[p[k]]:=s[p[k1]];
        end else
        begin
          k1:=0;j:=5;
          while str[j]<>';' do
          begin
            k1:=k1*10+ord(str[j])-48;
            inc(j);
          end;
          s[p[k]]:=k1;
        end;
      end else
      begin
        k1:=get(str[4]);
        p[k]:=p[k1];
      end;
    end;
  end;
end.
