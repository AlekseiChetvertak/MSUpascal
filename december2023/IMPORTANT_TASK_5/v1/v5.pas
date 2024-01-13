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
var
  currentNode: PNode;
begin
  currentNode := pol;

  // проверка на существование совпадений
  while (currentNode <> nil) and (currentNode^.deg <> degr) do
  begin
    currentNode := currentNode^.link;
  end;

  if currentNode <> nil then
  begin
    // если одинаковая степень найдена, обновим коэф
    currentNode^.kof := currentNode^.kof + koef;
  end
  else
  begin
    // если нет,то просто создадим новый
    New(currentNode);
    currentNode^.kof := koef;
    currentNode^.deg := degr;
    currentNode^.link := pol;
    pol := currentNode;
  end;
end;

//процедуры (очистка памяти)
 procedure clearmemory(var pol:PNode);
  var nextNode:PNode;
  begin
  while pol <> nil do
  begin
    nextNode := pol^.link;
    Dispose(pol);
    pol := nextNode;
  end;
  end;

// процедура ввода с клавиатуры
procedure UserEnterPolynom(var p:PNode;var val:boolean);
var s:char; // строка для хранения многочлена
  deg, kof:integer; // переменные для циклов и вычислений
  sign:char; // знак одночлена
  isFirstTerm:Boolean;//проверка на ввод неправильного первого числа
begin
  p := nil; // инициализируем список
  write('Введите многочлен: ');
  read(s); // считываем многочлен //fix2
  isFirstTerm:=True;
  while s <> ' ' do // до конца строки
  begin
  //проверка ввода
    if (s in ['+','-',' ']) or (s in ['1'..'9']) or (s = 'X') or (s = '^') then
    begin
    if not((isFirstTerm) and ((not(s in ['1'..'9'])) or (not(s = 'X')))) then begin
      isFirstTerm:=False;
    end;
    val:=true;
    end
    else begin
      writeln('mistake', s);
      val:=false;
      exit;
    end;
 
  sign := '+';
  if s in ['+', '-'] then // если встретили знак
    begin
    sign := s;
    read(s); 
  end;

  if s = '0' then // если встретили нулевой многочлен
  begin
    EnteringPolynom(p, 0, 0); 
    break;
  end;

 
  kof := 1; //инициализация
  deg := 0; 
  if s <> 'X' then begin 
    kof := 0; // обнуляем коэффициент
    while s in ['0'..'9'] do begin
      kof := kof * 10 + ord(s) - ord('0'); // вычисляем коэффициент
      read(s);
      end;
  end;
  if sign = '-' then kof := -kof;
  if s = 'X' then 
  begin
  read(s);
  deg := 1;
  if s = '^' then 
  begin
    read(s);
    deg := 0;
    while s in ['0'..'9'] do begin
      deg := deg * 10 + ord(s) - ord('0'); // вычисляем степень
      read(s);
    end;
  end;
  end;
      EnteringPolynom(p, kof, deg); // создаем звено с соответствующей степенью и коэффициентом
  end;
end;

//процедура вывода многочлена
procedure PrintList(Head: PNode);
var
  isFirstTerm: Boolean; // флаг для отслеживания первого члена
begin
  isFirstTerm := True; // инициализация флага
  // Вывод элементов списка
  while Head <> nil do
  begin
    if (Head^.kof <> 0) then
    begin
      if isFirstTerm then
      begin
        Write(Head^.kof);
        isFirstTerm := False;
      end
      else
      begin
        if (Head^.kof > 0) then
          Write('+');
        Write(Head^.kof);
      end;
      if (Head^.deg <> 0) then
      begin
        Write('x^', Head^.deg);
      end;
    end;
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

//подсчет значения при заданном X
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
  clearmemory(polynom);
  exit;
end;
end.
