//creating a chain
type chain = ^elem;
    elem = record data:integer;
        link:chain;
    end;
var p,q: chain;

begin
    if p<> nil then 
    begin 
    write(p^.data, ' ');
    pr(p^.link);
    end;
end;

procedure AddToBegin(var p:chain; el:integer);
var q:chain;
begin
    new(q); //делаем новый кирпич
    q^.data:=el; //ставим в него значение
    q^.link:=p; // вклиниваем между, направляя новую ссылку
    p:=q; //первый указатель на новый кирпичик 
end;

var AddToTheEnd (var p:chain;el:integer);
var q:chain;
q:=p;
while (q^.link<>nil) do
    begin
       q:q^.link;
        
    end;

begin
//прямой способ
new(p);
p^.data:=2;
new(p^.link);
p^.link^.data:=3;
new(p^.link^.link);
p^.link^.link^.data:=4;
p^.link^.link^.link:=nil;
//используем q, чтобы удобно пробегать по списку 
q:=p; //указатель на начало списка  
AddToBegin(p,5);
while (q<>nil) do
    begin
        writeln(q^.data);
        q:= q^.link;
    end;
end.
