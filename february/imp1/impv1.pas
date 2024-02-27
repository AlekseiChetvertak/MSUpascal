program Main;

uses proceduresv2;

function f(x: real): real;
begin
  f := x*x*x;//x^3
end;

function f1(x: real): real;
begin
  f1 := 3 * x;
end;

function g(x:real):real;
begin
  g:= power(x,3);
end;

//global var
var
  mode:byte;
//main
begin
writeln('type mode: 1 - debug; 0 - run');


end.
