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
  input:Integer;

//функция возведения в степень
function degree(a:integer; n:integer):integer;
var i:integer;
begin
  for i:=1 to n do begin
    a:=a*n;
  end;
  degree:=a;
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

function countingval(Head:PNode; x:integer):integer;
var koef1,deg1,sum:integer;
begin
sum:=0;
while Head <> nil do
  begin
  koef1:=head^.kof;
  deg1:= head^.kof;
  sum:= sum + (koef1 * (degree(x,deg1)));
  Head := Head^.link;
	end;
  countingval:=sum;
end;


//тело 
begin
  // Инициализация начала списка
  polynom := nil;

  // Рекурсивный ввод элементов в список
  EnteringPolynom(polynom, 3, 2);
  EnteringPolynom(polynom, 1, 5);
  EnteringPolynom(polynom, 3, 2);

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
