{
    экзамен. Задание 3
    функция должна заменить первую цифру ненулевого числа на 2. например f2(543)=243
    
}
function f2(a:integer):integer;
begin
    if ((a <= 9) and (a >= 1)) then
    begin
      f2:=2;
      exit;
    end
    else 
         f2 := f2(a div 10) * 10 + a mod 10;
        
end;
var inp:integer;
begin
readln(inp);
writeln(f2(inp));
end.