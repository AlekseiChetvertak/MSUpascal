program RecursiveListInputExample;

type
  PNode = ^Node;
  Node = record
    deg: Integer;
    kof: Integer;
    link: PNode;
  end;

var
  polynom: PNode;
  input:integer;

//процедура ввода полинома
procedure EnteringPolynom(var pol: PNode; koef, degr: Integer);
begin
  if pol = nil then
  begin
    // Если список пуст, создаем новый узел
    New(pol);
    pol^.kof := koef;
    pol^.deg := degr;
    pol^.link := nil;
  end
  else
  begin
    // Рекурсивно вызываем процедуру для следующего узла
    EnteringPolynom(pol^.link, koef, degr);
  end;
end;

//процедуры (очистка памяти)
 procedure clearmemory(var pol:PNode);
  var nextNode:PNode;
  begin
  while pol <> nil do
  begin
    nextNode:= pol^.link;
    Dispose(pol);
    pol := nextNode;
  end;
  end;
// процедура для ввода многочлена с клавиатуры и его преобразования в список
procedure UserEnterPolynom(var p:PNode);
var s: string; // строка для хранения многочлена
  i, k, a: integer; // переменные для циклов и вычислений
  sign: char; // знак одночлена
begin
  p := nil; // инициализируем список
  write('Введите многочлен: ');
  readln(s); // считываем многочлен
  s := s + ' ';
  i := 1;

  while s[i] <> ' ' do // пока не достигнем конца строки
  begin
  sign := '+'; // по умолчанию знак одночлена положительный
  if s[i] in ['+', '-'] then // если встретили знак
    begin
    sign := s[i];
    i := i + 1; 
  end;

  if s[i] = '0' then // если встретили нулевой многочлен
  begin
    EnteringPolynom(p, 0, 0); // создаем звено с нулевой степенью и коэффициентом
    break;
  end;

  // если встретили одночлен или a :
  a := 1; // дефолтный коэффициент
  k := 0; // дефолтное значение степени
  if s[i] <> 'X' then begin 
    a := 0; // обнуляем коэффициент
    while s[i] in ['0'..'9'] do begin
      a := a * 10 + ord(s[i]) - ord('0'); // вычисляем коэффициент
      i := i + 1; 
      end;
  end;
  if sign = '-' then a := -a;
  if s[i] = 'X' then 
  begin
  i := i + 1; 
  k := 1;
  if s[i] = '^' then 
  begin
    i := i + 1; 
    k := 0;
    while s[i] in ['0'..'9'] do begin
      k := k * 10 + ord(s[i]) - ord('0'); // вычисляем степень
      i := i + 1; 
    end;
  end;
  end;
      EnteringPolynom(p, a, k); // создаем звено с соответствующей степенью и коэффициентом
  end;
  //sort(p);
end;

//процедура вывода многочлена
procedure PrintList(Head: PNode);
begin
  // Вывод элементов списка
  while Head <> nil do
  begin
    if ((Head^.kof = 1) and (Head^.deg <> 0))then begin
      Write('x^',Head^.deg)
    end
    else if (Head^.kof = 0) then write('')
    else if (head^.deg = 0) then
    begin
      write(Head^.kof);
    end
    else Write( Head^.kof, 'x^', Head^.deg);
    Head := Head^.link;
    if (Head <> nil) and (Head^.kof <> 0) then Write(' + ');
  end;
  Writeln;
end;
function power(x, deg: integer): integer;
var
  res, i: integer;
begin
  res := 1; // Initialize res to 1
  for i := 1 to deg do
  begin
    res := res * x;
  end;
  power := res;
end;

function countingval(Head: PNode; x: integer): integer;
var
  p: PNode;
  sum: integer;
begin
  sum := 0;
  p := Head; // Corrected case for Head
  while p <> nil do
  begin
    sum := sum + p^.kof * power(x, p^.deg);
    p := p^.link;
  end;
  countingval := sum; // Added the result assignment
end;


//тело 
begin
  // Инициализация начала списка
  polynom := nil;
  UserEnterPolynom(polynom); //ввод 

write('enter x:');
read(input);
writeln('COUNTED WITH X: ',countingval(polynom,input));

  // Вывод списка
  Write('List: ');
  PrintList(polynom);

  writeln();
  
  // Освобождение памяти, занятой списком
 clearmemory(polynom);
end.
