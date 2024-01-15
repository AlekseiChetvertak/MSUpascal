{ 
Linear sorting is rarely used due to its inefficiency. 
Idea: iterate over each element. 
Search difficulty - O(n).

maybe used for small arrays THAT ARE NOT SORTED.
}
program linear_search;
const n = 4;

type m = array [1..n] of integer;
var i,j,goal:integer; //counters
    mas:m; //array
    foundmarker: boolean; 


//main 
begin
foundmarker:= false; //will be true, if found.

//entering array
writeln('type array');
for i := 1 to n do
  begin
    read(mas[i]);
  end;

//entering an element to search
writeln('type what you are looking for: '); read(goal);

//search
for i:=1 to n do
    begin
        if mas[i] = goal then
        begin
            writeln('found:', goal);
            writeln('cell number: ', i);
            foundmarker:=true;
            exit;
        end;
    end;
//if not found, then write a message
if (not(foundmarker)) then writeln('not found');
end. 