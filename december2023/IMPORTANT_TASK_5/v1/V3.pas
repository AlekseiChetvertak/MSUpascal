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
  validation:Boolean;
  

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

// процедура ввода с клавиатуры
procedure UserEnterPolynom(var p:PNode;var val:boolean);
var s: string; // строка для хранения многочлена
  k,i, deg, kof: integer; // переменные для циклов и вычислений
  sign: char; // знак одночлена
begin
  p := nil; // инициализируем список
  write('Введите многочлен: ');
  read(s); // считываем многочлен //fix2
  s := s + ' ';
  i := 1;

  while s[i] <> ' ' do // до конца строки
  begin
  //проверка ввода
  for k:=1 to Length(s) do begin //fix1
    if (s[k] in ['+','-',' ']) or (s[k] in ['1'..'9']) or (s[k] = 'X') or (s[k] = '^') then
    begin
    val:=true;
    end
    else begin
      writeln('mistake', s[k]);
      val:=false;
      exit;
    end;
  end; 
  sign := '+';
  if s[i] in ['+', '-'] then // если встретили знак
    begin
    sign := s[i];
    i := i + 1; 
  end;

  if s[i] = '0' then // если встретили нулевой многочлен
  begin
    EnteringPolynom(p, 0, 0); 
    break;
  end;

 
  kof := 1; //инициализация
  deg := 0; 
  if s[i] <> 'X' then begin 
    kof := 0; // обнуляем коэффициент
    while s[i] in ['0'..'9'] do begin
      kof := kof * 10 + ord(s[i]) - ord('0'); // вычисляем коэффициент
      i := i + 1; 
      end;
  end;
  if sign = '-' then kof := -kof;
  if s[i] = 'X' then 
  begin
  i := i + 1; 
  deg := 1;
  if s[i] = '^' then 
  begin
    i := i + 1; 
    deg := 0;
    while s[i] in ['0'..'9'] do begin
      deg := deg * 10 + ord(s[i]) - ord('0'); // вычисляем степень
      i := i + 1; 
    end;
  end;
  end;
      EnteringPolynom(p, kof, deg); // создаем звено с соответствующей степенью и коэффициентом
  end;
end;


//процедура вывода многочлена
procedure PrintList(Head: PNode); //fix3
begin
  // Вывод элементов списка
  while Head <> nil do
  begin
    if (Head^.kof = 1) and (Head^.deg <> 0) then
    begin
      Write('x^', Head^.deg);
    end
    else if (Head^.kof = -1) and (Head^.deg <> 0) then
    begin
      Write('-x^', Head^.deg);
    end
    else if (Head^.kof = 0) then
    begin
      write('');
    end
    else if (Head^.kof < 0) then
    begin
      Write(Head^.kof, 'x^', Head^.deg);
    end
    else if (head^.deg = 0) then
    begin
      write(Head^.kof);
    end
    else
      Write('+', Head^.kof, 'x^', Head^.deg);
    Head := Head^.link;
  end;
  Writeln;
end;

//функция возведения в степень
function power(x, deg: integer): integer;
var
  res, i: integer;
begin
  res := 1; 
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
  p := Head;
  while p <> nil do
  begin
    sum := sum + p^.kof * power(x, p^.deg);
    p := p^.link;
  end;
  countingval := sum; 
end;


//тело 
begin
  // Инициализация начала списка
  polynom := nil;
  UserEnterPolynom(polynom,validation); //ввод 
if validation then //fix1
begin
  write('enter x:');
  read(input);
  writeln('-----------');
  writeln('RESULT: ',countingval(polynom,input));

// Вывод списка
  Write('List: ');
  PrintList(polynom);

  writeln('-----------');

// Освобождение памяти, занятой списком
  clearmemory(polynom);
end else
begin
  writeln('mistake found; program stoped');
  exit;
end;
end.
