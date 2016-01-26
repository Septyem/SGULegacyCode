var
  n,i:longint;
  s:string;
function check_let(ch:char):boolean;
begin
  check_let:=false;
  if ((ch>='a') and (ch<='z')) or ((ch>='A') and (ch<='Z')) then
    check_let:=true;
end;
function check_sym(ch:char):boolean;
begin
  if check_let(ch) or ((ch>='0') and (ch<='9')) or (ch='-') or (ch='_')
    then check_sym:=true
  else check_sym:=false;
end;
function check_word(s:string):boolean;
begin
  check_word:=false;
  if (length(s)=1) and (check_sym(s[1])) then
    check_word:=true
  else if (length(s)>1) then
         if (check_sym(s[1])) and (check_word(copy(s,2,length(s)-1))) then
           check_word:=true;
end;
function check_pre(s:string):boolean;
var
  p:integer;
begin
  p:=pos('.',s);
  if (p=0) and check_word(s) then
  begin
    check_pre:=true;
    exit;
  end;
  if check_word(copy(s,1,p-1)) and check_pre(copy(s,p+1,length(s)-p)) then
    check_pre:=true
  else check_pre:=false;
end;
function check_dom(s:string):boolean;
var
  i:integer;
begin
  if (length(s)<>2) and (length(s)<>3) then
  begin
    check_dom:=false;
    exit;
  end;
  check_dom:=true;
  for i:=1 to length(s) do
    if not check_let(s[i]) then
      check_dom:=false;
end;
function check_suf(s:string):boolean;
var
  p:integer;
begin
  p:=length(s);
  while (p>0) and (s[p]<>'.') do
    dec(p);
  if p=0 then
  begin
    check_suf:=false;
    exit;
  end;
  if check_pre(copy(s,1,p-1)) and check_dom(copy(s,p+1,length(s)-p)) then
    check_suf:=true
  else check_suf:=false;
end;
function check_add(s:string):boolean;
var
  p:integer;
begin
  p:=pos('@',s);
  if p=0 then
  begin
    check_add:=false;
    exit;
  end;
  if check_pre(copy(s,1,p-1)) and check_suf(copy(s,p+1,length(s)-p)) then
    check_add:=true
  else check_add:=false;
end;
begin
  readln(n);
  for i:=1 to n do
  begin
    readln(s);
    if check_add(s) then
      writeln('YES')
    else writeln('NO');
  end;
end.
