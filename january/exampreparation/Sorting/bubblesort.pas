{
Bubble sort has a time complexity of O(n^2) 
in the worst and average cases.
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
            begin

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