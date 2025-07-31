object DebugForm: TDebugForm
  Left = 0
  Top = 0
  Caption = 'DebugForm'
  ClientHeight = 441
  ClientWidth = 548
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
    Width = 529
    Height = 417
    DataSource = DataSourceServices
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object FDQueryServices: TFDQuery
    Left = 544
    Top = 16
  end
  object FDQueryInsert: TFDQuery
    Left = 544
    Top = 48
  end
  object DataSourceServices: TDataSource
    Left = 544
    Top = 88
  end
end
