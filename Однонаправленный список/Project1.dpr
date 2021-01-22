program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;
 Type
   Adr=^Zveno;
   Zveno=record
   El1: Char;
  // El2: Integer;
   Adrcled: Adr;
   end;
   var adr1, adrzv:Adr;
   Simv: char;
   i: Integer;
   procedure print (HEad:Adr);
   var
     Current:Adr;
     begin
       Current:=HEad;
       while Current^.Adrcled<>nil do
       begin
         Current:=Current^.Adrcled;
         Writeln(Current^.El1);
       //  Writeln(Current^.El2);
       end;
     end;
     procedure Delete (HEad:Adr) ;
     var
     Current:Adr;
     begin
       HEad:=head^.adrcled;
       Current:=head^.Adrcled;
       head^.Adrcled:=Current^.Adrcled;
     end;
     procedure add_after(Head:Adr);
     var
       current:Adr;
       begin
         New(Current);
         current^.El1:='v';
         current^.Adrcled:=head^.Adrcled;
         Head^.Adrcled:=current;
       end;
begin
  i:=0;
  New(Adr1);
  adrzv:=adr1;
  adrzv^.Adrcled:=nil;
  read(Simv);
  while Simv <> '.' do
  begin
    New(Adrzv^.adrcled);
    adrzv:=adrzv^.Adrcled;
    adrzv^.El1:=Simv;
   // adrzv^.El2:=i;
    adrzv^.adrcled:=nil;
    I:=i+1;
    Read(Simv);
  end;
  print(adr1);
  Delete(adr1);
   print(adr1);
   add_after(adr1);
    print(adr1);
    Writeln(adr1^.el1);
    Writeln(adrzv^.el1);
   Readln;
   Readln;
end.
