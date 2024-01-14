var x,y:integer;

begin
writeln('enter x: ');
readln(x);
writeln('enter y: ');
readln(y);

while x<>y do begin 
  if x>y then
    begin
      x:=x-y;
    end
  else 
    begin
      y:=y-x;
    end;
end;

Write('NOD= ', x);
end. 