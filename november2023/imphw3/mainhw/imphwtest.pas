program edm;

const n=5;
type massiv = array[1..n] of LongInt; 

var mainarr:massiv;
    sortedarr1:massiv;
    sortkey,k:integer;
    


//процедура ввода массива(здесь же можно посчитать минимальный элемент)
procedure enteringmassiv(var arr:massiv);
var i:integer;
begin
  writeln('please enter a mas ');
  for i:=1 to n do begin
    read(arr[i]);
  end;
  {for i:=1 to n do begin
    write(arr[i],' ');
  end;}
end;

procedure sortmas1(var arr:massiv);
var i,j,min,tmp:integer; 
// i - счетчик внешнего цикла, j - пробегает по массиву, //min - сохраняет номер минимального
begin
writeln('SORT N1: merge sort.');
write('Source sequence: ');


for k:=1 to n do begin
  write(mainarr[k],' ');
end;
writeln();
write('=============================');
  i:=1;
  while (i <= n-1) do begin
    min:=i; //каждый новый проход будем стартовать не рассматривая первый элемент
    for j:=i+1 to n do begin
      if arr[j]< arr[min] then
      begin
        min:=j;
      end;
    end;
    tmp:= arr[i];
    arr[i] := arr[min];
    arr[min]:= tmp;
    i:=i+1;
  end;
end;

procedure merge(var arr:massiv;left,mid,right:integer);
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
    if L[i] <= R[j] then
    begin
      arr[k]:=L[i];
      i:=i+1;
    end
    else
    begin
      arr[k] := R[j];
      j:=j+1;
    end;
    k:=k+1;
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
      merge(arr,left,mid,right);
    end;
  end;
end;



//тело кода
begin

enteringmassiv(mainarr);

WriteLn('please choose one of 2 sort types:');
writeln('1 - SELECTION SORT');
writeln('2 - MERGE SORT');
write('enter your preffered sort:'); 
read(sortkey);

case sortkey of
 1:sortmas1(mainarr);
 2:merge_sort(mainarr, 1,n);
 end;

writeln();
write('sorted sequence: ');
for k:=1 to n do begin
  write(mainarr[k],' ');
end;
end.