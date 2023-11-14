{сколько разных гласных букв встречается}
{идея: паскаль видит только одно вхождение элемента множества, пользуемся этим}
program work;
type M = set of 'a'..'z';
var 
gl:M; 
i,a:char;
k  :integer;

begin 
  gl:=[];
  k:=0;
  read(a);
  while a <> '.' do 
  begin
    if a in ['a','u','o','e','i'] then gl:= gl+[a]; // тк только множество + множество
    read(a);
  end;
  for i:='a' to 'z' do 
  begin
    if i in gl then k:=k+1;
  end; 
  writeln(k);
end.
