const
    eps1 = 0.001;
    eps2 = 0.001;
    test = True;
type
    MathFun = function (x: real): real;

function f1(x: real): real; begin f1 := 2/(x + 1) + 3 end;
function df1(x: real): real; begin df1 := -2/(x + 1)**2 end;

function f2(x: real): real; begin f2 := 2.5*x - 9.5 end;
function df2(x: real): real; begin df2 := 2.5 end;

function f3(x: real): real; begin f3 := 5/x end;
function df3(x: real): real; begin df3 := -5/x**2 end;


function root(fun1, fun2, der1, der2: MathFun; a, b: real): real;
var
    n: integer;
    guess1, guess2: real;
begin
    guess2 := (a + b)/2;
    repeat begin
        n += 1;
        guess1 := guess2;
        guess2 -= (fun1(guess2) - fun2(guess2)) / (der1(guess2) - der2(guess2));
    end until (abs(guess2 - guess1) < eps1) or (guess2 < a) or (guess2 > b);
    root := guess2;
end;

function integral(f: MathFun; a, b: real; check: Boolean := False): real;
var
    n, i: integer;
    I1, I2: real;
begin
    repeat begin
        n += 2;
        I1 := I2;
        I2 := 0;
        for i := 1 to n - 1 do
            I2 += 2**(1 + (i mod 2)) * f(a + i * (b - a) / n);
        I2 := (b - a) * (f(a) + I2 + f(b)) / (3 * n);
    end until abs(I2 - I1) < eps2;
    if check then
        writeln(n, ': ', I2);
    integral := I2;
end;

var
    UpperArea, LowerArea: real;
begin
    if test then begin
        writeln('Positive roots:');
        writeln(root(f1, f3, df1, df3, 1, 2));
        writeln(root(f1, f2, df1, df2, 5, 6));
        writeln(root(f2, f3, df2, df3, 4, 5));
        writeln;
        writeln('Negative roots:');
        writeln(root(f1, f3, df1, df3, -1.4, -1));
        writeln(root(f1, f2, df1, df2, -1.2, -1));
        writeln(root(f2, f3, df2, df3, -1, 0));
        writeln;
        writeln('Upper surface:');
    end;
    UpperArea := integral(f1, root(f1, f3, df1, df3, 1, 2), root(f1, f2, df1, df2, 5, 6), test) +
                         integral(f2, root(f1, f2, df1, df2, 5, 6), root(f2, f3, df2, df3, 4, 5), test) +
                         integral(f3, root(f2, f3, df2, df3, 4, 5), root(f1, f3, df1, df3, 1, 2), test);
    
    if test then begin
        writeln;
        writeln('Lower surface:');
    end;
    LowerArea := -(integral(f1, root(f1, f3, df1, df3, -1.4, -1), root(f1, f2, df1, df2, -1.2, -1), test) +
                            integral(f2, root(f1, f2, df1, df2, -1.2, -1), root(f2, f3, df2, df3, -1, 0), test) +
                            integral(f3, root(f2, f3, df2, df3, -1, 0), root(f1, f3, df1, df3, -1.4, -1), test));
    
    if test then writeln;
    writeln('Area of upper curvilinear triangle: ', UpperArea);
    writeln('Area of lower curvilinear triangle: ', LowerArea);
    writeln('Total area: ', UpperArea + LowerArea);
end.