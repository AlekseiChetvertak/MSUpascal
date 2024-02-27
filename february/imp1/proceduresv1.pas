
unit proceduresv1;

interface

type
  // Define function types for f, f1, and f2
  TFunction = function(x: real): real;

procedure methodkasatel(f, f1, f2: TFunction; a, b, e: real);
function root(f:TFunction; f1: TFunction; a, b, epsilon: Real): Real;
function integral(f:TFunction;a,b:Real;n: integer):Real;
function SimpsonIntegration(f:TFunction;a, b, eps: real): real;


implementation

//метод касательных
procedure methodkasatel(f, f1, f2: TFunction; a, b, e: real);
var 
  x, deltax: real;
begin
  if (f(a) * f2(a) > 0) then 
    x := a
  else if f(b) * f2(b) > 0 then 
    x := b
  else
    exit; 
  repeat
    deltax := f(x) / f1(x);
    x := x - deltax;
  until (abs(deltax) < e);
  writeln('корень - ', x:000);
end;
//--------------------------------
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

function integral(f: TFunction; a, b: real; n: integer): real;
var
  epsilon, h, tmpintegral, prevIntegral: real;
  i: integer;
begin
  epsilon := 0.0001; // погрешность здесь
  h := (b - a) / n;
  tmpintegral := f(a) + f(b);

  for i := 1 to n - 1 do
  begin
    if i mod 2 = 0 then
      tmpintegral := tmpintegral + 2 * f(a + i * h)
    else
      tmpintegral := tmpintegral + 4 * f(a + i * h);
  end;

  tmpintegral := tmpintegral * h / 3;

  repeat
    prevIntegral := tmpintegral;
    n := n * 2; // удваиваем количество подотрезков
    h := (b - a) / n;
    tmpintegral := f(a) + f(b);

    for i := 1 to n - 1 do
    begin
      if i mod 2 = 0 then
        tmpintegral := tmpintegral + 2 * f(a + i * h)
      else
        tmpintegral := tmpintegral + 4 * f(a + i * h);
    end;

    tmpintegral := tmpintegral * h / 3;
  until abs(tmpintegral - prevIntegral) < epsilon;

  integral := tmpintegral;
end;

function SimpsonIntegration(f:TFunction;a, b, eps: real): real;
var
  I, I1, h, sum2, sum4, sum: Double;
  N, k: Integer;
begin
  I := eps + 1;
  I1 := 0;
  N := 2;

  repeat
    h := (b - a) / (2 * N); // Шаг интегрирования.
    sum2 := 0;
    sum4 := 0;
    sum := 0;

    for k := 1 to 2 * N - 1 do
    begin
      sum4 := sum4 + f(a + h * k); // Значения с нечётными индексами, которые нужно умножить на 4.
      sum2 := sum2 + f(a + h * (k + 1)); // Значения с чётными индексами, которые нужно умножить на 2.
    end;

    sum := f(a) + 4 * sum4 + 2 * sum2 - f(b); // Отнимаем значение f(b) так как ранее прибавили его дважды.
    I := I1;
    I1 := (h / 3) * sum;
    N := N * 2;
  until (N > 4) and (abs(I1 - I) <= eps);

  SimpsonIntegration := I1;
end;





end.
