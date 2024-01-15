type f=file of char;

procedure createnewfile(const filename:string;content:string);
var g:f;
  i:integer;
begin
  assign(g,filename);
  Rewrite(g);
  for i:=1 to Length(content) do
  begin
    write(g,content[i]);
  end;
end;

procedure addtobeg(const origfilename:string; content1:string);
var orig,newf:f;
    a:char;
    i:integer;
begin
  //open the files
  Assign(orig,origfilename);
  Assign(newf, 'temp.txt');
  rewrite(newf);
  reset(orig);

  for i:=1 to Length(content1) do begin
    write(newf,content1[i]);
  end;

  while not(EOF(orig)) do 
  begin
    read(orig,a);
    write(newf,a);
  end;

  Close(orig);
  Close(newf);

  erase(orig);
  rename(newf,origfilename);
end;

//main
begin
  createnewfile('myletter.txt','ca va?');
  addtobeg('myletter.txt', 'Bonjour, ');
end.
