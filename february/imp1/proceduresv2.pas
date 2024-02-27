unit proceduresv2;
interface

type
  // Define function types for f, f1, and f2
  TFunction = function(x: real): real;

function fminusg(f,g:TFunction; a:real): real;
function power(num:real;deg:integer):real;

implementation
function power(num:real;deg:integer):real;
var
    res: real;
    i: byte;
begin
  res:=1;
  for i := 1 to abs(deg) do
      res := res * num;
  if deg < 0 then
      res := 1 / res;
  power:=res;
end; 

function fminusg(f,g:TFunction; a:real): real;
begin
  fminusg:=f(a)-g(a);
end;

//комбинированный метод
function root(f:TFunction; f1: TFunction; a, b, epsilon: Real): Real;
var
    x0, x1, x2: Real;
begin
    x0 := a;
    repeat
        // Метод касательных для быстрого приближенного нахождения корня
        x1 := x0 - f(x0) / f1(x0);
        // Переключение на метод хорд
        x2 := (x0 * f(x1) - x1 * f(x0)) / (f(x1) - f(x0));

        if abs(x2 - x0) < epsilon then
        begin
            root := x2; // Корень найден с достаточной точностью
            exit;
        end;
        
        x0 := x2; // Обновляем приближение для следующей итерации
    until false;
end;
end.