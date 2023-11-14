{ввести последовательность маленьких латинских букв, 
нужно посчитать сколько в этой последовательности гласных }

{a,o,u,e,i}


//type M = set of 'a'..'z';
var 

  a:char;
  k,i:integer;

begin
k:=0;
read(a)
while a<>'.' do begin
  if a in ['a','o','u','e','i'] then k:=k+1;
  read(a);
end;

writeln(k);
end.
