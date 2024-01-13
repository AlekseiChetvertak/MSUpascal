{задача 5 из экзамена}

var x,y,z:integer;
A:record 
  x,y:integer
end;
B:record 
  x:integer
end;
//-----------
procedure P(var x:integer; z:integer);
begin 
x:=11;
y:=12;
z:=13;
with A,B do begin 
  x:=14; y:=15; z:=16;
  end
end;
//-----------
begin x:=1;
y:=2;
z:=3;
A.y:=5;
B.x:=6;
P(z,x);

write(x,y:3,z:3,A.x:3,A.y:3,B.x:3) 
end.