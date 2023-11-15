program homework;
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
  end;
end.