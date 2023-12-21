program SetExample;

type
  colors = (white, green, brown, yellow);
  el_type = set of colors;

var
  l: el_type;

procedure writeelem(var t: el_type);
var
  c: colors;
  counter:integer;
begin
  for c in t do
  begin
    write(c); write(':'); 
  end;
  write('.');
end;

begin
  l := [green, brown,yellow,white];
  writeelem(l);
end.
