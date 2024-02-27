{
  Стек – хранилище однотипных объектов, работающее по принципу LIFO (last in – first out):
– новые объекты добавляюся в конец последовательности (push)
– элементы удаляются из конца последовательности (pop)

Представлена реализация стека с помощью массива

}

const N = 100;

type stack = record 
            S:array[0..n] of char;
            top: 0..N;
          end;
//--------------
procedure initSt(var St:stack); //инициализация
begin
  St.top := 0;
end;
//--------------
function isEmptySt(var St:stack):boolean;
begin
  isEmptySt := St.top = 0 //isEmptySt := true,only if (St,top = 0) = true
end;
//--------------
procedure push(x:char;var St:stack);
begin
  St.top := St.top + 1;
  St.S[St.top] := x;
end;
//--------------
procedure pop(var St:stack;var x:char);
begin
  x := St.S[St.top]; //сохраняем последний элемент
  St.top := St.top - 1; //номер последнего уменьшаем на один
end;
//--------------
procedure print(St:stack);
var i:integer;
begin
  for i:=0 to St.top do begin
    if i=St.top then 
      Write(St.S[i], ' <- TOP]') 
    else
    begin
      write(St.S[i], '|');
    end;
  end;
end;
//--------------

procedure from


var a:char; mainstack:stack;
//main
begin
  writeln('enter stack');
  repeat
    read(a);
    if ((a <> '.') and (a <> ' ')) then 
    begin
      push(a,mainstack);
    end;
  until (a = '.');

  print(mainstack);

  a := 'G';
  pop(mainstack,a);
  writeln();
  writeln(a,' <- last element popped');
  print(mainstack);

end.