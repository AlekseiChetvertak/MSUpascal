{
  Bubble Sort
Time Complexity: O(n^2)
Space Complexity: O(1)
Notes: Simple and easy to implement, but not efficient for large datasets.
}

program bubblesort;
const n = 5;

type massiv = array [1..n] of integer;

var i, j, goal:integer; //counters
    mas:massiv; //array
    foundmarker:boolean; 

procedure BubbleSort(var a:massiv);
var i,j,tmp:integer;
begin
    for i:=1 to (Length(a)-1) do 
    begin
        for j:=1 to (Length(a)-i) do 
        begin
            if a[j]<a[j+1] then 

                writeln();
                write(a[j],' < ',a[j+1]); 
                Write(' ---> swapped');

                //swap using additional variable.
                tmp:=a[j];
                a[j]:=a[j+1];
                a[j+1]:=tmp;
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

BubbleSort(mas);


//print
writeln();
for i:= 1 to n do
  begin
    write('[',mas[i],']');
  end;



end.