object Form1: TForm1
  Left = 200
  Top = 178
  Width = 613
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1074#1077#1088#1096#1080#1085
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 121
    Height = 13
    Caption = #1053#1072#1081#1090#1080' '#1087#1091#1090#1100' '#1080#1079' '#1074#1077#1088#1096#1080#1085#1099
  end
  object Label3: TLabel
    Left = 248
    Top = 48
    Width = 53
    Height = 13
    Caption = #1074' '#1074#1077#1088#1096#1080#1085#1091
  end
  object lblShort: TLabel
    Left = 440
    Top = 136
    Width = 111
    Height = 13
    Caption = #1057#1072#1084#1099#1081' '#1082#1086#1088#1086#1090#1082#1080#1081' '#1087#1091#1090#1100
  end
  object lblLong: TLabel
    Left = 440
    Top = 160
    Width = 108
    Height = 13
    Caption = #1057#1072#1084#1099#1081' '#1076#1083#1080#1085#1085#1099#1081' '#1087#1091#1090#1100
  end
  object Label6: TLabel
    Left = 440
    Top = 184
    Width = 66
    Height = 13
    Caption = #1062#1077#1085#1090#1088' '#1075#1088#1072#1092#1072
  end
  object lbl1: TLabel
    Left = 440
    Top = 88
    Width = 3
    Height = 13
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 88
    Width = 425
    Height = 265
    FixedCols = 0
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 360
    Width = 425
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1087#1091#1090#1077#1081
    TabOrder = 1
    OnClick = Button1Click
  end
  object mmo1: TMemo
    Left = 760
    Top = 288
    Width = 265
    Height = 265
    Lines.Strings = (
      'mmo1')
    TabOrder = 2
    Visible = False
  end
  object nudCount: TEdit
    Left = 80
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = nudCountChange
  end
  object Edit2: TEdit
    Left = 136
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 304
    Top = 48
    Width = 137
    Height = 21
    TabOrder = 5
  end
  object btn1: TButton
    Left = 208
    Top = 8
    Width = 137
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1090#1088#1080#1094#1091
    TabOrder = 6
    OnClick = btn1Click
  end
end
