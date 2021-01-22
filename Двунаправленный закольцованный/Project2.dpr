program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  adr2=^Zveno2;
  Zveno2=record
  el:Char;
  Adrcled:adr2;
  Adrprev:adr2;
  end;
  var
    adr1, adrzv:adr2;
    bykva:char;
    procedure add_after(head:adr2; ell:char);
    var
      current:adr2;
      begin
      New(current);
      current^.el:=ell;
      current^.Adrcled:=head^.Adrcled;
      current^.Adrprev:=head;
      head^.Adrcled^.Adrprev:=current;
      head^.Adrcled:=current;
      end;
         procedure search (head:adr2);
    var
      elem: Char;
      current, q: adr2;
      b: Boolean;
      begin
      elem:='a';
       b:=False;
       current:=head;
       q:=current^.Adrcled;
       while (q<>current) and not b do
       begin
         if q^.el=elem then
         begin
           b:=true;
         end;
       q:=q^.Adrcled;
       end;
       Writeln(b);
      end;
  procedure Delete(head:adr2);
  var
    current: adr2;
    begin
      current:=head;
      current^.Adrcled^.Adrprev:=current^.Adrprev;
      current^.Adrprev^.Adrcled:=current^.Adrcled;
      Dispose(current);
    end;
  procedure print_to_end(head:adr2);
  var
    current: adr2;
    begin
      current:=head;
      while current^.adrcled <> head do
      begin
        current:=current^.Adrcled;
        Writeln(current^.el);
      end;
    end;
begin
  New(adr1);
  adr1^.Adrcled:=adr1;
  Adr1^.Adrprev:=adr1;
  Read(Bykva);
  while bykva<>'.' do
  begin
    add_after(adr1^.Adrprev, bykva);
    Read(bykva);
  end;
  print_to_end(adr1);
  search(adr1);
  Writeln('D____D');
  Delete(adr1^.Adrcled);
  print_to_end(adr1);
  search(adr1);
  readln;
  Readln;
end.
 