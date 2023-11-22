{посчитать количество пустых строк в начале файла. Файл создан заранее}

const 
nameoffile = 'file.txt';
var t:text;


function counter(var m:text):integer;
var c:integer;
begin
    c:=0;
    while not eof(m) do
    begin
        if eoln(m)then
        begin
            c:=c+1;
            readln(t);
        end else   
        begin
            break;
        end;
        
    end;
  counter:=c;
end;
//main
begin
    assign(t,nameoffile);
    reset(t);
    writeln(counter(t));
    close(t);
end.