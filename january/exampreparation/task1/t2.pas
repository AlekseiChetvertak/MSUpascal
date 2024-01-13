{задача из лекций: проверить количество вхождений слова the в текст}

function lookForTHE(i:integer):integer;
var prev1,prev2,cur:char;
    counter:Integer;
begin
  prev1   := ' ';
  prev2   := ' ';
  cur     := ' ';
  counter := 0; 
  //цикл
  repeat
  begin
    read(cur);
    if (cur = 'e') then
    writeln('flag: firstif');
    begin
      if((prev1 = 'h') and (prev2 = 't')) then
      begin
        counter:=counter+1;
      end;
    end;
    prev2:=prev1;
    prev1:=cur; 
  end;
  until (cur = '.'); 
  lookForTHE:=counter;
end;

begin
writeln('enter a text and it will count amount of <<the>> in a text');
writeln('number of the found: ',lookForTHE(1));
end.