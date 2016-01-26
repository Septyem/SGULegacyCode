var
  n,m,x,i,j,k:longint;
  s:array[0..1000] of longint;
  a:array[1..4,1..2] of longint;
procedure change(x,y:longint);
begin
  s[x]:=y;
  inc(k);
  a[k,1]:=x;a[k,2]:=y;
end;
procedure find2(p:longint);
begin
  while (p<n) and (s[p]<>2) do inc(p);
  if p=n then exit;
  change(p,0);
  change(p+1,s[p+1]+1);
end;
begin
  fillchar(s,sizeof(s),0);
  read(n);
  read(m);
  for i:=1 to m do
  begin
    read(x);
    k:=0;
    case s[x] of
      0:begin
          find2(x);
          change(x,1);
        end;
      1:begin
          case s[x+1] of
            0:begin
                change(x,0);
                change(x+1,1);
              end;
            1:begin
                find2(x);
                change(x,0);
                change(x+1,2);
              end;
            2:begin
                change(x+2,s[x+2]+1);
                change(x+1,1);
                change(x,0);
              end;
          end;
        end;
      2:begin
          change(x+1,s[x+1]+1);
          change(x,1);
        end;
    end;
    write(k);
    for j:=1 to k do
      write(' ',a[j,1],' ',a[j,2]);
    writeln;
  end;
end.
