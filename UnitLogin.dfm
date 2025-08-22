object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = #1060#1086#1088#1084#1072' '#1072#1074#1090#1086#1088#1080#1079#1072#1094#1110#1111
  ClientHeight = 192
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 40
    Width = 93
    Height = 15
    Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  end
  object LabelError: TLabel
    Left = 72
    Top = 168
    Width = 3
    Height = 15
  end
  object EditUsername: TEdit
    Left = 40
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'EditUsername'
  end
  object LoginButton: TButton
    Left = 40
    Top = 112
    Width = 121
    Height = 33
    Caption = #1042#1093#1110#1076
    TabOrder = 1
    OnClick = LoginButtonClick
  end
  object FDQuery1: TFDQuery
    Left = 40
    Top = 8
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=Ora'
      'Database=XE'
      'User_Name=admin'
      'Password=admin')
    LoginPrompt = False
    Left = 8
    Top = 8
  end
end
