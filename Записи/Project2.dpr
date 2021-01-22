program Project2;

{$APPTYPE CONSOLE}
uses
  SysUtils;

type
  //Запись без вариантов
  Data=record
  God:1900..2000;
  Mes:(Jn,Fb,Ap,Ma,Jan,Jl,Ag,Sp,Oc,Nv,Dc);
  Den: 1..31;
  end;
  Anketa=record
  Fio:record
  Fam: string[20];
  Im: string[20];
  Ot: string[20];
  end;
  Pol:(Man, Woman);
  Data_r:Data;
  Prof: string[20];
  end;

  //Запись с вариантами
  Anketa1=record
   Fio:record
  Fam: string[20];
  Im: string[20];
  Ot: string[20];
  end;
  Case Pol:(Men, Women) of
  Men: (Vozr1:20..30);
  Women: (Vozr2:18..25);
  end;
  //Константа-запись
  const
    D:Data = (God:1950; Mes: Jn; Den:3);
Var
  D1: Anketa;
  D2:Anketa1;
begin
  {
  Можно сделать через цикл, тогда будет
  Spisok: Array[1..100] of Anketa;
  for i:=1 to 100 do
  Writeln (Spisok[i].Fio.Fam, Spisok[i].Fio.IM, Spisok[i].Fio.ot);

  Можно еще для перечесления использовать With
  With D1 DO
  begin
    ТО ЖЕ самое только без D1
    end;

    Либо With D1,FIO,Data_R do
    ...
  }
 D1.Fio.Fam:='Butsayev';
 D1.Fio.Im:='Vladislav';
 D1.Fio.Ot:='Igorevich';
 D1.Pol:=Man;
 D1.Data_r.God:=1999;
 D1.Data_r.Mes:=Jn;
 D1.Data_r.Den:=14;
 D1.Prof:='Proger';
 D2.Pol:=Men;
 case D2.Pol of
 Men:
 begin
 D2.Vozr1:=20;
 end;
 Women:
 begin
 D2.Vozr2:=22;
 end;
 end;
 write(D1.fio.IM);
 write(D2.Vozr1);
 write(D2.Vozr2);
 Readln;
end.
