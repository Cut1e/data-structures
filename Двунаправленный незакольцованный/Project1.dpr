program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  adr2 = ^Zveno2;
  Zveno2=record
  El: Char;
  Adrcled: adr2;
  Adrprev: adr2;
  end;
  var adr1, adrzv:adr2;
  Simv: char;
  procedure Delete(head:adr2);
  var
    current: adr2;
    begin
      current:=head;
      current^.Adrcled^.Adrprev:=current^.Adrprev;
      current^.Adrprev^.Adrcled:=current^.Adrcled;
      Dispose(current);
    end;
    procedure add_after(head:adr2);
    var current:adr2;
    begin
      New(current);
      current^.El:='v';
      current^.Adrcled:=head^.Adrcled;
      current^.Adrprev:=head;
      head^.Adrcled^.Adrprev:=current;
      head^.Adrcled:=current;


    end;
    procedure search (head:adr2);
    var
      elem: Char;
      current: adr2;
      b: Boolean;
      begin
      elem:='a';
       b:=False;
       current:=head;
       while (current^.Adrcled<>nil) and not b do
       begin
         if current^.el=elem then
         begin
           b:=true;
         end;
       current:=current^.Adrcled;
       end;
       Writeln(b);
      end;
  procedure print_to_end(head:adr2);
  var
    current: adr2;
    begin
      current:=head;
      while current^.adrcled <> nil do
      begin
        current:=current^.Adrcled;
        Writeln(current^.el);
      end;
    end;
    procedure print_of_end(head:adr2);
    var
      current:adr2;
      begin
        current:=head;
        while current^.Adrprev <> nil do
        begin
          Writeln(current^.el);
          current:=current^.Adrprev;
        end;
      end;
begin
New(Adr1);
adrzv:=adr1;
adrzv^.adrprev:=nil;
adrzv^.adrcled:=nil;

Read(Simv);
While Simv <> '.' do
begin
  New (Adrzv^.adrcled);
  adrzv^.Adrcled^.Adrprev:=adrzv;
  adrzv:=adrzv^.Adrcled;
  adrzv^.El:=simv;
  adrzv^.Adrcled:=nil;
  read(simv);
end;
print_to_end(adr1);
search(adr1);
Writeln('____');
print_of_end(adrzv);
Delete(adr1^.Adrcled);
Writeln('D____D');
search(adr1);
print_to_end(adr1);
Writeln('____');
print_of_end(adrzv);
Writeln('A____A');
add_after(adr1);
print_to_end(adr1);
Writeln('____');
print_of_end(adrzv);
Readln;
Readln;
end.
 