const n = 2;
var i:LongInt;

//функцией
function convertingfun(decimalNumber: Longint): Longint;
begin
  if decimalNumber = 0 then
    convertingfun := 0
  else
    convertingfun := (convertingfun(decimalNumber div n)) * 10 + (decimalNumber mod n);
end;

//процедурой 
procedure converting(decimalNumber: Longint);
begin
  if decimalNumber > 0 then
  begin
    converting(decimalNumber div n);
    write(decimalNumber mod n);
  end;
end;

//тело

begin
  i := 109;
  writeln('after converting = ', convertingfun(i));
end.
