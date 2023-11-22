{создать файл и перезаписать в обратном порядке}

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
  Close(t);
end;



procedure reversefile(m:F);
    procedure print; //вспомогательная процедура 
    var h:integer;
    begin
    if not eof(f) then 
    begin 
        read(t, h); 
        print;
        write(h, '_');
    end;
begin 
    reset(m);
    print;
end;





//main		
begin 
  fileName := 'MyCharFile.txt';
  characters := '123456789';
  CreateCharFile(fileName, characters);

  writeln('File created successfully.');

assign(t,fileName);
reversefile(t);

end.
