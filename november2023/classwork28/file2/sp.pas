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

q:=p;  
AddToBegin(p,5);

end.
