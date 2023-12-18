type tree=^elem;
    elem = record   
            val:integer;
            left:tree;
            right:tree;
            end;
const n=10;
// function entertree(var t:tree);
// begin
//     while i:=0 to n 
// end;

function sum(var t:tree):integer;
var res:integer;
begin
    if t = nil then sum:= 0;
    else 
        sum:=t^val + sum(t^left) + sum(^right);
end;

function max_tree(var h:tree) : integer;
var ml, mr:integer;
begin
    if h <> nil then begin 
    if h^left <> nil then
        ml:=max_tree(h^left);
    if h^right <> nil then
        mr=max_tree(h^right);
    if h^left = h^right then
        max_tree:=h^val //лучше педелать с проверкой на нилл
    else

    end;

end;

procedure create(var t:tree; n:integer);
begin
    if t = nil and n <> 0 then begin
        new(t);
        t^val = n;
        n:=n-1;
    end;
    if n<>0 then  begin
        new(t^left); new(t^right);
        t^left^val:=n;
        t^right^val:=n;
        create(t^right;n-1);
        create(t^left;n-1);
        
    end;
end;

function eq(var T1,T2:tree):boolean;
var ansl,ansr:boolean;
begin
	if (T1 = nil) and (T2=nil) then begin
        
    end;