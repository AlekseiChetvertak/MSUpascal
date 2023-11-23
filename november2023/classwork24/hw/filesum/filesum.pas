const
  nameoffile = 'chisla.txt';
var
  t: text;
// процедура выводит содержание файла
procedure print(var m: text);
var
  c: char;
begin
  assign(m, nameoffile);
  reset(m);
  while not eof(m) do
  begin
    read(m, c);
    write(c);
  end;
  close(m);
end;

// функция которая считает сумму
function summ(var m: text): integer;
var
  num: integer;
begin
  num := 0;
  summ:=0;
  assign(m, nameoffile);
  reset(m);
  while not eof(m) do
  begin
    read(m, num);
    summ := summ + num;
  end;
  close(m);
end;

// main
begin
  print(t);
  writeln;
  writeln('sum of text = ',summ(t));
end.
