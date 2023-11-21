program filesofchars;
type F = file of char;
var t:F;
	x,i:integer;
    fileName: string;
    characters: string;
    g:char;
procedure CreateCharFile(const fileName: string; const chars: string);
var
  t: F;
  i: Integer;
begin
  Assign(t, fileName);
  // Create a new file or overwrite an existing one
  Rewrite(t);
  
  // Write characters to the file
  for i := 1 to Length(chars) do
    Write(t, chars[i]);
  
  // Close the file
  Close(t);
end;

function balance(var m:F):boolean;
var val: char;
    open,close:integer;
begin
val:='0';
reset(m);
open:=0;
close:=0;
while not eof(m) do begin
    
    read(m,val);
    if val = '(' then 
    begin 
        open := open + 1;
        writeln('found (', 'open = ', open);
    end else if val = ')' then
    begin
        close := close+1;
        writeln('found )', 'close = ', close);
    end;
    end;
    
if (open = close) then 
        balance := true
        else 
        balance := false;
end;
//main		
begin 
  fileName := 'MyCharFile.txt';
  characters := 'ABCDE';
  CreateCharFile(fileName, characters);

  writeln('File created successfully.');
//balance(t);
assign(t,fileName);
reset(t);
while not eof(t) do 
begin
    read(t,g);
    writeln(g);
end;
close(t);
end.