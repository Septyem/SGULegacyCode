const
  mx:array[1..4] of integer=(0,1,0,-1);
  my:array[1..4] of integer=(1,0,-1,0);
type
  order=array[0..2] of integer;
var
  n,i,j,j1,j2,xl,xr,yu,yd,lp,p1:longint;
  map,tmp:array[0..21,0..21] of char;
  p:array[1..25,1..20,1..20] of char;
  ro:array[1..25,1..4] of boolean;
  s:array[0..25] of order;
  v:array[1..20,1..20] of boolean;
  ans:array[1..5,1..5] of char;
  ch:array[1..25] of char;
procedure floodfill(x,y:integer);
var
  i:integer;
begin
  v[x,y]:=true;
  if x<xl then xl:=x;
  if x>xr then xr:=x;
  if y<yd then yd:=y;
  if y>yu then yu:=y;
  for i:=1 to 4 do
    if (map[x+mx[i],y+my[i]]=ch[lp]) and (not v[x+mx[i],y+my[i]]) then
      floodfill(x+mx[i],y+my[i]);
end;
procedure dfs(t:integer);
var
  i,j,i1,j2,sx,sy:integer;
  get:boolean;
begin
  if t>lp then
  begin
    for i:=1 to n do
    begin
      for j:=1 to n do
        write(ans[i,j]);
      writeln;
    end;
    halt;
  end;
  for i:=1 to n do
    for j:=1 to n do
    begin
      sx:=i;sy:=j;
      if (i+s[t,1]<=n) and (j+s[t,2]<=n) then
      begin
        if ro[t,1] then
        begin
          get:=true;
          for i1:=0 to s[t,1] do
          begin
            for j1:=0 to s[t,2] do
            begin
              if p[s[t,0],i1+1,j1+1]=ch[s[t,0]] then
                if ans[sx+i1,sy+j1]='.' then
                  ans[sx+i1,sy+j1]:=ch[s[t,0]]
                else get:=false;
              if not get then break;
            end;
            if not get then break;
          end;
          if get then dfs(t+1);
          for i1:=0 to s[t,1] do
            for j1:=0 to s[t,2] do
              if (p[s[t,0],i1+1,j1+1]=ch[s[t,0]]) and (ans[sx+i1,sy+j1]=ch[s[t,0]]) then
                ans[sx+i1,sy+j1]:='.';
        end;
        if ro[t,4] then
        begin
          get:=true;
          for i1:=0 to s[t,1] do
          begin
            for j1:=0 to s[t,2] do
            begin
              if p[s[t,0],i1+1,j1+1]=ch[s[t,0]] then
                if ans[sx+s[t,1]-i1,sy+s[t,2]-j1]='.' then
                  ans[sx+s[t,1]-i1,sy+s[t,2]-j1]:=ch[s[t,0]]
                else get:=false;
              if not get then break;
            end;
            if not get then break;
          end;
          if get then dfs(t+1);
          for i1:=0 to s[t,1] do
            for j1:=0 to s[t,2] do
              if (p[s[t,0],i1+1,j1+1]=ch[s[t,0]]) and (ans[sx+s[t,1]-i1,sy+s[t,2]-j1]=ch[s[t,0]]) then
                ans[sx+s[t,1]-i1,sy+s[t,2]-j1]:='.';
        end;
      end;
      if (i+s[t,2]<=n) and (j+s[t,1]<=n) then
      begin
        if ro[t,2] then
        begin
          get:=true;
          for i1:=0 to s[t,1] do
          begin
            for j1:=0 to s[t,2] do
            begin
              if p[s[t,0],i1+1,j1+1]=ch[s[t,0]] then
                if ans[sx+j1,sy+s[t,1]-i1]='.' then
                  ans[sx+j1,sy+s[t,1]-i1]:=ch[s[t,0]]
                else get:=false;
              if not get then break;
            end;
            if not get then break;
          end;
          if get then dfs(t+1);
          for i1:=0 to s[t,1] do
            for j1:=0 to s[t,2] do
              if (p[s[t,0],i1+1,j1+1]=ch[s[t,0]]) and (ans[sx+j1,sy+s[t,1]-i1]=ch[s[t,0]]) then
                ans[sx+j1,sy+s[t,1]-i1]:='.';
        end;
        if ro[t,3] then
        begin
          get:=true;
          for i1:=0 to s[t,1] do
          begin
            for j1:=0 to s[t,2] do
            begin
              if p[s[t,0],i1+1,j1+1]=ch[s[t,0]] then
                if ans[sx+s[t,2]-j1,sy+i1]='.' then
                  ans[sx+s[t,2]-j1,sy+i1]:=ch[s[t,0]]
                else get:=false;
              if not get then break;
            end;
            if not get then break;
          end;
          if get then dfs(t+1);
          for i1:=0 to s[t,1] do
            for j1:=0 to s[t,2] do
              if (p[s[t,0],i1+1,j1+1]=ch[s[t,0]]) and (ans[sx+s[t,2]-j1,sy+i1]=ch[s[t,0]]) then
                ans[sx+s[t,2]-j1,sy+i1]:='.';
        end;
      end;
    end;
end;
begin
  fillchar(map,sizeof(map),'.');
  readln(n);
  for i:=1 to 20 do
  begin
    for j:=1 to 20 do
      read(map[i,j]);
    readln;
  end;
  fillchar(v,sizeof(v),false);
  lp:=0;
  for i:=1 to 20 do
    for j:=1 to 20 do
      if (map[i,j]<>'.') and (not v[i,j]) then
      begin
        xl:=i;xr:=i;
        yu:=j;yd:=j;
        inc(lp);
        ch[lp]:=map[i,j];
        floodfill(i,j);
        s[lp,0]:=lp;
        s[lp,1]:=xr-xl;
        s[lp,2]:=yu-yd;
        for j1:=xl to xr do
          for j2:=yd to yu do
            if map[j1,j2]=ch[lp] then
              p[lp,j1-xl+1,j2-yd+1]:=ch[lp]
            else p[lp,j1-xl+1,j2-yd+1]:='.';
      end;
  for i:=1 to lp do
  begin
    p1:=i;
    for j:=i+1 to lp do
      if (s[j,1]+1)*(s[j,2]+1)>(s[p1,1]+1)*(s[p1,2]+1) then
        p1:=j;
    s[0]:=s[i];s[i]:=s[p1];s[p1]:=s[0];
  end;
  fillchar(ro,sizeof(ro),true);
  for i:=1 to lp do
  begin
    for j1:=0 to s[i,1] do
      for j2:=0 to s[i,2] do
        tmp[s[i,1]-j1+1,s[i,2]-j2+1]:=p[s[i,0],j1+1,j2+1];
    ro[i,4]:=false;
    for j1:=1 to s[i,1]+1 do
    begin
      for j2:=1 to s[i,2]+1 do
        if tmp[j1,j2]<>p[s[i,0],j1,j2] then
        begin
          ro[i,4]:=true;
          break;
        end;
      if ro[i,4] then break;
    end;
    if s[i,1]=s[i,2] then
    begin
      ro[i,2]:=false;
      for j1:=0 to s[i,1] do
        for j2:=0 to s[i,2] do
          tmp[j2+1,s[i,1]-j1+1]:=p[s[i,0],j1+1,j2+1];
      for j1:=1 to s[i,1]+1 do
      begin
        for j2:=1 to s[i,2]+1 do
          if tmp[j1,j2]<>p[s[i,0],j1,j2] then
          begin
            ro[i,2]:=true;
            break;
          end;
        if ro[i,2] then break;
      end;
      ro[i,3]:=false;
      for j1:=0 to s[i,1] do
        for j2:=0 to s[i,2] do
          tmp[s[i,2]-j2+1,j1+1]:=p[s[i,0],j1+1,j2+1];
      for j1:=1 to s[i,1]+1 do
      begin
        for j2:=1 to s[i,2]+1 do
          if tmp[j1,j2]<>p[s[i,0],j1,j2] then
          begin
            ro[i,3]:=true;
            break;
          end;
        if ro[i,3] then break;
      end;
    end;
  end;
  fillchar(ans,sizeof(ans),'.');
  dfs(1);
end.
