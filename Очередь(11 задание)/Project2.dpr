program Project2;

{$APPTYPE CONSOLE}
uses
SysUtils,
Windows;
type
adr2=^Zveno;
zveno=record
el:Integer;
adrcled:adr2;
end;
var
left2,right2, left, right: adr2;
bykva,i,j:Integer;
procedure add ( var right:adr2; ell:Integer);
var
current, cur:adr2;
begin
new(current);
right^.adrcled:=current;
current^.adrcled:=nil;
current^.el:=ell;
right:=current;
end;
procedure sort (left:adr2);
var
current,q:adr2;
begin
New(q);
current:=left;
while current^.adrcled <> nil do
begin
if current^.el<current^.adrcled^.el then
begin
q^.el:=current^.el;
current^.el:=current^.adrcled^.el;
current^.adrcled^.el:=q^.el;
current:=current^.adrcled;
end
else
current:=current^.adrcled;
end;
end;
procedure print(left:adr2);
var current:adr2;
begin
current:=left;
while current <> nil do
begin
Writeln(current^.el);
current:=current^.adrcled;
end;
end;
procedure print2(left:adr2);
var current:adr2;
begin
current:=left^.adrcled;
while current <> nil do
begin
Writeln(current^.el);
current:=current^.adrcled;
end;
end;
procedure tostack(var right:adr2; var left2:adr2);
var
current,q: adr2;
begin
New(q);
current:=left2;
q^.el:=current^.el;
right^.adrcled:=q;
q^.adrcled:=nil;
right:=q;
left2:=left2^.adrcled;
Dispose(current);
end;
procedure Delete (var left:adr2);
var current:adr2;
begin
current:=left;
left:=left^.adrcled;
Dispose(current);
end;

begin
i:=0;
Read(bykva);
i:=i+1;
New(left);
Left^.adrcled:=nil;
left^.el:=bykva;
right:=left;
read(bykva);
i:=i+1;
while bykva<> 0 do
begin
add(right,bykva);
read(Bykva);
i:=i+1;
end;
New(left2);
left2^.adrcled:=nil;
right2:=left2;
Writeln('___');
print(left);
for j:=0 to i do
sort(left);
for j:=0 to i-2 do
tostack(right2,left);
Writeln('___');
print2(left2);
Readln;
Readln;
end.
