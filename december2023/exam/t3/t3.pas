//процедура копирует информацию из текстового файла f1 в f2, удаляя пустые строки
const filenamef1 = 'f1TestFile.txt';
      filenamef2 = 'f2TestFile.txt';
var f1,f2:text;


procedure copy_f1_to_f2(var F1,F2: text);
var f1char:char;
begin
  reset(F1);
  rewrite(F2);
  while not eof(F1) do begin
    read(F1,f1char);
    if (f1char <> ' ') then write(F2,f1char)
  else 
    read(F1,f1char);
  if eoln(F1) then readln(F1);
  end;
  Close(F1);
  Close(F2);
end;




begin
  assign(f1, filenamef1);
  assign(f2,filenamef2);
  copy_f1_to_f2(f1,f2);
end.
