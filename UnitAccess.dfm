object AccessForm: TAccessForm
  Left = 0
  Top = 0
  Caption = 'AccessForm'
  ClientHeight = 441
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object DBGridServices: TDBGrid
    Left = 8
    Top = 16
    Width = 497
    Height = 265
    DataSource = DataSourceServices
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGridServicesCellClick
  end
  object DBGridUsersRoles: TDBGrid
    Left = 8
    Top = 287
    Width = 497
    Height = 154
    DataSource = DataSourceUsersRoles
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object AddOwnerButton: TButton
    Left = 511
    Top = 136
    Width = 149
    Height = 41
    Caption = #1053#1072#1076#1072#1090#1080' '#1087#1088#1072#1074#1072
    TabOrder = 2
    OnClick = AddOwnerButtonClick
  end
  object Button1: TButton
    Left = 511
    Top = 16
    Width = 48
    Height = 49
    Caption = '<-'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DataSourceServices: TDataSource
    DataSet = FDQueryServices
    Left = 512
    Top = 16
  end
  object DataSourceUsersRoles: TDataSource
    DataSet = FDQueryUsersRoles
    Left = 592
    Top = 8
  end
  object FDQueryServices: TFDQuery
    Left = 512
    Top = 48
  end
  object FDQueryUsersRoles: TFDQuery
    Left = 544
    Top = 48
  end
end
