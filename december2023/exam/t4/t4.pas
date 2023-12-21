type
  Pnode = ^Node;
  Node = record
    elem: integer;
    next: Pnode;
  end;

var f1,f2,tmp:Pnode;

procedure doubleminus(var l1: Pnode; var l2: Pnode);
begin
  while (l1 <> nil) do 
  begin
    if l1^.elem > 0 then 
      doubleminus(l1^.next, l2)
    else 
    begin
      if l2 = nil then
      begin
        new(l2);
        l2^.elem := l1^.elem;
        l2^.next := nil;
      end
      else
      begin
        l2^.next := new(Pnode);
        l2 := l2^.next;
        l2^.elem := l1^.elem;
        l2^.next := nil;
      end;
    end;
    l1 := l1^.next;
  end;
end;




procedure add

//f1 = -5 0 -3 2 3 -4 -6
begin
//заполним прямым методом
new(f1);
new(f2);
f1^.elem:=5;



//doubleminus(l1,l2);
end.