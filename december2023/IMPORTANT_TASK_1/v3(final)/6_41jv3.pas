program CheckFormat;

var
  inputChar: char;
  letterCount, digitCount: Integer;
  validFormat,toolong: Boolean;

begin
  // Инициализация счетчика букв и цифр
  letterCount := 0;
  digitCount := 0;
  validFormat := True;
  toolong:=False;


  Write('Введите слово: ');

  // Проверка символов
  while True do
  begin
    Read(inputChar);

    if (inputChar = '.') and (letterCount > 0) and (digitCount = 1) then
      Break
    else if (letterCount > 9) then
    begin
      toolong := True;
      Break;
    end
    else if (((inputChar >= 'a') and (inputChar <= 'z')) or ((inputChar >= 'A') and (inputChar <= 'Z'))) and (letterCount < 9) then
      Inc(letterCount)
    else if (inputChar in ['1'..'9']) and (letterCount = (ord(inputChar) - ord('0'))) then
      Inc(digitCount)
    else
    begin
      validFormat := False;
      Break;
    end;
  end;

  // Проверка формата и вывод результата
  if validFormat and (letterCount > 0) and (digitCount = 1) then
    WriteLn('true')
  else
  begin
    WriteLn('false.');
    if (letterCount = 0) then
      writeln('mistake: empty input') else
    if toolong then
      writeln('mistake: input is too long') else
    if (digitCount <> 1) then
      writeln('mistake: digit is incorrect') else
    if (inputChar <> '.') then
      writeln('mistake: no dot at the end');
  end;
end.
