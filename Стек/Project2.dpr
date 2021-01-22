program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type adr2=^stek;
stek=record
el:integer;
adrcled:adr2;
end;
var adr1:adr2;
i: integer;
procedure add(var st:adr2; ell:Integer);
var
  q:adr2;
  begin
    New(q);
    q^.el:=ell;
    q^.adrcled:=st;
    st:=q;
  end;
  procedure del(var st:adr2);
var
  q:adr2;
  begin
   q:=st;
   st:=st^.adrcled;
   Dispose(q);
  end;
  procedure print(st:adr2);
  var
    q:adr2;
    begin
      q:=st;
      while q<> nil do
      begin
        Writeln(q^.el);
        q:=q^.adrcled;
      end;
    end;
begin
 adr1:=nil;
 read(i);
 while i <> 0 do
 begin
   add(adr1,i);
   read(i);
 end;
 Writeln('____');
 print(adr1);
 Del(adr1);
  Writeln('____');
  print(adr1);
 Readln;
 Readln;
end.
 