type
  chain = ^elem;elem = record data: integer;link: chain; end;

var
  p, q: chain;
  i: integer;

procedure pr(var p: chain);
begin
  if p <> nil then begin
    write(p^.data, ' ');
    pr(p^.link);
  end;
end;

procedure atb(var p: chain; el: integer);
var
  q: chain;
begin
  new(q);
  q^.data := el;
  q^.link := p;
  p := q;
end;

procedure dtb(var p: chain);
var
  q: chain;
begin
  if p <> nil then begin
    new(q);
    q := p^.link;
    dispose(p);
    p := q;
  end;
end;

procedure ate(var p: chain; el: integer);
var
  q: chain;
begin
  if p^.link = nil then begin
    new(q);
    q^.data := el;
    q^.link := nil;
    p^.link := q;
  end else ate(p^.link, el);
end;

procedure dte(var p: chain); //удаляем последний элемент
begin
  if p <> nil then
    if p^.link = nil then begin
      dispose(p^.link);
      p := nil;
    end else dte(p^.link);
end;

begin
  new(p);
  p^.data := 2;
  new(p^.link);
  p^.link^.data := 3;
  new(p^.link^.link);
  p^.link^.link^.data := 4;
  p^.link^.link^.link := nil;
  
  q := p;
  for i := 1 to 3 do
  begin
    write(q^.data, ' ');
    q := q^.link;
  end;
  
  writeln();
  pr(p);
  
  atb(p, 1);
  
  writeln();
  pr(p);
  
  ate(p, 5);
  
  writeln();
  pr(p);
  
  q := p^.link^.link;
  dispose(p^.link);
  p^.link := q;
  
  writeln();
  pr(p);
  
  dtb(p);
  
  writeln();
  pr(p);
  
  dte(p);
  
  writeln();
  pr(p);
  
  //q:=nil;
  //writeln(q^.data);
end.