object Form1: TForm1
  Left = 426
  Top = 136
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 89
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefaultSizeOnly
  PixelsPerInch = 96
  TextHeight = 13
  object buf: TLabel
    Left = 136
    Top = 48
    Width = 3
    Height = 13
    Visible = False
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 48
    Width = 73
    Height = 41
    ColCount = 1
    Ctl3D = True
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ParentCtl3D = False
    ScrollBars = ssNone
    TabOrder = 0
    OnKeyPress = StringGrid1KeyPress
  end
  object Edit1: TLabeledEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 108
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1077#1088#1096#1080#1085' :'
    TabOrder = 1
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 152
    Top = 8
    Width = 137
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 8
    Width = 97
    Height = 25
    Caption = #1047#1072#1076#1072#1090#1100' '#1074#1088#1091#1095#1085#1091#1102
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 400
    Top = 8
    Width = 75
    Height = 25
    Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 480
    Top = 8
    Width = 105
    Height = 25
    Caption = #1054#1073#1093#1086#1076' '#1074' '#1096#1080#1088#1080#1085#1091
    TabOrder = 5
    OnClick = Button4Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 88
    Top = 48
  end
end
