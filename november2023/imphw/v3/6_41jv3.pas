program CheckFormat;

var
  inputChar: char;
  letterCount, digitCount: Integer;
  validFormat: Boolean;

begin
  // Инициализация счетчика букв и цифр
  letterCount := 0;
  digitCount := 0;
  validFormat := True;

  Write('Введите слово: ');

  // Проверка символов
  while True do
  begin
    Read(inputChar);

    if (inputChar = '.') and (letterCount > 0) and (digitCount > 0) then
      Break
    else if (((inputChar >= 'a') and (inputChar <= 'z')) or ((inputChar >= 'A') and (inputChar <= 'Z'))) and (letterCount < 9) then
      Inc(letterCount)
    else if (inputChar in ['1'..'9']) and (letterCount = (ord(inputChar)-ord('0'))) then
      Inc(digitCount)
    else
    begin
      validFormat := False;
      Break;
    end;
  end;

  // Проверка формата и вывод результата
  if validFormat and (letterCount > 0) and (digitCount = 1) and (inputChar = '.') then
    WriteLn('true')
  else
    WriteLn('false');
end.
0