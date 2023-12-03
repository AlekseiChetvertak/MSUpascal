program edm;
const n= read(n);
var
i:integer;
x:array[1..n] of LongInt; //на случай если кончится память

begin
 writeln('please enter a mas ');
 for i:=1 to n do begin
  read(x[i]);
 end;

for i:=1 to n do begin
  write(x[i],' ');
end;


end.