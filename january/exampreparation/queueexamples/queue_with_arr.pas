const 
N = 10;//change the size of queue here

type
 queue = record
        elem:array[0..N] of char;
        head:integer;
        tail:integer;
      end;

procedure initqueue (var m:queue);
begin
  m.head := 0;
  m.tail := -1; //initialize -1 to indicate an empty queue
end;

procedure enternumber(a:char; var m:queue);
begin
  if m.tail < N-1 then
  begin
    m.tail := m.tail + 1;
    m.elem[m.tail] := a;
  end
  else
    writeln('queue is full, cant add a char');
end;

procedure deletelem(a:char;var m:queue);

begin
  if m.head <= m.tail then //if there is at least one element
  begin
    a := m.elem[m.head];
    m.head := m.head + 1;
  end
  else 
    writeln('queue is empty. nothing to delete.')
end;

procedure printqueue(var m:queue);
var i:integer;
begin
  for i := m.head to m.tail do begin
    write('[', m.elem[i],']');
  end;
  writeln;
end;

//global
var 
  mainqueue:queue;
  x:char;
  stoppoint:integer;

//main
begin
stoppoint := 0;
initqueue(mainqueue);
writeln('Hello! Enter characters to the queue (you may put up to ', N,' chars). Please, use "." to end the input');
read(x);

while (x <> '.') do begin
  if ((x <> '.') and (x <> ' ')) then
  begin
    enternumber(x,mainqueue);
    stoppoint := stoppoint + 1;
  end;
  read(x);
  if (stoppoint > N) and (x <> '.') then
  begin
    writeln('MISTAKE: queue is full. stopping the program');
    exit;
  end;
end;

writeln('queue: ');
printqueue(mainqueue);

deletelem(x,mainqueue);
writeln('deleted elemenent:', x); 

writeln('queue after deletion: ');
printqueue(mainqueue);

end.