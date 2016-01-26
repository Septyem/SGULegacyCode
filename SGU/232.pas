var
  n,k,i,j,len,la,a,b,p:longint;
  s,s1,s2,ans:array[1..150000] of integer;
  v:array[1..150000] of boolean;
  c:char;
function comp:boolean;
var
  i:longint;
begin
  if la=0 then
  begin
    comp:=true;
    exit;
  end;
  for i:=1 to len do
  begin
    a:=i;
    if a>la then
      a:=(a-1) mod la+1;
    if ans[a]<>s2[i] then
    begin
      if ans[a]>s2[i] then
        comp:=false
      else comp:=true;
      exit;
    end;
  end;
  comp:=false;
end;
begin
  readln(n,k);
  k:=k mod n;
  for i:=1 to n do
  begin
    read(c);
    s[i]:=ord(c)-48;
  end;
  fillchar(v,sizeof(v),false);
  la:=0;
  for i:=1 to n do
    if not v[i] then
    begin
      j:=i;len:=0;
      while not v[j] do
      begin
        v[j]:=true;
        inc(len);
        s1[len]:=s[j];
        inc(j,k);
        if j>n then
          dec(j,n);
      end;
      a:=1;b:=2;
      while b<=len do
      begin
        p:=1;
        while p<=len do
        begin
          if s1[(a+p-2) mod n+1]<>s1[(b+p-2) mod n+1] then
            break;
          inc(p);
        end;
        if (p>len) or (s1[(a+p-2) mod n+1]>s1[(b+p-2) mod n+1]) then
          b:=b+p else
        begin
          if a+p>b then
            a:=a+p
          else a:=b;
          b:=a+1;
        end;
      end;
      for j:=1 to len do
      begin
        s2[j]:=s1[a];
        inc(a);
        if a>len then
          a:=1;
      end;
      if comp then
      begin
        la:=len;
        for j:=1 to la do
          ans[j]:=s2[j];
      end;
    end;
  p:=1;
  for i:=1 to n do
  begin
    write(ans[p]);
    inc(p);
    if p>la then
      p:=1;
  end;
  writeln;
end.
