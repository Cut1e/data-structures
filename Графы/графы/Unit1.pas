unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ListUnit;

const
  Infinity = 100000; //Бесконечно большое значение
type
  TPoint = record
      Name:Byte;
      X,Y:Integer;
    end;

  Mn=Set of Byte;

    TWay = record
      Name:string;
      Used:Mn;
      Cost:Integer;
    end;

    TList = ^TListRec;

    TListRec = record
      Way:TWay;
      Next:TList;
    end;

  DeykstRes = array of Integer;
  Matr = array of array of Integer;
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    mmo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblLong: TLabel;
    Label6: TLabel;
    lblShort: TLabel;
    nudCount: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure nudCountChange(Sender: TObject);
    function FindWays:TList;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A:Matr; //Матрица смежности
  Ways:TList; //Список путей
implementation

{$R *.dfm}

 //Новый список
  function NewList : TList;
  begin
    New(Result);
    Result^.Next:=nil;
  end;

  //Добавление элемента в список
  procedure AddToList(Way:TWay; var List:TList);
  var
    x:TList;
  begin
    x:=List;

    //Ищим конц списка
    while x^.Next<> nil do
      x:=x^.Next;

    //Добавляем
    New(x^.Next);
    x^.Next^.Way:=Way;
    x^.Next^.Next:=nil;
  end;

  procedure AddToSortedList(Way:TWay; var List:TList);
  var
    x,y:TList;
  begin
    x:=List;

    //Ищим точку вставки списка
    while (x^.Next<> nil) and (x^.Next.Way.Cost < Way.Cost) do
      x:=x^.Next;

    //Добавляем
    New(y);
    y^.Way:=Way;
    y^.Next:=x^.Next;
    x^.Next:=y;
  end;


//Центр Ор. графа
function GraphCenter (FloidRes:Matr):Byte;
var
  MaxWay:array of Integer; //Самый длинный путь из данной вершины
  i,j:Integer;
begin
  SetLength(MaxWay,High(A)+1);
  //Поиск самы длинных маршрутов для каждой вершины
  for i:= 0 to High(A)  do
  begin
    MaxWay[i]:=FloidRes[0,i];
    for j:= 0 to High(A) do
      if MaxWay[i] < FloidRes[j,i] then
        MaxWay[i]:= FloidRes[j,i];
  end;

  //Наимньший из ниабольших путей
  Result:=0;
  for i := 0 to High(A) do
    if MaxWay[i] < MaxWay[Result] then
      Result:=i;
end;

//Алгоритм Флойда
function Floid:Matr;
var
  i,j,k:Integer;
begin
  SetLength(Result,High(A)+1,High(A)+1);
  //Начальные зачения из матрицы цен
  for i:= 0 to High(A) do
    for j:= 0 to High(A) do
      Result[i,j]:=A[i,j];

  //Сам алгоритм
  for k:=0 to High(A) do
    for i:= 0 to High(A) do
      for j := 0 to High(A) do
        if Result[i,k] + Result[k,j] < Result[i,j] then
          Result[i,j]:= Result[i,k] + Result[k,j];
end;

//Алгоритм Дейкстры
function Deykstra(start:Byte; out Way:DeykstRes) : DeykstRes;
var
  Used: Mn; //Множество посещённых вершин
  i,j,min:integer;
begin
  Used:= [];
  SetLength(Result,High(A)+1); //Размерность результата
  SetLength(Way,High(A)+1);
  for i := 0 to High(Result) do
  begin
    Result[i]:=A[start,i];    //Прямые пути
    Way[i]:=start;
  end;

  for j := 0 to High(A) do    //Текщей должна побывать каждая вершина
  begin
    Used:=Used + [start];
    //Для каждого соседа тек. вершины
    for i := 0 to High(Result) do
      if Not (i in Used) then //Вешина ещё в графе
        if Result[i] > Result[start] + A[start,i] then
        begin
          Result[i] := Result[start] + A[start,i];
          Way[i]:=start;
        end;
    //Сл. вершина  - минимальная ещё принадлежащая  графу
    min:=MaxInt;
    for i := 0 to High(Result) do
      if Not (i in Used) And (Result[i] < min) then
      begin
        min:=Result[i];
        start:=i;
      end;
  end;
end;


//Посик путей между вершинами
function Tform1.FindWays:TList;
var
  Src, Dest: Integer;
  NullWay:TWay;

  procedure FindRoute(V: Integer; Way:TWay);
  var
    i: Integer;
    NewWay:TWay;
  begin
    if V = Dest then                   //Нашли
      AddToSortedList(Way,Ways)
    else
    for i := 0 to High(A[V]) do     //Для каждой вершины
      if (A[V, i] <> Infinity) and Not( i in Way.Used) then        //Туда есть переход и там ещё не были
      begin
        NewWay.Used:= Way.Used + [i];
        NewWay.Name:= Way.Name + IntToStr(i) + ' ';
        NewWay.Cost:=Way.Cost + A[V,i];
        FindRoute(i,NewWay);
      end;
  end;

begin
  Ways:=NewList;
  mmo1.Clear;
  Src := StrToInt(Edit2.Text); //Вершина - источник
  Dest := StrToInt(Edit3.Text);//Вершина приемник
  with NullWay do
  begin
    Name:= IntToStr(Src) + ' ';
    Cost:=0;
    Used:= [Src];
  end;
  FindRoute(Src,NullWay);
  Result:=Ways;
end;

procedure TForm1.Button1Click(Sender: TObject);
  var
  i,j:integer;
  Rez:Integer;
  Code:Integer;
  x,Ways:TList;
  ShortWay,Way:DeykstRes;
  WayName:string;
  Center:Byte;
begin
 //Задание размеров матрицы
  SetLength (A,StringGrid1.RowCount,StringGrid1.RowCount);

  //Заполнение матрицы
  for i:= 0 to StringGrid1.RowCount - 1 do
    for j:=0 to StringGrid1.ColCount -1 do
    begin
      Val(StringGrid1.Cells[j,i],Rez,Code);     //Проверка допустимости ввода
      if Code = 0 then
        if Rez = 0 then //Нет связи - 255
          A[i,j]:=Infinity
        else
          A[i,j]:=Rez
      else
      begin
         MessageDlg('Недопустимое значение в ячейке (' + IntToStr(i+1) + ',' + IntToStr(j+1) + ')' ,  mtError,
      [mbOK], 0);
        Exit;
      end;
    end;

  //Все пути
  Ways:=FindWays;
  //Вывод путей
  x:=Ways^.Next;
  while x<> nil do
  begin
    lbl1.Caption:=lbl1.Caption+IntToStr(x^.Way.Cost) + ' - ' + x^.Way.Name+#13#10 ;
    mmo1.Lines.Add( IntToStr(x^.Way.Cost) + ' - ' + x^.Way.Name );
    x:=x^.Next;
  end;

  //Самый длинный путь
  x:=Ways;
  while x^.Next<> nil do
    x:=x^.Next;
  lblLong.Caption:= 'Самый длинный путь: ' + x^.Way.Name + '(' +
                                      IntToStr(x^.Way.Cost) + ')';
  //Находим кратчайший путь ( алгоритм Дейкстры)
  ShortWay:=Deykstra(StrToInt(Edit2.Text),Way);
  lblShort.Caption:= 'Самый короткий путь: ';
  //Выводим сам путь
  WayName:= Edit3.Text;
  i:=Way[StrToInt(Edit3.Text)];
  while i <> StrToInt(Edit2.Text) do
  begin
    WayName:=WayName + IntToStr(i);
    i:=Way[i];
  end;
  WayName := WayName + Edit2.Text;
  //Разворачиваем строку
  for i:= Length(WayName) downto 1 do
    lblShort.Caption:=lblShort.Caption + WayName[i] + ' ';
  //Бесконечность - пути нет
  lblShort.Caption:=lblShort.Caption +'(' +  IntToStr(ShortWay[StrToInt(Edit3.Text)]) + ')' ;


  //Центр графа
  Center:= GraphCenter(Floid);
  Label6.Caption:='Центр графа: ' + IntToStr(Center);

  //Рисуем граф


 // StringGrid1.SaveToFile('d.txt')
end;


procedure TForm1.nudCountChange(Sender: TObject);
begin
   //Размеры stg1
 // StringGrid1.RowCount := StrToInt(nudCount.Text);
  //StringGrid1.ColCount:= StrToInt(nudCount.Text);
  //Edit2.MaxValue:= StrToInt(nudCount.Text)-1;
  //Edit3.MaxValue:= StrToInt(nudCount.Text)-1;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
   //Начальное заполнение

  mmo1.Clear;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
StringGrid1.RowCount := StrToInt(nudCount.Text);
  StringGrid1.ColCount:= StrToInt(nudCount.Text);
end;

end.
