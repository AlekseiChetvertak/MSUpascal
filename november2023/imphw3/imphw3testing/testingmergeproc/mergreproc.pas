program edm;

const sm = 100;
type massiv = array[1..sm] of LongInt; 

var mainarr:massiv;
    mainarrcopy:massiv;
    sortkey,k:integer;
    n:integer; //пользователь вводи в эту переменную длину массива
    movement1,comparison1,movement2,comparison2:integer;
    Result:Boolean;
    program_mode:integer;
    
//процедура ввода массива(здесь же можно посчитать минимальный элемент)
procedure enteringmassiv(var arr:massiv);
var i:integer;
begin
  writeln('please enter a mas ');
  for i := 1 to n do begin
    read(arr[i]);
    mainarrcopy[i] := mainarr[i];
    end;
  end;

//debug

procedure debug(tmparr:massiv;tmp:integer;comp:integer;l:integer;r:integer);
var c:integer;

begin
  writeln;
  for c := 1 to n do begin
  write(tmparr[c],' ');
  end;
  writeln;
  writeln('temp memory:',tmp);
  writeln(l, ' <>/=/>/< ', r);
  writeln('the number of comparison: ', comp);
  //writeln('the number of swaps' );
end;


procedure selectionsort(var arr:massiv;stype:integer);
var i,j,max,tmp:integer; 
// i - счетчик внешнего цикла, j - пробегает по массиву, //max - сохраняет номер минимального
begin
  writeln('--------------------------------');
  writeln('SORT N1: SELECTION SORT.');
  write('Source sequence: ');
  for k := 1 to n do begin
    write(mainarr[k],' ');
  end;
    i := 1;
    while (i <= n - 1) do begin
      max:=i; //каждый новый проход будем стартовать не рассматривая первый элемент
      for j := i + 1 to n do begin
        if ((stype*arr[j]) > (arr[max]*stype)) then
        begin
          comparison1 := comparison1 + 1;
          max := j;
        end
        else comparison1 := comparison1 + 1;
      end;
      tmp:= arr[i];
      arr[i] := arr[max];
      arr[max]:= tmp;
      movement1 := movement1+1;
      if ((program_mode) = 2) then debug(arr,tmp,comparison1,arr[j],arr[max]);//добавить условие включения и сообщение
      i := i+1;
    end;
end;



  

//тело кода
begin

comparison1:=0;
comparison2:=0;
movement1:=0;
movement2:=0;
writeln('enter the lenght of array: ');
read(n);
enteringmassiv(mainarr);

WriteLn('please choose one of 2 sort types:');
writeln('1 - inc');
writeln('2 - dec');
write('enter your preffered sort:'); 
read(sortkey);


writeln('please enter program mode:');
writeln('(1 - release)or  (2 - debug)');
read(program_mode);

//selection sort
case sortkey of
  1:selectionsort(mainarr,-1); 
  2:selectionsort(mainarr,1);
  end;
//вывод
writeln();
write('sorted sequence: ');
for k:=1 to n do begin
  write(mainarr[k],' ');
end;
writeln;
writeln('number of comparison = ', comparison1);
writeln('number of movements = ', movement1);
//Пробелы
for k:=0 to 2 do begin 
  writeln;
end;


end.