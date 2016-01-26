const
  max=2007;
type
  matrix=array[1..10,1..10] of longint;
var
  n,k,i,j,j1,j2:longint;
  bi:array[0..40] of integer;
  s,s1,ans:matrix;
begin
  fillchar(ans,sizeof(ans),0);
  readln(n,k);
  for i:=1 to k do
  begin
    ans[i,1]:=1;
    for j:=2 to i do
      ans[i,j]:=(ans[i-1,j-1]+j*ans[i-1,j]) mod max;
  end;
  if n<=k then
  begin
    writeln(ans[n,k]);
    halt;
  end;
  dec(n,k);
  bi[0]:=0;
  while n<>0 do
  begin
    inc(bi[0]);
    bi[bi[0]]:=n mod 2;
    n:=n div 2;
  end;
  s[1,1]:=1;
  for i:=2 to k do
  begin
    s[i-1,i]:=1;
    s[i,i]:=i;
  end;
  for i:=1 to bi[0] do
  begin
    if bi[i]=1 then
    begin
      for j1:=1 to k do
        for j2:=1 to k do
        begin
          s1[j1,j2]:=0;
          for j:=1 to k do
          begin
            inc(s1[j1,j2],ans[j1,j]*s[j,j2]);
            if s1[j1,j2]>=max then
              s1[j1,j2]:=s1[j1,j2] mod max;
          end;
        end;
      ans:=s1;
    end;
    for j1:=1 to k do
      for j2:=1 to k do
      begin
        s1[j1,j2]:=0;
        for j:=1 to k do
        begin
          inc(s1[j1,j2],s[j1,j]*s[j,j2]);
          if s1[j1,j2]>=max then
            s1[j1,j2]:=s1[j1,j2] mod max;
         end;
        end;
    s:=s1;
  end;
  writeln(ans[k,k]);
end.
