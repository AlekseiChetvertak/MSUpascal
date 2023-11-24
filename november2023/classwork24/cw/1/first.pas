//16.4
type ref = ^integer;
var p,q,r:ref;

begin
new(p);
new(q);
new(r);
p^:=5;
q^:=4;
r^:=Nil;


end.