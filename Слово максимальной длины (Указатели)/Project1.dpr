program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  Mas= array [1..50] of Char;
  Ykaz=^Mas; //Тип указателя на массив
  var
   Vspom, Rez, Tek:Ykaz; // Переменная типа указателя на массив
   Max, I:Integer;
   Byk:Char;
begin
  Max:=0;
  i:=0;
  New(Tek);//Порождение дин. переменной для хранения текущего слова
  New (Rez); //Для хранения максимального из уже прочитанных слов
  repeat
    Read(Byk);
    if(Byk<>' ') And (Byk <> '.')
    then
    begin
      i:=i+1; // счетчик длины текущего слова
      Tek^[i]:=Byk;
    end
    else
    if i>Max then
    begin
      Max:=i;
      Vspom:=Rez;
      Rez:=Tek;
      tek:=Vspom; //массивы меняются местами но физически этого не требуется
      // так как мы просто переносим указатели
      i:=0;
    end;
    until Byk = '.';
    Dispose(Vspom);
    Writeln;
    for i:=1 to MAx do
    write (Rez^[i]);
    Dispose(Rez);
    Readln;
     Readln;
end.
