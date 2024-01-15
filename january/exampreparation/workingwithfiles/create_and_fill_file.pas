type
  f = file of char;

{ Creating file }
procedure createfile(const filename: string; content: string);
var
  t: f; // file that is going to be created
  i: integer;
begin
  Assign(t, filename);
  Rewrite(t);
  for i := 1 to Length(content) do
  begin
    Write(t, content[i]);
  end;
  Close(t);
end;

// main
begin
  createfile('letters.txt', '567');

end.
