{ 
binary sorting is used often due to speed. 
Idea: devide and check.
Search difficulty - O(log (N)).

ARRAY SHOULD BE SORTED.
}
program linear_search;
const n = 4;

type m = array [1..n] of integer;

var i, j, goal:integer; //counters
    mas:m; //array
    foundmarker:boolean; 

procedure binary_search(a:m; g:integer; var found:boolean);
var high,low,mid:integer;
begin
  high := n;
  low  := 1;

  while (low<>high) do 
  begin
    mid := (high + low) div 2;
    if a[mid] = g then 
    begin
        found := true;
        writeln('found; cell number: ', mid);
        exit;
    end

    else if a[mid] > g then
    begin
        high := mid - 1;
    end

    else if a[mid] < g then
    begin
      low := mid + 1;
    end;
  end;
end;

//main 
begin
foundmarker := false; //will be true, if found.

//entering array
writeln('type array');
for i := 1 to n do
  begin
    read(mas[i]);
  end;

//entering an element to search
writeln('type what you are looking for: '); 
readln(goal);

//search

binary_search(mas,goal,foundmarker);

//if not found, then write a message
if (not(foundmarker)) then writeln('not found');
end. 

