object UsersForm: TUsersForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110
  ClientHeight = 404
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBGridServices: TDBGrid
    Left = 8
    Top = 16
    Width = 529
    Height = 321
    DataSource = DataSourceServices
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object AddUserButton: TButton
    Left = 8
    Top = 351
    Width = 137
    Height = 34
    Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
    TabOrder = 1
  end
  object FDQueryServices: TFDQuery
    Left = 544
    Top = 16
  end
  object DataSourceServices: TDataSource
    Left = 544
    Top = 88
  end
  object FDQueryInsert: TFDQuery
    Left = 544
    Top = 48
  end
end
