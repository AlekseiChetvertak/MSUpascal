program start;
const n = 9;
var 
a:char;
charscounter:integer;
isvalid:boolean;

begin

read(a);
charscounter:=0;
while (a <> '.')  do 
begin
  if (a < 'a') or (a > 'z') then begin
    writeln('a = ',a);
    writeln('ошибка ввода');
    exit;
  end;
  charscounter := charscounter + 1;
  read(a);

  if (a = '.') then
  begin
    writeln('false: no number at the end');
  end;

  if ((a >= '1') and (a <= '9')) then
  if charscounter = (ord(a)-ord('0')) then begin
    read(a);
    if a = '.' then //после ПРАВИЛЬНОЙ цифры идет точка - слово введено верно
    begin
      writeln('True');
      exit;
    end;
  end else 
  begin
    writeln('false');
    exit;
  end;
end;

if (charscounter = 1) and (a = ' ') then
begin 
  read(a);
  if (a = '.') then begin  
    WriteLn('пустое слово');
    exit;
  end;
end;
if charscounter > 9 then
begin
  writeln('ошибка: слово слишком длинное');
  exit;
end;
end.