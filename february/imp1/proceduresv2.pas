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

//метод симпсона
function integral (f:TF; a, b, I1:real; n:integer; mode, num:integer):real;
var
  i: integer;
  h, sum_odd, sum_even, x: real;
begin
  if (a > b) then
  begin
    h := a;
    a := b;
    b := h;
  end;

  if (mode = 1) then
  begin
    num := num + 1;
    debug('Integral: ', I1, ' number of segments:', n, ' iteration number:', num);
  end;

  sum_odd := 0;
  sum_even := 0;
  h := (b - a) / n;

  for i := 1 to n - 1 do
  begin
    x := a + i * h;
    if (i mod 2 = 0) then
      sum_even := sum_even + f(x)
    else
      sum_odd := sum_odd + f(x);
  end;

  integralSimpson := (h / 3) * (f(a) + 4 * sum_odd + 2 * sum_even + f(b));
end;

end.