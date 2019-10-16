object Form2: TForm2
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1053#1072#1095#1072#1083#1100#1085#1103' '#1074#1077#1088#1096#1080#1085#1072
  ClientHeight = 65
  ClientWidth = 169
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 154
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1074#1077#1088#1096#1080#1085#1091':'
  end
  object Edit1: TEdit
    Left = 0
    Top = 16
    Width = 169
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 32
    Top = 40
    Width = 105
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = Button1Click
  end
end
