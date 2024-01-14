{sum of digits: 123 => 1+2+3=6}

var a,sum,n:integer;

begin
sum := 0;
n   := 0;
writeln('enter a: '); read(a);

  while a <> 0 do begin
    n := a mod 10; // n = last digit
    writeln('last digit: ',n );
    sum := sum + n;
    writeln('sum now is ', sum);
    a := a div 10; // deleting last digit
    writeln('a: ',a );
    writeln('^^^^^^^^^^^^^^^^^^^^^');
  end;
  writeln('-----------');
  writeln('FINAL SUM = ', sum);

end.