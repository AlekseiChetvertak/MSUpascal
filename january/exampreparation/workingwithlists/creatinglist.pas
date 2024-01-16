type list = ^node;
node = record
    elem:char;
    next:list;
end;
//-----------------------------
procedure AddNode(var head:list; val:char);
var newNode:list;
begin
  if head = nil then 
  begin
    new(newNode);
    newNode^.elem := val;
    newNode^.next := nil;
    head := newNode;
  end
  else 
  AddNode(head^.next, val);
end;
//-----------------------------
procedure printlist(head:list);
begin
  while head <> nil do 
  begin
    write('[', head^.elem, '|', 'next] ');
    write('--->');
    head := head^.next;
  end;
end;
//-----------------------------
procedure freelist(var head:list);
var
temp:list;
begin
  while head <> nil do
    begin
      temp := head;
      head := head^.next;
      Dispose(temp);
    end;
end;
//-----------------------------
var 
mylist:list;
inputchar:char;

//main
begin
//input
  writeln('please input a char(dot means the end of an input)');
  repeat
    read(inputchar);
    if ((inputchar <> '.') and (inputChar <> ' '))then
    begin
      AddNode(mylist, inputchar);
    end
  until (inputchar = '.');

//printing
printlist(mylist);

//clearing memory
freelist(mylist);
end.

