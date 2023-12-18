program homework;
const
  n = 50; 
  k = 8;  
type 
  stringk = string[k]; // Строка фиксированной длины
var        
  sl: array [1..n+1] of stringk; // Массив строк
  a: char;              
  i, l: integer;      

//check repetition
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
  l := 0;  // Изначально количество слов равно 0
  while a <> '.' do   
  begin
    while a = ' ' do  //на случай если много пробелов - просто считываем
      read(a);
      
    if a = '.' then break;   //если точка без букв,то остановиться          
    l := l + 1;     
    //входим в слово             
    while (a <> '.') and (a <> ' ') do
    begin
      if not ((a >= 'a') and (a <= 'z')) then begin 
        writeln('Ошибка ввода: латинские буквы');
        exit;
      end;
      if Length(sl[l] + a) > k then begin
        writeln('Ошибка ввода: превышена максимальная длина слова'); 
        exit;
      end;
    if l > n then begin
      writeln('ошибка ввода, слишком много слов');
      exit();
      end;
      //если ошибок нет,то посимвольно заполняем ячейку
      sl[l] := sl[l] + a;
      read(a);
    end;
  end;
//после цикла делаем проверку
  if l<2 then begin
    writeln('ошибка ввода: мало слов');
    exit();
  end;

  for i := 1 to l - 1 do
  begin
    if (sl[i] <> sl[l]) and f(sl[i]) then 
      writeln(sl[i]); // Выводим слова с повторяющимися буквами, за исключением последнего введенного слова
  end;
end.