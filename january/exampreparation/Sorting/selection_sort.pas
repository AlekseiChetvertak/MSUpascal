{
Bubble sort has a time complexity of O(n^2) 
in the worst and average cases.
}

program selectionsort;
const n = 5;

type massiv = array [1..n] of integer;

var i, j, goal:integer; //counters
    mas:massiv; //array
    foundmarker:boolean; 

procedure swap(var a,b:integer);
var tmp:integer;
begin
  tmp:=a;
  a:=b;
  b:=tmp;
end;


procedure selectionsort(var a:massiv);
var i,j,minIndex:integer;
begin
  for i:=1 to (Length(a)-1) do begin
    minIndex:=i;
    for j:=i+1 to (Length(a)) do begin

      if a[j]< a[minIndex] then
      begin
        minIndex:=j;
      end;

      if minIndex <> i then
      begin
        swap(a[i],a[minIndex]);
      end;

    end;
  end;
end;


begin
writeln('type array');
for i := 1 to n do
  begin
    read(mas[i]);
  end;

selectionsort(mas);


//print
writeln();
for i:= 1 to n do
  begin
    write('[',mas[i],']');
  end;



end.