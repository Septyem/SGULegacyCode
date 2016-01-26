var
  n,c,p,t,i,j:longint;
  x,tn,cn,d,l,r,mid,ans:int64;
  f,s:array[0..100] of int64;
begin
  readln(n,c,p,t);
  f[0]:=0;
  for i:=1 to n do
  begin
    read(x);
    f[i]:=f[i-1]+x;
  end;
  ans:=0;
  l:=0;r:=f[n]+1;
  while l<r do
  begin
    mid:=(l+r) shr 1;
    j:=1;
    while f[j]<mid do
      inc(j);
    for i:=1 to j-1 do
      s[i]:=f[i]-f[i-1];
    s[j]:=mid-f[j-1];
    tn:=0;d:=0;
    for i:=j downto 1 do
      if s[i]>d then
      begin
        dec(s[i],d);
        inc(tn,((s[i]-1) div c+1)*2*i*p);
        if tn>t then
          break;
        d:=c-(s[i]-1) mod c-1;
        s[i]:=0;
      end else
        dec(d,s[i]);
    if tn<=t then
    begin
      ans:=mid;
      l:=mid+1;
    end else
      r:=mid;
  end;
  writeln(ans);
end.
