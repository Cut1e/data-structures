program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
tree=^trees;
trees=record
el:integer;
lev,prav:tree;
end;
treep=^treesp;
treesp=record
el:integer;
ltag, rtag:Boolean;
left,right:treep;
end;
var
  adrzv:tree;
  i,j, elem:integer;
  adrzvp:treep;
  procedure add( var head:tree; ell:Integer);
  begin
    if(head=nil) then
  begin
    New(head);
    head^.lev:=nil;
    head^.prav:=nil;
    head^.el:=ell;
  end
  else
  if (ell<head^.el) then
  add(Head^.lev, ell)
  else
  if(ell>head^.el) then
  add(head^.prav, ell);
  end;
  procedure prym_print(var x:tree);
  begin
    if x<>nil then
    begin
      write(x^.el,' ');
      prym_print(x^.lev);
      prym_print(x^.prav);
    end;
  end;
    procedure sim_print(var x:tree);
  begin
    if x<>nil then
    begin
      sim_print(x^.lev);
      write(x^.el,' ');
      sim_print(x^.prav);
    end;
  end;
      procedure obr_print(var x:tree);
  begin
    if x<>nil then
    begin
      obr_print(x^.lev);
      obr_print(x^.prav);
      write(x^.el,' ');
    end;
  end;
  function poisk (k:Integer; var d:tree): Boolean;
  var
    p,q : tree;
    b:Boolean;
    begin
      b:=false;
      p:=d;
      q:=nil;
      if d <> nil then
      repeat
        q:=p;
        if p^.el=k then
        b:=True
        else
        if k<p^.el then
        p:=p^.lev
        else
        p:=p^.prav;
        until b or (p=nil);
        poisk:=b;
    end;
    procedure vkl (k:Integer; var d:tree);
    var
      q,s:tree;
      begin
        if not poisk(k,d) then
        begin
        New(s);
        s^.el:=k;
        s^.lev:=nil;
        s^.prav:=nil;
        if d=nil then
        d:=s
        else
        if k<q^.el then
        q^.lev:=s
        else
        q^.prav:=s;
      end;
      end;
      procedure udder(var d:tree; k:integer);
      var
        q:tree;
        procedure ud(var r:tree);
        begin
          if r^.prav=nil then
          begin
            q^.el:=r^.el;
            q:=r;
            r:=q^.lev;
          end
          else
          ud(r^.prav)
        end;
        begin
          if d = nil then
          writeln ('Taogo zvena netu')
          else
          if k<d^.el then
          udder(d^.lev,k)
          else
          if k>d^.el then
          udder(d^.prav,k)
          else begin
            q:=d;
            if q^.prav=nil then d:=q^.lev
            else
            if q^.lev=nil then
            d:=q^.prav
            else
            ud(q^.lev);
          end;
        end;
begin
adrzv:=nil;
j:=0;
writeln('Vvedite kol-vo elementov');
Readln(elem);
while elem <> 0 do
begin
add(adrzv, elem);
Readln(elem);
end;
Writeln('Pryamoy obhod');
prym_print(adrzv);
writeln;
Writeln('Sim obhod');
sim_print(adrzv);
writeln;
Writeln('Obr obhod');
obr_print(adrzv);
Writeln(poisk(1,adrzv));
udder(adrzv,50);
Writeln('Pryamoy obhod');
prym_print(adrzv);
writeln;
Writeln('Sim obhod');
sim_print(adrzv);
writeln;
Writeln('Obr obhod');
obr_print(adrzv);
readln;
readln;
end.
