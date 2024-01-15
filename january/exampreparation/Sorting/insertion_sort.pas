{
  Insertion Sort:
Time Complexity: O(n^2)
Space Complexity: O(1)
Notes: Efficient for small datasets or nearly sorted datasets.
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


procedure InsertionSort(var a:massiv);
var i,j:integer;

begin
  for i:=1 to (Length(a)) do 
  begin
    j:=i;
    while ((j>0) and (a[j-1]>a[j])) do
      begin
        swap(a[j],a[j-1]);
        j:=j-1;
      end;
  end;

end;


begin
writeln('type array');
for i := 1 to n do
  begin
    read(mas[i]);
  end;

InsertionSort(mas);


//print
writeln();
for i:= 1 to n do
  begin
    write('[',mas[i],']');
  end;



end.