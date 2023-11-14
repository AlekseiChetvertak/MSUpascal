{program homework;
const
  n = 50;
  k = 8;
type stringk = string[k];
var
  err:integer;
  sl: array [1..n] of stringk;
  a: char;                       
  i, l: integer;               

function f(var s: stringk): boolean;
var
  i: integer;
begin
  f := false;
  for i := 2 to k do           
    if s[1] = s[i] then begin  
      f := true;
      break;
    end;
end;


begin
  writeln('Введите слова');
  read(a);
  l := 0;
  while a <> '.' do   
  begin
    while a = ' ' do 
      read(a);
    if a = '.' then break;             
    l := l + 1;                       
    while (a <> '.') and (a <> ' ') do
    begin
      if not ((a >= 'a') and (a <= 'z')) then begin 
        writeln('Ошибка ввода');
        exit;
    end;
                          
      sl[l] := sl[l] + a;
      read(a);
    end;
  end;
  for i := 1 to l - 1 do
  begin
    if (sl[i] <> sl[l]) and f(sl[i]) then writeln(sl[i]); 
end.}




program homework;
const
  n = 50; // Максимальное количество слов
  k = 8;  // Максимальная длина слова
type 
  stringk = string[k]; // Строка фиксированной длины
var
  err: integer;         // Переменная для отслеживания ошибок
  sl: array [1..n] of stringk; // Массив строк
  a: char;              // Переменная для ввода символов
  i, l: integer;        // Переменные для циклов и счетчиков

// Функция для проверки наличия повторяющихся символов в строке
function f(var s: stringk): boolean;
var
  i: integer;
begin
  f := false;  // Изначально считаем, что повторений нет
  for i := 2 to k do           
    if s[1] = s[i] then begin  
      f := true;  // Если нашли повторяющийся символ, устанавливаем флаг в true и выходим из цикла
      break;
    end;
end;

begin
  writeln('Введите слова');
  read(a);
  l := 0;  // Изначально количество слов равно 0
  while a <> '.' do   
  begin
    while a = ' ' do 
      read(a);
      
    if a = '.' then break;             
    l := l + 1;                       
    while (a <> '.') and (a <> ' ') do
    begin
      if not ((a >= 'a') and (a <= 'z')) then begin 
        writeln('Ошибка ввода');  // Если символ не является буквой, выводим сообщение об ошибке и завершаем программу
        exit;
      end;
      if Length(sl[l] + a) > k then begin
        writeln('Ошибка ввода: превышена максимальная длина слова'); // Если превышена максимальная длина слова, выводим сообщение об ошибке и завершаем программу
        exit;
      end;
      sl[l] := sl[l] + a;
      read(a);
    end;
  end;
  
  for i := 1 to l - 1 do
  begin
    if (sl[i] <> sl[l]) and f(sl[i]) then 
      writeln(sl[i]); // Выводим слова с повторяющимися буквами, за исключением последнего введенного слова
  end;
end.