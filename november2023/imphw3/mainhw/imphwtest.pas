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


procedure sortmasdes(var arr:massiv);
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
        if arr[j] > arr[max] then
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


procedure sortmasinc(var arr:massiv);
var i,j,min,tmp:integer; 
// i - счетчик внешнего цикла, j - пробегает по массиву, //min - сохраняет номер минимального
begin
  writeln('--------------------------------');
  writeln('SORT N1: SELECTION SORT.');
  write('Source sequence: '); //вывод изначальных данных
  for k := 1 to n do begin
    write(mainarr[k],' ');
  end;

    i := 1;
    while (i <= n-1) do begin
      min := i; //каждый новый проход будем стартовать не рассматривая первый элемент
      for j := i+1 to n do begin
        if arr[j]< arr[min] then
        begin
          comparison1 := comparison1+1;
          min := j;
        end;
      end;
      tmp := arr[i];
      arr[i] := arr[min];
      arr[min] := tmp;
      movement1 := movement1 + 1;
      if ((program_mode) = 2) then debug(arr,tmp,comparison1,arr[j],arr[min]);
      i := i + 1;
    end;
  end;



//по возрастанию
procedure merge(var arr:massiv;left,mid,right:integer);
var
i,j,k:integer; // счетчики
n1,n2:integer;//длины
L,R:massiv;
begin

  n1:=mid - left + 1;
  n2:=right - mid;

  for i := 1 to n1 do 
    L[i] := arr[left + i - 1];
  for j := 1 to n2 do
    R[j] := arr[mid + j];

  i := 1;
  j := 1;
  k := left;

  //слияние двух подмассивов в исходный массив arr
  while (i <= n1) and (j <= n2) do
  begin
    if L[i] <= R[j] then
    begin
      arr[k]:=L[i];
      i := i + 1;
    end
    else
    begin
      arr[k] := R[j];
      j := j+1;
    end;
    comparison2 := comparison2 + 1;
    movement2 := movement2 + 1;
    if ((program_mode) = 2) then debug(arr,0,arr[k],L[i],R[i]);
    k := k+1;
  end;
  //копирование оставшихся элементов из подмасива L(если R кончился быстрее)
  while i<= n1 do
  begin
    arr[k]:= L[i];
    i:=i+1;
    k:=k+1;
  end;

  while j<= n2 do
    begin
      arr[k]:=R[j];
      j:=j+1;
      k:=k+1;
    end;
end;

//по убыванию
procedure mergedes(var arr:massiv;left,mid,right:integer);
var

i,j,k:integer; // счетчики
n1,n2:integer;//длины
L,R:massiv;
begin

  n1:=mid - left + 1;
  n2:=right - mid;

  for i:=1 to n1 do 
    L[i]:=arr[left + i - 1];
  for j:=1 to n2 do
    R[j]:=arr[mid + j];

  i:=1;
  j:=1;
  k:=left;

  //слияние двух подмассивов в исходный массив arr
  while (i <= n1) and (j <= n2) do
  begin
    if L[i] >= R[j] then
    begin
      arr[k]:=L[i];
      i:=i+1;
    end
    else
    begin
      arr[k] := R[j];
      j:=j+1;
    end;
    comparison2 := comparison2 + 1;
    movement2 := movement2 + 1;
  if ((program_mode) = 2) then debug(arr,0,comparison2,L[i],R[j]);
    k := k + 1;
  end;
  //копирование оставшихся элементов из подмасива L(если R кончился быстрее)
  while i<= n1 do
  begin
    arr[k]:= L[i];
    i:=i+1;
    k:=k+1;
  end;

  while j<= n2 do
    begin
      arr[k]:=R[j];
      j:=j+1;
      k:=k+1;
    end;
end;


procedure merge_sort(var arr:massiv; left,right:integer);
var
mid:integer;
begin

  if left<right then
  begin
    begin
      mid:=(left+right) div 2;

      merge_sort(arr,left,mid);
      merge_sort(arr,mid+1,right);

      if sortkey = 1 then
      begin
        merge(arr,left,mid,right);
      end
      else if sortkey = 2 then
      begin
        mergedes(arr,left,mid,right);
      end;
      
    end;
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
  1:sortmasinc(mainarr); 
  2:sortmasdes(mainarr);
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

//вторая сортировка
writeln('SORT TYPE 2 - MERGE SORT.');
write('source sequence: ');
for k:=1 to n do begin
  write(mainarrcopy[k],' ');
end;
merge_sort(mainarrcopy, 1,n);
writeln();
write('sorted sequence: ');
for k:=1 to n do begin
  write(mainarrcopy[k],' ');
end;
writeln;
writeln('number of comparison = ', comparison2);
writeln('number of movements = ', movement2);
end.