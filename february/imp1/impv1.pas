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
  xf1f2,xf1f3,xf2f3:real;
  mode:byte;
//main
begin
writeln('type mode: 1 - debug; 0 - run');
readln(mode);


end.
