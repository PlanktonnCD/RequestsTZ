object OwnerCreateForm: TOwnerCreateForm
  Left = 0
  Top = 0
  Caption = 'OwnerCreateForm'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGridServices: TDBGrid
    Left = 8
    Top = 16
    Width = 465
    Height = 209
    DataSource = DataSourceServices
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGridServicesCellClick
  end
  object DBGridUsers: TDBGrid
    Left = 8
    Top = 231
    Width = 465
    Height = 210
    DataSource = DataSourceUsers
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGridUsersCellClick
  end
  object GiveOwnerAccessButton: TButton
    Left = 479
    Top = 104
    Width = 146
    Height = 49
    Caption = #1053#1072#1076#1072#1090#1080' '#1087#1088#1072#1074#1072#13#10#1074' '#1089#1080#1089#1090#1077#1084#1110
    TabOrder = 2
    OnClick = ButtonAssignOwnerClick
  end
  object ComboBoxRoles: TComboBox
    Left = 479
    Top = 159
    Width = 145
    Height = 23
    TabOrder = 3
    Text = 'ComboBoxRoles'
  end
  object FDQueryServices: TFDQuery
    Left = 512
    Top = 48
  end
  object DataSourceServices: TDataSource
    DataSet = FDQueryServices
    Left = 512
    Top = 16
  end
  object DataSourceUsers: TDataSource
    DataSet = FDQueryUsers
    Left = 544
    Top = 16
  end
  object FDQueryUsers: TFDQuery
    Left = 544
    Top = 48
  end
  object FDQueryAssign: TFDQuery
    Left = 576
    Top = 48
  end
end
