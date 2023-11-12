program tsadf;
{программа ищет площадь треугольника по заданным координатам.}
var ax1,ay1,ax2,ay2,ax3,ay3:real;

function sidelen(x1,x2,y1,y2:real):real;
begin
  sidelen:=sqrt((sqr(x2-x1))+(sqr(y2-y1)));
end;

function s(a,b,c:real):real;
var p:real;
begin
  p:=a+b+c;
  s:=sqrt(p*(p-a)*(p-b)*(p-c));
end;

//main
begin

writeln('enter x and y');
read(ax1); read(ay1);
writeln('enter x and y');
read(ax2); read(ay2);
writeln('enter x and y');
read(ax3); read(ay3);

writeln(s(sidelen(ax1,ax2,ay1,ay2),sidelen(ax2,ax3,ay2,ay3),sidelen(ax3,ax1,ay3,ay1)):00, ' m^2');
end. 