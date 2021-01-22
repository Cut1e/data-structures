program Project2;

 {$APPTYPE CONSOLE}
uses
  SysUtils,
  Windows;

type
  {Тип ключа (тип основных данных) узла дерева.}
  TData = Integer;
  {Тип указателя на узел.}
  TPNode = ^TNode;
  {Тип узла дерева.}
  TNode = record
    Data : TData; {Ключ (основные данные) узла дерева.}
    PLeft, PRight : TPNode; {Указатели на левый и правый узел.}
  end;

{Добавление узла с ключом aData в двоичное дерево поиска.}
procedure AddNode(var aPNode : TPNode; const aData : TData);
begin
  if aPNode = nil then {Вставка узла.}
  begin
    New(aPNode); {Выделяем память для узла.}
    aPNode^.Data := aData;  {Записываем в узел значение ключа.}
    aPNode^.PLeft := nil;  {Обнуляем указатель на левого потомка.}
    aPNode^.PRight := nil; {Обнуляем указатель на правого потомка.}
  end
  else if aData <= aPNode^.Data then {Поиск места вставки в левой ветви.}
    AddNode(aPNode^.PLeft, aData)
  else if aData > aPNode^.Data then  {Поиск места вставки в правой ветви.}
    AddNode(aPNode^.PRight, aData);
end;

{Ввод дерева.}
procedure ReadTree(var aPNode : TPNode);
var
  Data : TData;
  Code : Integer;
  S : String;
begin
  Writeln('Добавление узлов');
  repeat
    Write('Значение: ');
    Readln(S);
    if S <> '' then
    repeat
      Val(S, Data, Code);
      if Code = 0 then {Если ключ задан верно.}
        AddNode(aPNode, Data) {Добавляем узел в дерево.}
      else             {Если ключ задан неверно.}
        Writeln('Неверный ввод. Следует ввести целое число. Повторите.');
    until Code = 0;
  until S = '';
  Write('Ок');
end;

{Рекурсивная процедура для освобождения памяти, занятой деревом. (Удаление дерева).}
procedure TreeFree(var aPNode : TPNode);
begin
  if aPNode = nil then
    Exit;
  TreeFree(aPNode^.PLeft); {Рекурсивный вызов для освобождения памяти в левой ветви.}
  TreeFree(aPNode^.PRight); {Рекурсивный вызов для освобождения памяти в правой ветви.}
  Dispose(aPNode); {Освобождение памяти, занятой для текущего узла.}
  aPNode := nil; {Обнуление указателя на текущий узел.}
end;

{Рекурсивная процедура для распечатки узлов дерева. С обходом слева-направо.}
procedure WritelnNode(const aPNode : TPNode; const aName : String);
begin
  if aPNode = nil then
    Exit;
  Writeln(aName, ': ', aPNode^.Data);
  WritelnNode(aPNode^.PLeft, aName + 'Левый');
  WritelnNode(aPNode^.PRight, aName + 'Правый');
end;

procedure ProHod(const aPNode : TPNode);
begin
  if(aPNode<>nil)
  then begin
    Write(inttostr(apnode.Data)+' ');
    ProHod(aPNode.PLeft);
    ProHod(aPNode.PRight);
  end
end;

procedure ProHod1(const aPNode : TPNode);
begin
 if aPNode = nil then
    Exit;

  prohod1(aPNode^.PLeft);
  prohod1(aPNode^.PRight);
  Write(' '+inttostr(aPNode^.Data));
  end;

procedure ProHod2(const aPNode : TPNode);
begin
 if aPNode = nil then
    Exit;

  prohod2(aPNode^.PLeft);
  Write(' '+inttostr(aPNode^.Data));
  prohod2(aPNode^.PRight);

  end;

  procedure DelFromTree(var Tree: TPNode; Y: Integer);
var Q: TPNode;
  {Поиск самого правого элемента в дереве}
  procedure Del (var W: TPNode);
    begin
      if W^.PRight<>nil
        then
          Del(W^.PRight)
        else
          begin
            Q:=W; {Запоминается адрес для освобождения места в «куче» }
            Tree^.Data:=W^.Data;
            W:=W^.PLeft;
          end;
    end;
begin
  if Tree<>nil
    then
      if Y<Tree^.Data
        then
          DelFromTree(Tree^.Pleft, Y)
        else
          if Y>Tree^.Data
            then
              DelFromTree(Tree^.PRight, Y)
            else
              begin
                Q:=Tree;
                if Tree^.PRight=nil
                  then {Правого поддерева нет}
                    Tree:=Tree^.PLeft
                  else {Левого поддерева нет}
                    if Tree^.PLeft=nil
                      then
                        Tree:=Tree^.PLeft
                      else
                        Del(Tree^.Pleft);
                Dispose(Q);
              end;
end;

var
  PTree : TPNode;
  Cmd, Code,info : Integer;
  S : String;
begin
  {Переключение окна консоли на кодовую страницу CP1251 (Win-1251).
  Если после переключения русские буквы показываются неверно,
  следует открыть системное меню консольного окна - щелчком мыши в левом
  верхнем углу окна консоли и выбрать:
  Свойства - закладка "Шрифт" - выбрать шрифт: "Lucida Console".}
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  {Начальная инициализация дерева.}
  PTree := nil;

  repeat
    {Меню}
    Writeln('Выберите действие:');
    Writeln('1: Создать дерево.');
    Writeln('2: Распечатка узлов дерева с обходом слева-направо.');
    Writeln('3: Обходы:');
    Writeln('4: Удалить узел.');
    Write('Задайте команду: ');
    Readln(S);
    Val(S, Cmd, Code);
    if Code <> 0 then
      Cmd := -1;
    case Cmd of
      1:
      begin
       // TreeFree(PTree);
        ReadTree(PTree);
      end;
      2:
      begin
        WritelnNode(PTree, '0');
      end;
      3:
      begin
        Writeln('RAB');
       ProHod(PTree);
       Writeln;
       Writeln('ABR');
       ProHod1(PTree);
        Writeln;
       Writeln('ARB');
       ProHod2(PTree);

      end;
      4:
      begin
        Writeln('Введите данные для удаления.');
        Readln(info);
       DelFromTree(PTree,info)
      end;
      else
        Write('Незарегистрированная команда. Повторите ввод.');
    end;
    Readln;
  until Cmd = 5;

  Write('Работа программы завершена. Для выхода нажмите Enter.');
  Readln;
end.
