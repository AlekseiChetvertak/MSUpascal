unit proceduresv2;
interface

type
  // Define function types for f, f1, and f2
  TFunction = function(x: real): real;

function fminusg(f,g:TFunction; a:real): real;
function power(num:real;deg:integer):real;
function root(f:TFunction; f1: TFunction; a, b, epsilon: Real;mode:Byte): Real;
function integral (f:TF; a, b, I1:real; n:integer; mode, num:integer):real; 


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
function root(f:TFunction; f1: TFunction; a, b, epsilon: Real;mode:Byte): Real;
var
    x0, x1, x2: Real;
begin
    x0 := a;
    repeat
        // Метод касательных для быстрого приближенного нахождения корня
        x1 := x0 - f(x0) / f1(x0);
        // Переключение на метод хорд
        x2 := (x0 * f(x1) - x1 * f(x0)) / (f(x1) - f(x0));
        if mode = 1 then begin
          writeln('метод касательных');
          writeln('x1 = ',x1);
          writeln('переключение на метод хорд');
          writeln('x2 = ', x2);
        end;
        if abs(x2 - x0) < epsilon then
        begin
            root := x2; // Корень найден с достаточной точностью
            exit;
        end;

        x0 := x2; // Обновляем приближение для следующей итерации
    until false;
end;


function integral (f:TF; a, b, I1:real; n:integer; mode, num:integer):real; //нахождение площади криволинейной трапеции
var i:integer;
h, sum, I2: real;
begin
  if(a > b) then
  begin
    h:=a;
    a:=b;
    b:=h;
  end;
  
  if(mode = 1) then
  begin
    num:=num+1;
    debug('Integral: ', I1, 'number of segments:', n, 'iteration number:', num); 
  end;
  
  sum:=0;
  h:=(b - a) / n;
  for i:=1 to n - 1 do
    sum:=sum + f(a + i*h);
  I2:=h * (0.5 * f(a) + sum + 0.5 * f(b));
  
  if (1.3 * abs(I1 - I2) < eps2) then 
    integral:=I2
  else 
    integral:=integral(f, a, b, I2, n * 2,  mode, num);
end;

end.